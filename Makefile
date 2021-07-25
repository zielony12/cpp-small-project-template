CXX := g++
TARGET := sample-program
SRC := src/main.cpp src/Test.cpp
INC := include
OBJ := main.o Test.o
BIN := bin
INSTALLDIR := /usr/bin
CXXFLAGS := -c -I $(INC)
LDFLAGS := -o
DEBUG ?= 0

ifeq ($(DEBUG), 1)
	CXXFLAGS += -g -gdwarf
else
	CXXFLAGS += -O2 -Wall -Werror -fpic
endif

$(BIN)/$(TARGET) : $(SRC)
	$(CXX) $(CXXFLAGS) $(SRC)
	$(CXX) $(LDFLAGS) $(BIN)/$(TARGET) $(OBJ)
install:
	mkdir -p $(INSTALLDIR)
	cp -p $(BIN)/$(TARGET) $(INSTALLDIR)
uninstall:
	rm -r $(INSTALLDIR)/$(TARGET)
clean :
	rm $(OBJ)
