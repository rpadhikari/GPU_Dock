GPU_Docking workflow
make sure nvcc works
which nvcc
If output gives some path of nvcc then it is installed correctly
In supercomputing environment you might need to load via module

export CUDA INCLUDE and LIBRARY paths \\
export GPU_INCLUDE_PATH=/usr/local/cuda-12.0/include
export GPU_LIBRARY_PATH=/usr/local/cuda-12.0/lib64

Compile the code
make DEVICE=GPU NUMWI=128

Export the gpuduck path
export PATH="/home/raja/workdir/AutoDock-GPU/bin:$PATH"

Run the docking (single dock)
autodock_gpu_128wi -ffile 6lu7_1/rigidReceptor.maps.fld -lfile L1.pdbqt --flexres 6lu7_1/flexRec.pdbqt -nrun 100 -lsmet ad -resnam lig1

Run the automatic docking of multiple ligands via bash script
./LoopDock.sh
