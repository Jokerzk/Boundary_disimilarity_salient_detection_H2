CROSS_COMPILE = ../toolchain/bin/aarch64-linux-gnu-
CC	= @echo "CC $@"; $(CROSS_COMPILE)g++
LD	= @echo "LD $@"; $(CROSS_COMPILE)ld"
AR	= @echo "AR $@"; $(CROSS_COMPILE)ar"
STRIP = @echp "STRIP $@"; $(CROSS_COMPILE)strip"

ABSOLUTE_DIR = ../thirdpartylib

SOURCE  := $(wildcard *.c) $(wildcard *.cpp)
OBJS    := $(patsubst %.c,%.o,$(patsubst %.cpp,%.o,$(SOURCE)))
  
TARGET  := Tracker

LIBS    := -L $(ABSOLUTE_DIR)/lib -lopencv_core -lopencv_imgproc -ltbb
LDFLAGS :=  
DEFINES :=
INCLUDE := -I $(ABSOLUTE_DIR)/include
CFLAGS  := -g -Wall -O3 $(DEFINES) $(INCLUDE)
CXXFLAGS:= $(CFLAGS)
  
  
#i think you should do anything here
.PHONY : everything objs clean veryclean rebuild

everything : $(TARGET)
  
all : $(TARGET)
  
objs : $(OBJS)
  
rebuild: veryclean everything
                
clean :
	rm -fr *.so
	rm -fr *.o
    
veryclean : clean
	rm -fr $(TARGET)
  
$(TARGET) : $(OBJS)
	$(CC) $(CXXFLAGS) -o $@ $(OBJS) $(LDFLAGS) $(LIBS)
