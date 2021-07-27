CXX := g++
TARGET := sample-program
SRCDIR := src
OBJDIR := obj
BINDIR := bin
INCDIR := include
SRC := $(wildcard $(SRCDIR)/*.cpp)
OBJ := $(SRC:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
INSTALLDIR := /usr/bin
CXXFLAGS := -c -I $(INCDIR)
LDFLAGS := -o
DEBUG ?= 0

#ifeq ($(DEBUG), 1)
#	CXXFLAGS += -g -gdwarf
#else
#	CXXFLAGS += -O2 -Wall -Werror
#endif

CXXFLAGS += -o

$(BINDIR)/$(TARGET): $(OBJ)
	$(CXX) $^ $(LDFLAGS) $@

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CXX) $< $(CXXFLAGS) $@
install:
	mkdir -p $(INSTALLDIR)
	cp -p $(BINDIR)/$(TARGET) $(INSTALLDIR)
uninstall:
	rm -r $(INSTALLDIR)/$(TARGET)
clean :
	rm $(OBJDIR)/*.o
