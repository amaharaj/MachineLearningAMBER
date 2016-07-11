#!/bin/bash

args=("$@")

pdbfile=${args[0]}
natoms=${args[1]}

mkdir none

if [[ $# -eq 2 ]]
then
   sample=5
   while [ $sample -le 30 ]; do
      mkdir $sample
      removeWater.sh $pdbfile $sample $natoms
      mv out.pdb $sample/TIP3P_$sample.pdb
      mv Removed_Residues $sample/Removed_Residues_$sample 
      cp mdin $sample/
      sample=$(($sample+5))
      echo $sample
   done
   cp $pdbfile none/
   cp mdin none/
else
   echo " "
   echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
   echo "    Executes removeWater.sh with different inputs       "
   echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
   echo " "
   echo "Usage: genWaterSamples.sh <pdbfile> <# of atoms / molecule>"
fi

