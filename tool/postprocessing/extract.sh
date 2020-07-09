#!/bin/bash

NENS=46

dir=`pwd`
for((ENS=1;ENS<=$NENS;ENS++))
do
  ENSstr=`printf %02d $ENS`
  echo $ENSstr
  cd $ENSstr
  cdo selcode,167 TST_201601.01_g3bid.nc temp2.nc
  cdo selcode,165 TST_201601.01_g3bid.nc u10.nc 
  cdo selcode,166 TST_201601.01_g3bid.nc v10.nc
  cd $dir
done

