TARGET_NAME=helloWorld
BUILD_DIR=_build

PROJ_DIR=.
MAKE_COMMON=$(PROJ_DIR)/../../Common

$(BUILD_DIR)/$(TARGET_NAME).out:\
	LINKER_SCRIPT:=helloWorld.ld

CPU=cortex-m4
FPU=fpv4-sp-d16
FLOAT-ABI=hard
OPT=-O3 -g3
MCU=-mcpu=$(CPU) -mfloat-abi=$(FLOAT-ABI) -mfpu=$(FPU)	$(OPT)

CCFLAGS+=$(MCU)
CCFLAGS+=-ffunction-sections -fdata-sections -fno-strict-aliasing
CCFLAGS+=-fno-builtin -fshort-enums
CCFLAGS+=-Wall -Wno-unused-variable

ASMFLAGS=$(MCU)

LDFLAGS+=$(MCU)
LDFLAGS+=-Wl,--gc-sections
LDFLAGS+=--specs=nano.specs
LDFLAGS+=-T$(LINKER_SCRIPT) -mthumb -mabi=aapcs

SRC_FILES+=$(wildcard *.c)

INC_FOLDERS=\

.PHONY: default help

default: $(TARGET_NAME)

help:
	@echo "make all: Build the project"
	@echo "make clean: Clean the project"
	@echo "make help: Show this message"

# Include the common makefile
include $(MAKE_COMMON)/Makefile.common

$(foreach target, $(TARGET_NAME), $(call define_target, $(target)))


flash:

erase:


