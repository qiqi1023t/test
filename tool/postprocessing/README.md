# ERA-interim and simulation experiments posprocessing

##### modified July 08, 2020 by Qi Tang

The scripts in this folder are used to
 
* postprocessing the ERA-interim reanalysis data
* postprocessing the DA experiments

for analysing the atmosphere variables.
 
## Original ERA files

### Type of time interval

* the monthly means of daily means
* daily

### Types of levels

* surface
* perssure levels

### Convert and merge files

To make these ERA data comparable with our experiment output data, we need to remap these data into our T63 resolution grids. Also we need to merge the monthly dataset into one file which contains the one year (12 months) data.

TO do this, we need to use **CDO**:

```
module load CDO
```  

First we need to merge 12 files into 1 file:

```
to be added
```

Then we remap the grid into T63:

```
cdo,remap ...
```

Afterwards we get the postprocessed file ''.


## Deal with the DA experiments output file

### Deal with surface level data

* copy 'extract.sh' to the run directory:

```
cp extract.sh $WORK_DIRECTORY
```

* run the script extract.sh to get the separate temperature/u/v file in the sub-directory:

```
./extract.sh
```

* copy and run the script 'cal_monmean_XX.sh' to calculate the ensemble mean of temperature/u/v:

```
cp cal_monmean_* $WORK_DIRECTORY
./cal_monmean_temp2.sh
./cal_monmean_u10.sh
./cal_monmean_v10.sh
```

### Deal with pressure level data

#### calculate the ensemble mean of temperature

* copy and run the script 'cal_ensmean_p.sh':

```
cp cal_ensmean_p.sh $WORK_DIRECTORY
./cal_ensmean_p.sh
```

Here we select five pressure levels:

```
cdo ml2pl,92500,85000,50000,30000,20000 test1.nc test_300.nc
```

You could modify this of course, just keep in mind that the unit is *Pa* (the ERA data is stored as *hPa*)

#### calculate the ensemble mean of uv

* copy and run the script 'cal_ensmean_uv_p.sh':

```
cp cal_ensmean_uv_p.sh $WORK_DIRECTORY
./cal_ensmean_uv_p.sh
```



