################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Add inputs and outputs from these tool invocations to the build variables 
CMD_SRCS += \
../CC3220SF_LAUNCHXL_TIRTOS.cmd 

SYSCFG_SRCS += \
../power_measurement.syscfg 

C_SRCS += \
../main_tirtos.c \
../platform.c \
../power_measure.c \
./syscfg/ti_drivers_net_wifi_config.c \
./syscfg/ti_drivers_config.c \
../uart_term.c 

GEN_FILES += \
./syscfg/ti_drivers_net_wifi_config.c \
./syscfg/ti_drivers_config.c 

GEN_MISC_DIRS += \
./syscfg/ 

C_DEPS += \
./main_tirtos.d \
./platform.d \
./power_measure.d \
./syscfg/ti_drivers_net_wifi_config.d \
./syscfg/ti_drivers_config.d \
./uart_term.d 

OBJS += \
./main_tirtos.obj \
./platform.obj \
./power_measure.obj \
./syscfg/ti_drivers_net_wifi_config.obj \
./syscfg/ti_drivers_config.obj \
./uart_term.obj 

GEN_MISC_FILES += \
./syscfg/ti_drivers_config.h \
./syscfg/syscfg_c.rov.xs 

GEN_MISC_DIRS__QUOTED += \
"syscfg\" 

OBJS__QUOTED += \
"main_tirtos.obj" \
"platform.obj" \
"power_measure.obj" \
"syscfg\ti_drivers_net_wifi_config.obj" \
"syscfg\ti_drivers_config.obj" \
"uart_term.obj" 

GEN_MISC_FILES__QUOTED += \
"syscfg\ti_drivers_config.h" \
"syscfg\syscfg_c.rov.xs" 

C_DEPS__QUOTED += \
"main_tirtos.d" \
"platform.d" \
"power_measure.d" \
"syscfg\ti_drivers_net_wifi_config.d" \
"syscfg\ti_drivers_config.d" \
"uart_term.d" 

GEN_FILES__QUOTED += \
"syscfg\ti_drivers_net_wifi_config.c" \
"syscfg\ti_drivers_config.c" 

C_SRCS__QUOTED += \
"../main_tirtos.c" \
"../platform.c" \
"../power_measure.c" \
"./syscfg/ti_drivers_net_wifi_config.c" \
"./syscfg/ti_drivers_config.c" \
"../uart_term.c" 

SYSCFG_SRCS__QUOTED += \
"../power_measurement.syscfg" 


