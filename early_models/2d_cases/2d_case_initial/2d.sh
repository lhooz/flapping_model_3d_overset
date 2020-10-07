#!/bin/bash --login

#$ -pe smp.pe 32 
#$ -cwd

#$ -m bea
#$ -M hao.lee0019@gmail.com

module load apps/gcc/openfoam/v1906

source $foamDotFile

foamCleanTutorials

surfaceFeatureExtract
blockMesh
snappyHexMesh -overwrite | tee log.snappyHexMesh
extrudeMesh

rm -r 0
cp -r 0_org 0

checkMesh |  tee log.checkMesh

decomposePar
mpirun -np $NSLOTS renumberMesh -overwrite -parallel | tee log.renumberMesh
mpirun -np $NSLOTS pimpleFoam -parallel | tee log.solver
touch open.foam
