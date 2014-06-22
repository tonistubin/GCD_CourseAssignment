##Creating a tidy dataset for Coursera’s Getting and Cleaning Data course

File __run_analysis.R__ includes the function that produces the final clean dataset (cleanData.txt). Original files, where the data was obtained, can be downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

__run_analysis.R__ works as intended when placed in the root folder of the downloaded original dataset.

The original data contains 3-axial measurements taken from Samsung Galaxy S II smartphone’s accelerometer. There were 30 volunteers who performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing the phone.

The resulting dataset was divided into two groups, where 21 of the volunteers generated the training data and the remaining 9 the test data. 

The clean dataset was made by combining measurements from both groups. Files __X_test.txt__ and __X_train.txt__ included all the measurement data. __Subject_test.txt__ and __subject_train.txt__ had the numbers of the volunteers separated from the measurement data. Also the numbers for activities were in separate files, __Y_test.txt__ and __Y_train.txt__.

After combining the data from test and train groups, the activity numbers were converted into meaningful names according to information in the __activity_labels.txt__ file.

The names for the measurement variables were read in from the file features.txt and cleaned from characters “(“ and “)” that could present problems when doing programmatic calculations with the data.

For the final dataset, only variables that contained the text mean and std were chosen. Some of these variable names (e.g., meanFreq) contain intermediate data used for calculating final mean values. They have also been included for coherence.

Lastly, the mean values by activity and volunteering subject for selected values were calculated and saved as a tab delimited file __cleanData.txt__.

There are 88 variables and 180 observations in the final clean dataset. For every one of the 30 volunteers there are six observations according to the activity performed.

The first column states the volunteer’s number (1 to 30), the second column states the activity. The remaining 86 columns state the mean of the all the original mean and standard deviation values.

Please find specific information about the variables in the clean data set in the __CodeBook.md__ file in this repository.

_This text has been modified from the original work and README.txt file by:_

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

