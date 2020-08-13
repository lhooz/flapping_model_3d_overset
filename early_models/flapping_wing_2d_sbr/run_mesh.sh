#!/bin/bash


foamCleanTutorials

surfaceFeatureExtract
blockMesh
snappyHexMesh -overwrite | tee log.snappyHexMesh
extrudeMesh

rm -r 0
cp -r 0_org 0

checkMesh |  tee log.checkMesh

touch open.foam
