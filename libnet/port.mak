# Portability makefile -- helper for other makefiles

# Linux version

# edited my mweiss 2018-01-14


TARGET = LINUX
PREFIX = /usr/local/lib

LIBDEST = $(PREFIX)/lib/$(LIBFILENAME)
INCDEST = $(PREFIX)/include/$(INCNAME)
EXE_SUFFIX =
RM_F = rm -f
CP_F = cp -f

CC = gcc
WARNING_FLAGS = -w
LDLIBS = -lpthread
LINK_ALLEGRO = `allegro-config --libs`
ARFLAGS = rs

LIBNAME = net
LIBFILENAME = lib$(LIBNAME).a
INCNAME = libnet.h
LIBDIR = $(BASE)/lib
LIBSRC = $(LIBDIR)/$(LIBFILENAME)
INCDIR = $(BASE)/include
INCSRC = $(INCDIR)/$(INCNAME)
