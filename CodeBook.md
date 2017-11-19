# Course 3: Gettingand Cleaning Data

## Raw Data

## Transformations

### Changing the Working Directory
The current location of the file is set as the current working directory.
### Checking, Downloading, installing and loading packages
`downloader` package is need to download and unzip the file.
The corresponding file is checked for, downloaded, installed and loaded in R.
### Load Training and Testing
The training data is loaded in into three segments Features, Activities and Subjects that are loaded from X_train.txt, y_train.txt and subject_train.txt from the train folder.
This create 3 data frames 
* trainFeatures
* trainActivities
* trainSubject

The tree data.frames are combined into a single data frame `train`

Similar convention is followed for `test` data set
### Combine Data
The two dataframes are `combined` using data.frame function.
### Renaming Headers
561 Features Labels are ready from features.txt. `Activity` and `Subject` are concatenated and set as the header for the `combined` data set.
### Subsetting
`grep` function is used to find the columns that contain `mean[^a-zA-Z]|std[^a-zA-Z]|Activity|Subject` to subset the data as `newData`.
### Modifying
`aggregate` function is used to find the `mean` of all variables by `Activity` and `Subject`.
## Writing Data
The data is written to a file meanByActivityAndSubject.txt using `write.table` function.

