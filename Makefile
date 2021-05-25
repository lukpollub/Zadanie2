pwd=$(shell pwd)
CC=gcc
RM=rm
AR=ar
LDIR=libs
SDIR=src
BDIR=bin
IDIR=incl
OUT=Code2

all: final
.Phony: clean export install uninstall
.SUFFIXES: .c .o .a .so
VPATH = $(LDIR) $(SDIR) $(BDIR) $(IDIR)

%.o:%.c
	$(CC) -c $(SDIR)/* -I./$(IDIR)
%.o:%_volume.c
	$(CC) -c -fPIC $(SDIR)/$^
%.o:%_area.c
	$(CC) -c $(SDIR)/$^

rect_area.o: rect_area.c
cuboid_area.o: cuboid_area.c
rect_volume.o: rect_volume.c
cuboid_volume.o: cuboid_volume.c
figure.o: figure.c

lib_area.a: rect_area.o cuboid_area.o
	$(AR) rs $(LDIR)/$@ $^
lib_volume.so: rect_volume.o cuboid_volume.o
	$(CC) $^ -shared -o $(LDIR)/$@
$(OUT): figure.o lib_volume.so lib_area.a 
	$(CC) -o $(BDIR)/$@ $^ -L$(LDIR)
final: lib_area.a lib_volume.so 
	make $(OUT)