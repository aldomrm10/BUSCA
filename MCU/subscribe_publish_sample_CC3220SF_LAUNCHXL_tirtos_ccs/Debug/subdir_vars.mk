################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Add inputs and outputs from these tool invocations to the build variables 
CMD_SRCS += \
../CC3220SF_LAUNCHXL_TIRTOS.cmd 

SYSCFG_SRCS += \
../aws_iot.syscfg 

C_SRCS += \
./syscfg/ti_net_config.c \
./syscfg/ti_drivers_net_wifi_config.c \
./syscfg/ti_drivers_config.c \
../aws_iot_json_utils.c \
../aws_iot_mqtt_client.c \
../aws_iot_mqtt_client_common_internal.c \
../aws_iot_mqtt_client_connect.c \
../aws_iot_mqtt_client_publish.c \
../aws_iot_mqtt_client_subscribe.c \
../aws_iot_mqtt_client_unsubscribe.c \
../aws_iot_mqtt_client_yield.c \
../aws_iot_shadow.c \
../aws_iot_shadow_actions.c \
../aws_iot_shadow_json.c \
../aws_iot_shadow_records.c \
../jsmn.c \
../main_tirtos.c \
../network.c \
../network_sl.c \
../platform.c \
../startsntp.c \
../subscribe_publish_sample.c \
../timer.c \
../uart_term.c 

GEN_FILES += \
./syscfg/ti_net_config.c \
./syscfg/ti_drivers_net_wifi_config.c \
./syscfg/ti_drivers_config.c 

GEN_MISC_DIRS += \
./syscfg/ 

C_DEPS += \
./syscfg/ti_net_config.d \
./syscfg/ti_drivers_net_wifi_config.d \
./syscfg/ti_drivers_config.d \
./aws_iot_json_utils.d \
./aws_iot_mqtt_client.d \
./aws_iot_mqtt_client_common_internal.d \
./aws_iot_mqtt_client_connect.d \
./aws_iot_mqtt_client_publish.d \
./aws_iot_mqtt_client_subscribe.d \
./aws_iot_mqtt_client_unsubscribe.d \
./aws_iot_mqtt_client_yield.d \
./aws_iot_shadow.d \
./aws_iot_shadow_actions.d \
./aws_iot_shadow_json.d \
./aws_iot_shadow_records.d \
./jsmn.d \
./main_tirtos.d \
./network.d \
./network_sl.d \
./platform.d \
./startsntp.d \
./subscribe_publish_sample.d \
./timer.d \
./uart_term.d 

OBJS += \
./syscfg/ti_net_config.obj \
./syscfg/ti_drivers_net_wifi_config.obj \
./syscfg/ti_drivers_config.obj \
./aws_iot_json_utils.obj \
./aws_iot_mqtt_client.obj \
./aws_iot_mqtt_client_common_internal.obj \
./aws_iot_mqtt_client_connect.obj \
./aws_iot_mqtt_client_publish.obj \
./aws_iot_mqtt_client_subscribe.obj \
./aws_iot_mqtt_client_unsubscribe.obj \
./aws_iot_mqtt_client_yield.obj \
./aws_iot_shadow.obj \
./aws_iot_shadow_actions.obj \
./aws_iot_shadow_json.obj \
./aws_iot_shadow_records.obj \
./jsmn.obj \
./main_tirtos.obj \
./network.obj \
./network_sl.obj \
./platform.obj \
./startsntp.obj \
./subscribe_publish_sample.obj \
./timer.obj \
./uart_term.obj 

GEN_MISC_FILES += \
./syscfg/ti_drivers_config.h \
./syscfg/syscfg_c.rov.xs 

GEN_MISC_DIRS__QUOTED += \
"syscfg\" 

OBJS__QUOTED += \
"syscfg\ti_net_config.obj" \
"syscfg\ti_drivers_net_wifi_config.obj" \
"syscfg\ti_drivers_config.obj" \
"aws_iot_json_utils.obj" \
"aws_iot_mqtt_client.obj" \
"aws_iot_mqtt_client_common_internal.obj" \
"aws_iot_mqtt_client_connect.obj" \
"aws_iot_mqtt_client_publish.obj" \
"aws_iot_mqtt_client_subscribe.obj" \
"aws_iot_mqtt_client_unsubscribe.obj" \
"aws_iot_mqtt_client_yield.obj" \
"aws_iot_shadow.obj" \
"aws_iot_shadow_actions.obj" \
"aws_iot_shadow_json.obj" \
"aws_iot_shadow_records.obj" \
"jsmn.obj" \
"main_tirtos.obj" \
"network.obj" \
"network_sl.obj" \
"platform.obj" \
"startsntp.obj" \
"subscribe_publish_sample.obj" \
"timer.obj" \
"uart_term.obj" 

GEN_MISC_FILES__QUOTED += \
"syscfg\ti_drivers_config.h" \
"syscfg\syscfg_c.rov.xs" 

C_DEPS__QUOTED += \
"syscfg\ti_net_config.d" \
"syscfg\ti_drivers_net_wifi_config.d" \
"syscfg\ti_drivers_config.d" \
"aws_iot_json_utils.d" \
"aws_iot_mqtt_client.d" \
"aws_iot_mqtt_client_common_internal.d" \
"aws_iot_mqtt_client_connect.d" \
"aws_iot_mqtt_client_publish.d" \
"aws_iot_mqtt_client_subscribe.d" \
"aws_iot_mqtt_client_unsubscribe.d" \
"aws_iot_mqtt_client_yield.d" \
"aws_iot_shadow.d" \
"aws_iot_shadow_actions.d" \
"aws_iot_shadow_json.d" \
"aws_iot_shadow_records.d" \
"jsmn.d" \
"main_tirtos.d" \
"network.d" \
"network_sl.d" \
"platform.d" \
"startsntp.d" \
"subscribe_publish_sample.d" \
"timer.d" \
"uart_term.d" 

GEN_FILES__QUOTED += \
"syscfg\ti_net_config.c" \
"syscfg\ti_drivers_net_wifi_config.c" \
"syscfg\ti_drivers_config.c" 

SYSCFG_SRCS__QUOTED += \
"../aws_iot.syscfg" 

C_SRCS__QUOTED += \
"./syscfg/ti_net_config.c" \
"./syscfg/ti_drivers_net_wifi_config.c" \
"./syscfg/ti_drivers_config.c" \
"../aws_iot_json_utils.c" \
"../aws_iot_mqtt_client.c" \
"../aws_iot_mqtt_client_common_internal.c" \
"../aws_iot_mqtt_client_connect.c" \
"../aws_iot_mqtt_client_publish.c" \
"../aws_iot_mqtt_client_subscribe.c" \
"../aws_iot_mqtt_client_unsubscribe.c" \
"../aws_iot_mqtt_client_yield.c" \
"../aws_iot_shadow.c" \
"../aws_iot_shadow_actions.c" \
"../aws_iot_shadow_json.c" \
"../aws_iot_shadow_records.c" \
"../jsmn.c" \
"../main_tirtos.c" \
"../network.c" \
"../network_sl.c" \
"../platform.c" \
"../startsntp.c" \
"../subscribe_publish_sample.c" \
"../timer.c" \
"../uart_term.c" 


