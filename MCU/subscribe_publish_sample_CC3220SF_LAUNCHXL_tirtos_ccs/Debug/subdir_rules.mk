################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
build-1845622945:
	@$(MAKE) --no-print-directory -Onone -f subdir_rules.mk build-1845622945-inproc

build-1845622945-inproc: ../aws_iot.syscfg
	@echo 'Building file: "$<"'
	@echo 'Invoking: SysConfig'
	"C:/ti/ccs930/ccs/utils/sysconfig/sysconfig_cli.bat" -s "C:/ti/aws_cc32xx_3_30_00_03/.metadata/product.json" -s "C:/ti/simplelink_cc32xx_sdk_3_40_00_05/.metadata/product.json" -o "syscfg" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

syscfg/ti_net_config.c: build-1845622945 ../aws_iot.syscfg
syscfg/ti_drivers_net_wifi_config.c: build-1845622945
syscfg/ti_drivers_config.c: build-1845622945
syscfg/ti_drivers_config.h: build-1845622945
syscfg/syscfg_c.rov.xs: build-1845622945
syscfg/: build-1845622945

syscfg/%.obj: ./syscfg/%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccs930/ccs/tools/compiler/ti-cgt-arm_18.12.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=vfplib -me --include_path="C:/ti/simplelink_cc32xx_sdk_3_40_00_05/source" --include_path="C:/ti/aws_cc32xx_3_30_00_03/source" --include_path="C:/Users/jwang/workspace_v9/subscribe_publish_sample_CC3220SF_LAUNCHXL_tirtos_ccs" --include_path="C:/Users/jwang/workspace_v9/subscribe_publish_sample_CC3220SF_LAUNCHXL_tirtos_ccs/Debug" --include_path="C:/ti/aws_cc32xx_3_30_00_03/source" --include_path="C:/ti/simplelink_cc32xx_sdk_3_40_00_05/source/ti/net/bsd" --include_path="C:/ti/simplelink_cc32xx_sdk_3_40_00_05/source" --include_path="C:/ti/simplelink_cc32xx_sdk_3_40_00_05/source/ti/posix/ccs" --include_path="C:/ti/ccs930/ccs/tools/compiler/ti-cgt-arm_18.12.4.LTS/include" --define=ENABLE_IOT_INFO --define=ENABLE_IOT_ERROR --define=ENABLE_IOT_WARN --define=ENABLE_IOT_DEBUG --define=NET_SL -g --diag_warning=225 --diag_warning=255 --diag_wrap=off --display_error_number --gen_func_subsections=on --preproc_with_compile --preproc_dependency="syscfg/$(basename $(<F)).d_raw" --include_path="C:/Users/jwang/workspace_v9/subscribe_publish_sample_CC3220SF_LAUNCHXL_tirtos_ccs/Debug/syscfg" --obj_directory="syscfg" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

%.obj: ../%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccs930/ccs/tools/compiler/ti-cgt-arm_18.12.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=vfplib -me --include_path="C:/ti/simplelink_cc32xx_sdk_3_40_00_05/source" --include_path="C:/ti/aws_cc32xx_3_30_00_03/source" --include_path="C:/Users/jwang/workspace_v9/subscribe_publish_sample_CC3220SF_LAUNCHXL_tirtos_ccs" --include_path="C:/Users/jwang/workspace_v9/subscribe_publish_sample_CC3220SF_LAUNCHXL_tirtos_ccs/Debug" --include_path="C:/ti/aws_cc32xx_3_30_00_03/source" --include_path="C:/ti/simplelink_cc32xx_sdk_3_40_00_05/source/ti/net/bsd" --include_path="C:/ti/simplelink_cc32xx_sdk_3_40_00_05/source" --include_path="C:/ti/simplelink_cc32xx_sdk_3_40_00_05/source/ti/posix/ccs" --include_path="C:/ti/ccs930/ccs/tools/compiler/ti-cgt-arm_18.12.4.LTS/include" --define=ENABLE_IOT_INFO --define=ENABLE_IOT_ERROR --define=ENABLE_IOT_WARN --define=ENABLE_IOT_DEBUG --define=NET_SL -g --diag_warning=225 --diag_warning=255 --diag_wrap=off --display_error_number --gen_func_subsections=on --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" --include_path="C:/Users/jwang/workspace_v9/subscribe_publish_sample_CC3220SF_LAUNCHXL_tirtos_ccs/Debug/syscfg" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


