ALLEGRO_LIBS = allegro-5 allegro_audio-5 allegro_acodec-5 allegro_dialog-5 allegro_font-5 allegro_image-5 allegro_primitives-5 allegro_ttf-5
CXX = g++
CXXFLAGS = -I$(HOME)/include -I./src/ $$(pkg-config --cflags $(ALLEGRO_LIBS)) -Wall

ifdef DEBUG
	CXXFLAGS += -DDEBUG -g
endif

HEADERS = $(wildcard src/*.h)
SOURCES := $(subst src/nc_client.cpp,,$(subst src/nc_server.cpp,,$(wildcard src/*.cpp)))
OBJECTS = $(SOURCES:%.cpp=%.o)

EXE = ./pm
LIBS = -L$(HOME)/lib -lm -lnet -lpthread -lz $$(pkg-config --libs $(ALLEGRO_LIBS))

all: $(EXE)

clean:
	rm -fR $(EXE) $(OBJECTS)

debug:
	DEBUG=1 $(MAKE) clean all && gdb $(EXE)

memcheck: clean all
	valgrind --leak-check=full --track-origins=yes $(EXE)

rebuild: clean all

run: all
	$(EXE)

rerun: rebuild
	$(EXE)

$(EXE): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $? $(LIBS)

src/%.o: src/%.cpp $(HEADERS)
	$(CXX) -c $(CXXFLAGS) -o $@ $<
