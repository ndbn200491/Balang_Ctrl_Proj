################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
D:\Softwares\sloeber\arduinoPlugin\libraries\TimedBlink\1.0.2\src\TimedBlink.cpp 

LINK_OBJ += \
.\libraries\TimedBlink\src\TimedBlink.cpp.o 

CPP_DEPS += \
.\libraries\TimedBlink\src\TimedBlink.cpp.d 


# Each subdirectory must supply rules for building sources it contributes
libraries\TimedBlink\src\TimedBlink.cpp.o: D:\Softwares\sloeber\arduinoPlugin\libraries\TimedBlink\1.0.2\src\TimedBlink.cpp
	@echo 'Building file: $<'
	@echo 'Starting C++ compile'
	"D:\Softwares\sloeber\arduinoPlugin\packages\arduino\tools\avr-gcc\5.4.0-atmel3.6.1-arduino2/bin/avr-g++" -c -g -Os -Wall -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega2560 -DF_CPU=16000000L -DARDUINO=10802 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR     -I"D:\Softwares\sloeber\arduinoPlugin\packages\arduino\hardware\avr\1.6.23\cores\arduino" -I"D:\Softwares\sloeber\arduinoPlugin\packages\arduino\hardware\avr\1.6.23\variants\mega" -I"D:\Softwares\sloeber\arduinoPlugin\libraries\TimedBlink\1.0.2\src" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -D__IN_ECLIPSE__=1 -x c++ "$<"  -o  "$@"
	@echo 'Finished building: $<'
	@echo ' '


