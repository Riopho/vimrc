#!/bin/bash
#cscope
cd ./src
find `pwd` -name "*.h" -o -name "*.cpp" -o -name "*.lua" > cscope.files
cscope -b -q -k

#ycm
svraray="base cachesvr mailsvr miscsvr online proxysvr socialsvr transmitsvr zone "
for svr in $svraray
    do 
        cd ./$svr
        ~/.vim/bundle/YCM-Generator/config_gen.py -e -v -f .
        cd ..
done 

#ctags
ctags -R
