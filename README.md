# GetAndCleanDataProject

## Raw data
samsung smartphones accelerometer data
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## Files
run_analysis.R script 
  - reads the raw data
  - merges and extracts variables related to mean and SD
  - renames variables to improve readability
  - creates a tidy dataset with averages of those variables, grouped by subjects and activities

codebook.md - explains the series of steps the code follows and all the variables in detail

tidyData.txt - final data containing averages for every varible with mean and SD
