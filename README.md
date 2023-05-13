# GPU_Docking workflow
# make sure nvcc works
which nvcc
# if output gives some path of nvcc then it is installed correctly
# in supercomputing environment you might need to load via module

# export CUDA INCLUDE and LIBRARY paths
export GPU_INCLUDE_PATH=/usr/local/cuda-12.0/include
export GPU_LIBRARY_PATH=/usr/local/cuda-12.0/lib64

# compile the code
make DEVICE=GPU NUMWI=128

# export the gpuduck path
export PATH="/home/raja/workdir/AutoDock-GPU/bin:$PATH"

# run the docking (single dock)
autodock_gpu_128wi -ffile 6lu7_1/rigidReceptor.maps.fld -lfile L1.pdbqt --flexres 6lu7_1/flexRec.pdbqt -nrun 100 -lsmet ad -resnam lig1


# run the automatic docking of multiple ligands via bash script
./gpuDock.sh
