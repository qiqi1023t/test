#!/bin/bash

NENS=46

dir=`pwd`
for((ENS=1;ENS<=$NENS;ENS++))
do
  ENSstr=`printf %02d $ENS`
  echo $ENSstr
  cd $ENSstr
  cdo sp2gp TST_201601.01_spim.nc test1.nc
  cdo ml2pl,92500,85000,50000,30000,20000 test1.nc test_300.nc
  cp test_300.nc $dir/${ENSstr}.nc
  cd $dir
done

ENS=1
ENSstr=`printf %02d $ENS`
var0=${ENSstr}.nc
var1=$var0
for ((ENS=2;ENS<=$NENS;ENS++))
do
ENSstr=`printf %02d $ENS`
var0=${ENSstr}.nc
var1="$var1 $var0"
done
echo $var1
#calculate ensemble mean
cdo ensmean $var1 ensmean_p_monmean.nc

