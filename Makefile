CC=gcc
BIN=orai
CFLAG=-g -Wall

SRC=src
BUILD=build

SRCS=$(wildcard $(SRC)/*.c)
HDRS=$(wildcard $(SRC)/*.h)

all: setup build run

setup:
	@ if [ ! -d "build" ]; then \
		mkdir build; \
	fi

build: setup $(SRCS) $(HDRS)
	@ $(CC) $(CFLAG) -o $(BUILD)/$(BIN) $(SRCS) $(HDRS)

run: build
	@ ./$(BUILD)/$(BIN)