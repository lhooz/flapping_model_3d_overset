#!/bin/bash --login

#$ -pe smp.pe 4 
#$ -cwd

#$ -m bea
#$ -M hao.lee0019@gmail.com

module load apps/gcc/openfoam/v1906
module load apps/binapps/paraview/5.7.0

source $foamDotFile

foamCleanTutorials

cd wing
surfaceFeatureExtract
blockMesh
snappyHexMesh -overwrite | tee log.snappyHexMesh
cd ..

cd backGround
blockMesh
mergeMeshes . ../wing -overwrite
createPatch -overwrite
topoSet
topoSet -dict system/topoSetDict_movingZone

rm -r 0
cp -r 0_org 0

checkMesh |  tee log.checkMesh

cd ..
cd backGround

decomposePar
mpirun -np $NSLOTS renumberMesh -overwrite -parallel | tee log.renumberMesh
mpirun -np $NSLOTS pimpleFoam -parallel | tee log.solver
touch open.foam

cd ..

#mpiexec -n $NSLOTS pvbatch 3d_pvpost.py | tee log.pvpost
