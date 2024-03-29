CC=emcc
BIN=orai.js
CFLAG=-O3 -sEXPORTED_RUNTIME_METHODS="['UTF8ToString']"

SRC=src
LIB=src/lib
BUILD=build

SRCS=$(wildcard $(SRC)/*.c)
LIB_SRCS=$(wildcard $(LIB)/*.c)
HDRS=$(wildcard $(SRC)/*.h)

all: setup build run

setup:
	@ if [ ! -d "build" ]; then \
		mkdir build; \
	fi
	@ cp ./public/index.html ./build/; \

build: setup $(SRCS) $(HDRS)
	@ $(CC) $(CFLAG) -o $(BUILD)/$(BIN) $(SRCS) $(HDRS) $(LIB_SRCS)

run: build
	@ python -m http.server -d ./$(BUILD)/