################################################################################
##
## This script is part of a programming assignment submission
## John Hopkins University and Coursera
## Specialization: Data Science
## Course Getting and Cleaning Data
## Assignment type: Peer-graded
## Title: Getting and Cleaning Data Course Project
## Assignment Instructions can be found at:
## https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning\
## -data-course-project
## Student: Miguel Duarte B.
## email: duartemj@outlook.com
##
################################################################################

## Cleaning the environment first

rm(list=ls(all=TRUE))

## Check the working directory and the Raw data directory, create one if 
## necessary

## To set a separate Raw file inside the work directory uncoment the 
## #  "Raw" line and the comma after getwd() line

rawDir <- file.path(
    getwd()#,
#    "Raw"
    )

if (
    !file.exists(
        rawDir
        )
    ){
    dir.create(
        rawDir
        )
}

## Download the files
## Assign the urls to variables

fileUrl1 <- "https://d396qusza40orc.cloudfront.net/\
getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#### Actually download the files

sourceFN <- "UCI HAR Dataset.zip"
if (
    !file.exists(
        file.path(
            rawDir,
            sourceFN
            )
        )
    ){
    download.file(
        fileUrl1, 
        file.path(
            rawDir, 
            sourceFN
            )
        )
    dateDownloaded1 <- date()
}

## Unzip the source file
## First check if the file has been unzipped already if not then unzip

sourceDir <- "UCI HAR Dataset"

if (
    !file.exists(
        file.path(
            rawDir,
            sourceDir
            )
        )
    ){
    unzip(
        file.path(
            rawDir,
            sourceFN
        ),
        exdir = file.path(
            rawDir
        )
    )
}

## Using readr to read files
library(readr)

## Using dplyr to manipulate the data objects
library(dplyr)

featuresFN <- "features.txt"

## Read the column labels from features file
features <- pull(
    read_delim(
        file.path(
            rawDir,
            sourceDir,
            featuresFN
        ),
        delim = " ",
        col_names = FALSE,
        col_types = cols_only(
            X2 = col_character()
            ),
        trim_ws = TRUE,
        ),
    X2
)

## Remove the brackets "()", hyphens "-", commas "," and convert to lower case
features <- gsub("(\\()|(\\))|(\\-)|(,)", "", features)

## Change to lower case
features <- tolower(features)

## Expand "acc" into "acceleration"
features <- gsub("acc", "acceleration", features)

## Expand "t" into "time", "f" into "fastfourier and "std" into 
## "standarddeviation"
features <- gsub("^t", "time", features)
features <- gsub("^f", "fastfourier", features )
features <- gsub("std$", "standarddeviation", features)

## Column labels containig "bandsEnergy" are repeated.  The next step creates
## unique labels
features <- make.unique(features)



## Create an activity labels tibble
activityLabels <- read_delim(
    file.path(
        rawDir,
        sourceDir,
        "activity_labels.txt"
        ),
    delim = " ",
    col_names = FALSE,
    col_types = cols(
        X1 = col_factor(ordered = TRUE),
        X2 = col_character()
        )
    )

## Read the test data and change the column names using the data stored in
## features
test <- read_delim(
    file.path(
        rawDir,
        sourceDir,
        "test",
        "X_test.txt"),
    delim = " ",
    col_names = features,
    ## col_types need to be specified otherwise readr parses some columns as
    ## characters
    col_types = cols(
        .default = col_double()
        ),
    trim_ws = TRUE,
    )

## Manipulate "test" object to fit the assignment requirements

test <- test %>% 
    ## Select the column names containing "mean" and "standarddeviation"
    select(
        matches(
            "^[ft]*mean$|mean[xyz]|standarddeviation$|standarddeviation[xyz]",
            perl = TRUE,
        )
    ) %>%
    ## Add the subject as a factor column
    mutate(
        "subject" = pull(
            read_delim(
                file.path(
                    rawDir,
                    sourceDir,
                    "test",
                    "subject_test.txt"),
                delim = " ",
                col_names = FALSE,
                col_types = list(
                    col_factor(levels = c(1:30))
                    )
                )
            )
        ) %>%
    ## Add the activity labels as a number column
    mutate(
        "activitylabel" = pull(
            read_delim(
                file.path(
                    rawDir,
                    sourceDir,
                    "test",
                    "y_test.txt"),
                delim = " ",
                col_names = FALSE,
                col_types = list(
                    col_number()
                )
            )
        )
    ) %>%
    ## Replace the activity label numbers with the activity labels
    mutate(
        activitylabel = recode_factor(
            activitylabel,
            `1` = activityLabels$X2[1],
            `2` = activityLabels$X2[2],
            `3` = activityLabels$X2[3],
            `4` = activityLabels$X2[4],
            `5` = activityLabels$X2[5],
            `6` = activityLabels$X2[6]
            )
        )

## Read the train data and change the column names using the data stored in
## features
## NOTE: There are multiple warnings because the column names containing
## "bandsEnergy" repeat themselves.  They will be removed on the next step
train <- read_delim(
    file.path(
        rawDir,
        sourceDir,
        "train",
        "X_train.txt"),
    delim = " ",
    col_names = features,
    ## col_types need to be specified otherwise readr parses some columns as
    ## characters
    col_types = cols(
        .default = col_double()
    ),
    trim_ws = TRUE,
)

## Manipulate "train" object to fit the assignment requirements

train <- train %>%
    ## Select the column names containing "mean" and "standarddeviation"
    select(
        matches(
                "^[ft]*mean$|mean[xyz]|standarddeviation$|standarddeviation[xyz]",
            perl = TRUE,
        )
    ) %>%
    ## Add the subject as a factor column
    mutate(
        "subject" = pull(
            read_delim(
                file.path(
                    rawDir,
                    sourceDir,
                    "train",
                    "subject_train.txt"),
                delim = " ",
                col_names = FALSE,
                col_types = list(
                    col_factor(levels = c(1:30))
                )
            )
        )
    ) %>%
    ## Add the activity labels as a number column
    mutate(
        "activitylabel" = pull(
            read_delim(
                file.path(
                    rawDir,
                    sourceDir,
                    "train",
                    "y_train.txt"),
                delim = " ",
                col_names = FALSE,
                col_types = list(
                    col_number()
                )
            )
        )
    ) %>%
    ## Replace the activity label numbers with the activity labels
    mutate(
        activitylabel = recode_factor(
            activitylabel,
            `1` = activityLabels$X2[1],
            `2` = activityLabels$X2[2],
            `3` = activityLabels$X2[3],
            `4` = activityLabels$X2[4],
            `5` = activityLabels$X2[5],
            `6` = activityLabels$X2[6]
        )
    )

## Join test and train tibbles and save it to fullDS
fullDS <- full_join(test,train)

## Group fullDS by "activitylabel" and "subject" and summarize all variables using mean
summarizedDS <- fullDS %>% 
    group_by(
        activitylabel,
        subject
        ) %>% 
    summarize_all(
        list(
            average = mean
            )
        )

## Write summarizedDS into a txt file
write.table(
    summarizedDS,
    "summarizedDS.txt",
    row.names = FALSE
    )