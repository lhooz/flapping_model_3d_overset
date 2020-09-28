#!/bin/bash

foamCleanTutorials

cd wing
blockMesh
surfaceFeatureExtract
snappyHexMesh -overwrite | tee log.snappyHexMesh
extrudeMesh
transformPoints -rollPitchYaw '(0 0 45)'
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

touch open.foam
cd ..
