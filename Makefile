CC = g++
EXE := pac-man
CFLAGS = -Wall -std=c++11 -O3
ODIR   := obj
SDIR   := src
INC    := -Iinclude -I../hummingbird/include -I../MOGL/include -I../glm -I../assimp/include
LIBS   := -lsfml-audio -lsfml-window -lsfml-system -lsfml-graphics -lGL -lGLEW
STATIC := ../hummingbird/lib/libhum.so ../MOGL/lib/libmogl.so ../assimp/lib/libassimp.so

SOURCES = $(shell find ./$(SDIR) -name '*.cpp')
OBJS = $(patsubst $(SDIR)/%,$(ODIR)/%,$(SOURCES:./%.cpp=%.o))

all: $(OBJS)
	$(CC) -o $(EXE) $(OBJS) $(CFLAGS) $(INC) $(STATIC) $(LIBS)

$(ODIR)/%.o: $(SDIR)/%.cpp
	$(CC) -c $(INC) -o $@ $< $(CFLAGS) $(STATIC)

.PHONY: clean

clean:
	rm -rf $(ODIR)/*.o $(EXE)



g++ *.cpp -Wall -std=c++11 -O3 -Iinclude -I../hummingbird/include -I../MOGL/include -I../glm -I../assimp/include ../hummingbird/lib/libhum.so ../MOGL/lib/libmogl.so ../assimp/lib/libassimp.so -lsfml-audio -lsfml-window -lsfml-system -lsfml-graphics -lGL -lGLEW
