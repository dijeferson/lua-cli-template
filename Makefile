.PHONY: all build install clean lint test

all: clean build test install

build:
	luarocks build

install:
	luarocks make

clean:
	rm -rf ./lua_modules
	rm -rf ./.luarocks
	luarocks purge

lint:
	selene src/
	selene spec/

test:
	busted --verbose spec/
