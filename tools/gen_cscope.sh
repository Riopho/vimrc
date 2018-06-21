#!/bin/bash
cd ./src
find `pwd` -name "*.h" -o -name "*.cpp" -o -name "*.lua" > cscope.files
cscope -b -q -k
