
#!/bin/bash

# This script can be useful for flexiable docking in GPU hardware
# Author: Rajendra Adhikari
# Date: May 13th 2023
# Department of Physics, Kathmandu University, Nepal
# To see more tutorials please follow the Supercomputer Nepal channel
# Link : https://www.youtube.com/@supercomputer_Nepal
# Please do NOT remove the above comments

rm -rf dlg xml affinity.dat
mkdir -p dlg xml

# read the ligends from folder and make and filename array
cd ligand/
myLig=`ls *.pdbqt`
cd ../

# run the docking on loop
for eachLig in $myLig
do
echo " ================================ "
echo " Working on $eachLig    "
echo " ================================ "
# dock the ligand
autodock_gpu_128wi -ffile 6lu7_1/rigidReceptor.maps.fld -lfile ligand/$eachLig --flexres 6lu7_1/flexRec.pdbqt -nrun 100 -lsmet ad -resnam lig_$eachLig

# extract energy and run from the dlg file
affinity=`grep -A9 'RMSD TABLE' lig_$eachLig.dlg | tail -1 | awk '{print $4}'`
run=`grep -A9 'RMSD TABLE' lig_$eachLig.dlg | tail -1 | awk '{print $3}'`

echo "$eachLig $affinity $run" >> affinity.dat
done

# store dlg and xml files on the folders
mv *.dlg dlg/
mv *.xml xml/

