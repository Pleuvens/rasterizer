### Rasterizer

This is a rasterizer implementation in Ada

## Install

First you need to install the toolchain and the unit test framework.

# Toolchain

Download the installer [here](https://www.adacore.com/download) (choose
gnat-community-2019-20190517-x86\_64-linux-bin)

launch the installer and follow the steps

Create a env directory at the project root and add shell script file
where you will add:

`export PATH=/path/to/toolchain/bin:$PATH`

# Unit test framework

Create a libs directory in env directory and clone the AUnit github [repository](https://github.com/AdaCore/aunit)

## Test suite

run `make check` to lauch the test suite
