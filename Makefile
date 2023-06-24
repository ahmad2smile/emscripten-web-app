CC=emcc
BIN=orai.js
CFLAG=-O3

SRC=src
BUILD=build

SRCS=$(wildcard $(SRC)/*.c)
HDRS=$(wildcard $(SRC)/*.h)

all: setup build run

setup:
	@ if [ ! -d "build" ]; then \
		mkdir build; \
		cp ./public/index.html ./build/; \
	fi

build: setup $(SRCS) $(HDRS)
	@ $(CC) $(CFLAG) -o $(BUILD)/$(BIN) $(SRCS) $(HDRS)

run: build
	@ python -m http.server -d ./$(BUILD)/