#!/bin/bash

# This script can be useful for flexiable docking in GPU hardware
# Author: Rajendra Adhikari
# Date: May 13th 2023
# Department of Physics, Kathmandu University, Nepal
# To see more tutorials please follow the Supercomputer Nepal channel
# Link : https://www.youtube.com/@supercomputer_Nepal
# Please do NOT remove the above comments
# dock the ligand (one Ligand file only)
autodock_gpu_128wi -ffile 6lu7_1/rigidReceptor.maps.fld -lfile L1.pdbqt --flexres 6lu7_1/flexRec.pdbqt -nrun 100 -lsmet ad -resnam lig1

# extract maximum binding affinity from dlg file
affinity=`grep -A9 'RMSD TABLE' lig1.dlg | tail -1 | awk '{print $4}'`
run=`grep -A9 'RMSD TABLE' lig1.dlg | tail -1 | awk '{print $3}'`

# print the best affinity and run
echo "   "
echo "best affinity(kcal/mol) and run"
echo "$affinity $run"


