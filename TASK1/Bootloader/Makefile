TARGET_NAME:=boot
BUILD_DIR:=_build
INC_MAKE_DIR:=../Common
OBJS_DIR:=$(BUILD_DIR)/objs

PROJ_DIR:=./

LINKER_SCRIPT=boot.ld

CPU=-mcpu=cortex-m4
FPU=-mfpu=fpv4-sp-d16
FLOAT_ABI=-mfloat-abi=hard
OPT= -O3 -g3
MCU=$(CPU) $(FPU) $(FLOAT_ABI) $(OPT)

CCFLAGS += $(MCU) 
CCFLAGS += -Wall -fdata-sections -ffunction-sections

ASMFLAGS += $(MCU)
ASMFLAGS += -Wall -fdata-sections -ffunction-sections 

CXXFLAG += $(MCU) 
CXXFLAG += -Wall -fdata-sections -ffunction-sections 

LDFLAGS += $(MCU) --specs=nosys.specs
LDFLAGS += -Wl,--cref -Wl,--gc-sections -T$(LINKER_SCRIPT)

LIBS +=-lc -lm -lnosys


SRC_FILES +=\
	$(PROJ_DIR)/main.c\
	$(PROJ_DIR)/boot_startup.c\

INC_FOLDERS +=\


.PHONY: default help


default: $(TARGET_NAME)

include $(INC_MAKE_DIR)/Makefile.common

$(foreach target, $(TARGET_NAME), $(call define_target, $(target)))

help:
	echo help






