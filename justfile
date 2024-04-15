default:
    just --list

build:
    cargo build
    cxxbridge src/lib.rs --header > src/bridge/bridge.h
    cxxbridge src/lib.rs > src/bridge/bridge.cpp
    scons