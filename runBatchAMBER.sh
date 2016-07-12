#!/bin/bash

if [[ $# -eq 0 ]]
then
   sample=5
   while [ $sample -le 30 ]; do
      echo "starting run in $sample..."
      cd $sample
      runAMBER.sh wat_$sample.rst wat_heat_$sample.rst wat_heat_$sample.mdcrd
      echo "run $sample complete"
      cd ../
      sample=$(($sample+5))
   done
else
   echo " "
   echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
   echo "    Runs AMBER as batch. Use with genWaterSamples.sh    "
   echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
   echo " "
   echo "Usage: runBatchAMBER.sh"
fi 

