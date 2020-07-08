# ERA-interim posprocessing

##### modified July 08, 2020 by Qi Tang

The scripts in this folder are used to postprocessing the ERA-interim reanalysis data, which can be used later for postprocessing the DA experiments.

## Original .nc files

### Type of time interval

* the monthly means of daily means
* daily

### Types of levels

* surface
* perssure levels


## Steps to use these scripts

### Deal with urface level data

* copy 'extract.sh' to the run directory, e.g.:

```
cp extract.sh $WORK_DIRECTORY
```
* run the script extract.sh to get the separate temperature/u/v file in the sub-directory:

```
./extract.sh
```

* run the script 'cal_monmean_XX.sh' to calculate the ensemble mean of temperature/u/v:

```
./cal_monmean_temp2.sh
./cal_monmean_u10.sh
./cal_monmean_v10.sh
```

