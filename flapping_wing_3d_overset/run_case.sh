#!/bin/bash --login

#$ -pe smp.pe 4
#$ -cwd

#$ -m bea
#$ -M hao.lee0019@gmail.com

module load apps/gcc/openfoam/v1906

source $foamDotFile

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
cd backGround

decomposePar
mpirun -np $NSLOTS renumberMesh -overwrite -parallel | tee log.renumberMesh
mpirun -np $NSLOTS overPimpleDyMFoam -parallel | tee log.solver
