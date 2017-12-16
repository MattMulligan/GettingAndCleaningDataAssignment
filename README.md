# run_analysis.R - README File

## Purpose of Script
the purpose of this script is to run analysis on samsung mobile readings data, to trainsform the raw txt files into data that can be analysed and understood

## Data Placement Assumption
as the submission page for this assignment requested, this script assumes that the the unzipped samsung data is placed in a folder called "UCI HAR Dataset" and this script is in the SAME FOLDER as the UCI HAR Dataset folder
the origianl version of this script would run a check to see if the zip file was downloaded and unzipped but the submission page has made other assumptions

## Package Requirements
this script uses the "data.table" package for more efficient data handling. this script also uses the "dplyr" package for easy data anaylsis ans summerising
the script will check to see if these packages are installed, and then install any missing components and load these libraries

## General Data Tidiness Notes
this script has used a uniform variable naming convention feturing camelCase naming
this script has also given all variables meaniful names
this script has also ensure that all data has been split out to one measurment per column and complies with all other tidy data principals

## Data Transformation Notes
the R script itself is well documented with comments, and script sections are aligned to the specific cubmission requirements (steps 1 to 5 on the assignment page)
below are notes for each section

### PRE-STEP 1
Lines: 1-17
Purpose: Package check/install/load
this segment will check for the required packages to run this script (data.table and dplyr). if they are not installed, it will automatically install them and load them for use

### ASSIGNMENT STEP 1
Lines: 18-78
Purpose: load in all data from dataset, clean up / cut up measurments data / create and merge datasets
this section starts by loading in x files from the dataset, removing extranious white space, cutting them into the correct shape and converting them to number formats.
the rest of the data for test and training (subject and activity information) are fed in and combined with measuremtns to make test and training datasets.
the test and training datasets are then combined to create "mergedDataTable"
more information on the values within mergedDataTable can be found in the codebook file in this github repo

### ASSIGNMENT STEP 2
Lines: 79-154
Purpose: this section cuts down the mergedDataTable object to only the mean and standard deviation mesurments
**PLEASE NOTE:** as the requirements for this section were vague, it was assumed that the only values that were to be taken were the ones listed in the fatures.txt file as containing "mean()" or "std()" in their names
this **would not** include features with "meanFreq()" or just have the word "mean" in their name

### ASSIGNMENT STEP 3
Lines: 155-167
Purpose: this section uses gsub() to substitue the activity numbers for meaningful text values

### ASSIGNMENT STEP 4
Lines: 168-243
Purpose: this section assigns meaningfull names to all the columns containing measurments

### ASSIGNMENT STEP 5
Lines: 244-324
Pupose: this section uses the "group_by" and "summarise_all" functions of dplyr to create a new summary table called averagedDataTable to hold the averages of all measures once grouped by Subject and activity. more information on this table can be found by refering to the codebook. finally this script outputs the averagedDataTable to file using write.table and saving as a txt file