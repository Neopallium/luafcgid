# Lua setup
BASE = /usr/local

## for Lua 5.1.x
#LUAINC = $(BASE)/include/lua51
#LUALIB = $(BASE)/lib/lua51
#LUA_LIBS = -llua

## for LuaJIT2
LUAINC = $(BASE)/include/luajit-2.0
LUALIB = $(BASE)/lib
LUA_LIBS = -lluajit-5.1

# basic setup
CC = gcc
WARN = -Wall
INCS = -I$(BASE)/include -I$(LUAINC)
LIBS = -L$(BASE)/lib -L$(LUALIB) -lm -lpthread -lfcgi $(LUA_LIBS)
INSTALL_DIR = $(BASE)/bin
#DEBUG = -ggdb
OPTS = -O2
#OPTS = -O3 -march=native
CFLAGS = $(INCS) $(WARN) $(OPTS) $(DEBUG) $G
LDFLAGS = $(LIBS) $(OPTS) $(DEBUG)

SRCS = main.c config.c pool.c request.c parser.c
OBJS = main.o config.o pool.o request.o parser.o
EXEC = luafcgid

all: $(SRCS) $(EXEC)

$(EXEC): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS)

install: all
	install -b $(EXEC) $(INSTALL_DIR)

clean:
	rm -f $(OBJS) $(EXEC)




