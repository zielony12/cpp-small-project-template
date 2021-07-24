CXX := g++
CXXFLAGS := -c
TARGET := bin/test
SRC := src/Test.cpp src/main.cpp
OBJ := Test.o main.o
DEBUG ?= 0
ifeq ($(DEBUG), 1)
	CXXFLAGS += -g
else
	CXXFLAGS += -O2 -Wall
endif

$(TARGET) : $(SRC)
	$(CXX) $(CXXFLAGS) $(SRC)
	$(CXX) $(OBJ) -o $(TARGET)

clean :
	rm Test.o main.o
