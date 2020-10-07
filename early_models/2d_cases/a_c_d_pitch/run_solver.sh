 #!/bin/bash

cd backGround

decomposePar
mpirun -np 4 renumberMesh -overwrite -parallel | tee log.renumberMesh
mpirun -np 4 overPimpleDyMFoam -parallel | tee log.solver
#mpirun -np 4 moveDynamicMesh -parallel | tee log.solver
