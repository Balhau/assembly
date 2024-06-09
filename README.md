# Whats going on here?

This is a lab repo that I pretend to use as a learning environment for instruction sets and low level constructs. Here we plan to explore calling conventions made by compilers for specific architectures. And understand how the bridge between low level assembly code and higher level c is done. Profiling of low level assembly will be also another point of interest. the idea would be to implement funcional equivalent programs with different set of low level assembly instructions and see if and by how much they differ in terms of execution times.

We plan to explore the mmx instruction set as well to see how floating point precision is done at lower level. 

Understand stack management and how its done in several instruction sets (the prolog, epilog we usually see on assembly blocks).

The scope will increase eventually. 

## Dependencies
Some dependencies may be needed, for instance if you're using a debian based distro you can install arm compilers with 
```shell
sudo apt-get update
sudo apt-get install gcc-arm-linux-gnueabi
sudo apt-get install gcc-arm-linux-gnueabihf

```

# Build

To build this you can leverage the Makefile. You need to ensure you got the proper dependencies already installed and then you can go with

```shell
clear; make clean; make; bin/binary_to_execute_here
```
