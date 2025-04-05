CC := gcc
CFLAGS := -Wall -O2

ifeq ($(USE_L4), 1)
	CFLAGS += -DUSE_L4
endif

INCLUDES := -Isrc -Iuthash/include
SRC := src/main.c
TARGET := build/ip_flows

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(SRC)
	@mkdir -p build
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $^ -lpcap

clean:
	rm -rf build

