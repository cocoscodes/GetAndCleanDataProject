CodeBook
========

This document describes the series of steps to understand how the
run\_analysis.R script works.

1.- Raw data downloaded and unzipped called “UCI HAR Dataset”
-------------------------------------------------------------

2.- Assigning the correct directory to the new unzipped file
------------------------------------------------------------

3.- Reading all relevant txt files:
-----------------------------------

    - activity_labels - contains all types of activities performed (6 obs, 2 var)
    - features - contains all the variables names (561 obs, 2 var)
    - subject_test - contains all participants in the "test" (2947 obs, 1 var)
    - x_test - contains all the data for all variables in the "test" (2947 obs, 561 var)
    - y_test - contains all the activities performed by all subjects in the "test" (2947 obs, 1       var)
    - subject_train - contains all participants in the "train" (7352 obs, 1 var)
    - x_train - contains all the data for x axis in the "train" (7352 obs, 561 var)
    - y_train - contains all the activities performed by all subjects in the "train" (7352 obs,       1 var)

4.- Binding the txt files and creating the raw data frame called “xys\_data” (10299 obs, 563 var)
-------------------------------------------------------------------------------------------------

    - x - contains all the data for all variables (10299 obs, 561 var)
    - y - contains all the activities performed by all subjects (10299 obs, 1 var)
    - subjects - contains all subjects (10299 obs, 1 var)

5.- Extracting the columns that contained mean or SD data in a dataframe called “extractData” (10299 obs, 88 var)
-----------------------------------------------------------------------------------------------------------------

    - indexCols - vector with intergers that will index all columns containing "mean" or "std"        int [1:86]
    - meanStd_data - data frame created by unsing the indexCols, contains all relevant columns        (10299 obs, 86 var)

6.- Renaming headers to improve readability
-------------------------------------------

    All "^t" to "Time"
    All"^f" to "Frequency"
    All "BodyBody" to "Body"
    All "Acc" to "Accelerometer"
    All "Gyro" to "Gyroscope"
    All "Mag" to "Magnitude"
    All "-mean\\()" to "Mean"
    All "-std\\()" to "STD"
    All "-meanFreq\\()" to "MeanFrequency"
    All "\\(t"to "(Time"

7.- Using the dplyr pipeline operator %&gt;% to create the “tidyData” (180 obs, 88 var)
---------------------------------------------------------------------------------------

8.- Saving the tidyData as a txt file
-------------------------------------
