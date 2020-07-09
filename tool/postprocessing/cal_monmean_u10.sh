#!/bin/bash

NENS=46

dir=`pwd`
for((ENS=1;ENS<=$NENS;ENS++))
do
  ENSstr=`printf %02d $ENS`
  echo $ENSstr
  cd $ENSstr
  cdo monmean u10.nc $dir/${ENSstr}.nc
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
cdo ensmean $var1 ensmean_u10_monmean.nc
