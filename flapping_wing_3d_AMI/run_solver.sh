 #!/bin/bash

#rm -rf all
#cp -r backGround all
#cd all

#setFields -dict system/setFieldsDict_init 


cd backGround



decomposePar
mpirun -np 4 renumberMesh -overwrite -parallel | tee log.renumberMesh
mpirun -np 4 pimpleFoam -parallel | tee log.solver



#renumberMesh -overwrite | tee log.renumberMesh
#overPimpleDyMFoam | tee log.solver
