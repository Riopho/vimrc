#!/bin/bash
SRC_PATH="/home/rio/trunk/src/"
svraray="gamesvr friendsvr balancesvr globalsvr mailsvr matchsvr miscsvr pvprecordsvr ranksvr roomsvr udpsvr base"
for svr in $svraray
    do 
        cd $SRC_PATH$svr
        ~/.vim/bundle/YCM-Generator/config_gen.py -e -v -f .
done 

