/*
 * Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

/**
 * @file subscribe_publish_sample.c
 * @brief simple MQTT publish and subscribe on the same topic
 *
 * This example takes the parameters from the aws_iot_config.h file and
 * establishes a connection to the AWS IoT MQTT Platform.
 * It subscribes and publishes to the same topic - "sdkTest/sub"
 *
 * If all the certs are correct, you should see the messages received by the
 * application in a loop.
 *
 * The application takes in the certificate path, host name , port and the
 * number of times the publish should happen.
 *
 */
#include <unistd.h>
#include <string.h>

#include "aws_iot_config.h"
#include "aws_iot_log.h"
#include "aws_iot_version.h"
#include "aws_iot_mqtt_client_interface.h"
#include <ti/drivers/apps/Button.h>
#include "ti_drivers_config.h"

#define HOST_ADDRESS_SIZE 255
#define CONFIG_BUTTON_0  0

/**
 * @brief Default MQTT HOST URL is pulled from the aws_iot_config.h
 */
bool is_taken = false;

static char HostAddress[HOST_ADDRESS_SIZE] = AWS_IOT_MQTT_HOST;

/**
 * @brief Default MQTT port is pulled from the aws_iot_config.h
 */
static uint32_t port = AWS_IOT_MQTT_PORT;

/**
 * @brief This parameter will avoid infinite loop of publish and exit the
 *          program after certain number of publishes
 */
static uint32_t publishCount = 10;

static void iot_subscribe_callback_handler(AWS_IoT_Client *pClient,
        char *topicName, uint16_t topicNameLen,
        IoT_Publish_Message_Params *params, void *pData)
{
    IOT_UNUSED(pData);
    IOT_UNUSED(pClient);
    IOT_INFO("Subscribe callback");
    IOT_INFO("%.*s\t%.*s",topicNameLen, topicName, (int)params->payloadLen,
            (char *)params->payload);
}

static void disconnectCallbackHandler(AWS_IoT_Client *pClient, void *data)
{
    IOT_WARN("MQTT Disconnect");
    IoT_Error_t rc = FAILURE;

    if (NULL == pClient) {
        return;
    }

    IOT_UNUSED(data);

    if (aws_iot_is_autoreconnect_enabled(pClient)) {
        IOT_INFO(
            "Auto Reconnect is enabled, Reconnecting attempt will start now");
    }
    else {
        IOT_WARN("Auto Reconnect not enabled. Starting manual reconnect...");
        rc = aws_iot_mqtt_attempt_reconnect(pClient);
        if (NETWORK_RECONNECTED == rc) {
            IOT_WARN("Manual Reconnect Successful");
        }
        else {
            IOT_WARN("Manual Reconnect Failed - %d", rc);
        }
    }
}

void buttonCallbackFxn(Button_Handle handle, Button_EventMask events)
{
       if (events & Button_LONGPRESSED)
       {
           //Recieved a press, toggle the flag
           is_taken = !is_taken;
       }
}

void runAWSClient(void)
{
    bool infinitePublishFlag = true;
    char *topicName = "GeorgiaTech/";
    int topicNameLen = strlen(topicName);
    char cPayload[100];
    int i = 0;
    IoT_Error_t rc = FAILURE;

    //Initialize the button configurations
    Button_Params params;
    Button_Handle handle;
    Button_Params_init(&params);
    handle = Button_open(CONFIG_BUTTON_0, buttonCallbackFxn, &params);

    AWS_IoT_Client client;
    IoT_Client_Init_Params mqttInitParams = iotClientInitParamsDefault;
    IoT_Client_Connect_Params connectParams = iotClientConnectParamsDefault;

    IoT_Publish_Message_Params paramsQOS0;
    IoT_Publish_Message_Params paramsQOS1;

    IOT_INFO("\nAWS IoT SDK Version %d.%d.%d-%s\n", VERSION_MAJOR,
            VERSION_MINOR, VERSION_PATCH, VERSION_TAG);

    mqttInitParams.enableAutoReconnect = false; // We enable this later below
    mqttInitParams.pHostURL = HostAddress;
    mqttInitParams.port = port;
    mqttInitParams.pRootCALocation = AWS_IOT_ROOT_CA_FILENAME;
    mqttInitParams.pDeviceCertLocation = AWS_IOT_CERTIFICATE_FILENAME;
    mqttInitParams.pDevicePrivateKeyLocation = AWS_IOT_PRIVATE_KEY_FILENAME;
    mqttInitParams.mqttCommandTimeout_ms = 20000;
    mqttInitParams.tlsHandshakeTimeout_ms = 5000;
    mqttInitParams.isSSLHostnameVerify = true;
    mqttInitParams.disconnectHandler = disconnectCallbackHandler;
    mqttInitParams.disconnectHandlerData = NULL;

    rc = aws_iot_mqtt_init(&client, &mqttInitParams);
    if (SUCCESS != rc) {
        IOT_ERROR("aws_iot_mqtt_init returned error : %d ", rc);
    }

    connectParams.keepAliveIntervalInSec = 600;
    connectParams.isCleanSession = true;
    connectParams.MQTTVersion = MQTT_3_1_1;
    connectParams.pClientID = AWS_IOT_MQTT_CLIENT_ID;
    connectParams.clientIDLen = (uint16_t)strlen(AWS_IOT_MQTT_CLIENT_ID);
    connectParams.isWillMsgPresent = false;

    IOT_INFO("Connecting...");
    rc = aws_iot_mqtt_connect(&client, &connectParams);
    if (SUCCESS != rc) {
        IOT_ERROR("Error(%d) connecting to %s:%d", rc, mqttInitParams.pHostURL,
                mqttInitParams.port);
    }

    /*
     *  Enable Auto Reconnect functionality. Minimum and Maximum time of
     *  exponential backoff are set in aws_iot_config.h:
     *  #AWS_IOT_MQTT_MIN_RECONNECT_WAIT_INTERVAL
     *  #AWS_IOT_MQTT_MAX_RECONNECT_WAIT_INTERVAL
     */
    rc = aws_iot_mqtt_autoreconnect_set_status(&client, true);
    if (SUCCESS != rc) {
        IOT_ERROR("Unable to set Auto Reconnect to true - %d", rc);
    }

    IOT_INFO("Subscribing...");
    rc = aws_iot_mqtt_subscribe(&client, topicName, topicNameLen, QOS0,
            iot_subscribe_callback_handler, NULL);
    if (SUCCESS != rc) {
        IOT_ERROR("Error subscribing : %d ", rc);
    }

    sprintf(cPayload, "%s : %d ", "hello from SDK", i);

    paramsQOS0.qos = QOS0;
    paramsQOS0.payload = (void *)cPayload;
    paramsQOS0.isRetained = 0;

    paramsQOS1.qos = QOS1;
    paramsQOS1.payload = (void *)cPayload;
    paramsQOS1.isRetained = 0;

    if (publishCount != 0) {
       infinitePublishFlag = false;
    }

    while ((NETWORK_ATTEMPTING_RECONNECT == rc || NETWORK_RECONNECTED == rc ||
            SUCCESS == rc) && (publishCount > 0 || infinitePublishFlag)) {
        // Max time the yield function will wait for read messages
        rc = aws_iot_mqtt_yield(&client, 100);

        if (NETWORK_ATTEMPTING_RECONNECT == rc) {
            // If the client is attempting to reconnect, skip rest of the loop
            continue;
        }

        IOT_INFO("-->sleep");
        sleep(1);
        // JSON formatting do this for printf quotes \"message\"
        // Make sure everything is in quotes
        if(is_taken){
            sprintf(cPayload, "{\"Building\" : %s, \"Floor\" : %s, \"DeviceID\" : %s, \"Status\" : %s}","\"CULC\"","\"3\"", "\"B\"", "\"true\"");
        } else {
            sprintf(cPayload, "{\"Building\" : %s, \"Floor\" : %s, \"DeviceID\" : %s, \"Status\" : %s}","\"CULC\"","\"3\"", "\"B\"", "\"false\"");
        }
        /* Recalculate string len to avoid truncation in subscribe callback */
        paramsQOS0.payloadLen = strlen(cPayload);
        rc = aws_iot_mqtt_publish(&client, topicName, topicNameLen,
                &paramsQOS0);
        if (publishCount > 0) {
           publishCount--;
        }

        if(publishCount == 0 && !infinitePublishFlag) {
            break;
        }

//        sprintf(cPayload, "%s : %d ", "hello from SDK QOS1", i++);
//        // Recalculate string len to avoid truncation in subscribe callback
//        paramsQOS1.payloadLen = strlen(cPayload);
//
//        rc = aws_iot_mqtt_publish(&client, topicName, topicNameLen,
//                &paramsQOS1);
//        if (rc == MQTT_REQUEST_TIMEOUT_ERROR) {
//            IOT_WARN("QOS1 publish ack not received.\n");
//            rc = SUCCESS;
//        }
//        if (publishCount > 0) {
//            publishCount--;
//        }
    }

    // Wait for all the messages to be received
    aws_iot_mqtt_yield(&client, 100);

    if (SUCCESS != rc) {
        IOT_ERROR("An error occurred in the loop. Error code = %d\n", rc);
    }
    else {
        IOT_INFO("Publish done\n");
    }
}
