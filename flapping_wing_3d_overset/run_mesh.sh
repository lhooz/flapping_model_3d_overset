#!/bin/bash


foamCleanTutorials


cd wing
blockMesh
snappyHexMesh -overwrite | tee log.snappyHexMesh
cd ..



cd backGround
blockMesh
mergeMeshes . ../wing -overwrite
topoSet
topoSet -dict system/topoSetDict_movingZone



rm -r 0
cp -r 0_org 0



checkMesh |  tee log.checkMesh
setFields | tee log.setFields



cd ..
