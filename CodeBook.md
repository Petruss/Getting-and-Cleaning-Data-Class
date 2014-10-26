#Getting-and-Cleaning-Data-Class
===============================

##Getting and Cleaning Data Class Project:

I worked on cleaning the data on Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The raw data was in downloaded and unzipped from the size:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

I obtained the files:
- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.


##These files formed the basis of the combined data frame and ultimately the tidydata, which were obtained as follows:

1.created a folder called "projectdata" where to download and save files.

2.Using download.file, I dowloaded each zip folder containing the files above.

3.Using the unzip() funtion I unzipped the files to the folder "projectdata"  subfolder UCI HAR Dataset.

4.Set working directory to UCI HAR Dataset and  read the features  and activity_labels files above into [R] using read.table() function.

5.The train and test files each have the corresponding subject and activity files found in the train/test subfolder. These files will be read from here.

6.I read the fetaure text file, which contains all the collumn headers into a dataframe. I isolate the collumn with the variable/collumn names 
to create vector of the collumn names of length 561, and add a collumn name for "participant/subject" and "activity", making length to 563. This vector will 
 be used to add the collumn/ variable names to the test and train dataset below.

7.I read test and train into two respective tables with 561 variables and no collumn name, or activity and participants information. Using cbind() funtion 
 I add the paticipant/subject and activity data to the test and train data respectively making 563 variables. 
I added the collumn names  from the names vector above to each dataset. 

8.The two datasets test(2947 observation and 563 variables) and train(7352 observations and 563 variabiles), can now be merged using rbind() function.

9.With the combined data set I mapped the activity(from activity label file) names to the data using the activity codes(1-6) in the activity collumn.
 I used gsub() funtion to change the activity key to name.

10.To get collumns with the mean and standard deviation only,I use the grep() funtion to get the collumn header position,
that has mean or standard deviation in it. The resultant vector list is used to subset to a small datafrme, with 88 variable names.

11.The smaller dataset is now ready for cleaning,by making the variable names easy to read.In this step, at the risk of making
my collumn names too long,the following are made "t" to time, "f" for frequency, "std" to standarddeviation, "acc" to acceleration,
"mag" to magitude, "gyro" to gyroscope , angle to anglebetween,"()" and spaces are removed. I left some special characters ,"-",
to make it easy on the eyes to read. 

12.The last step calculates a mean value,on every participant and activity combination across the 86 mean and standard deviation
measured variables.The resulting dataset is a tidydataset of 88 collumns and 180 rows.


##The collumn header for the tiddataset are:

-participant
-activity
-timebodyaccelerationmean-x
-timebodyaccelerationmean-y
-timebodyaccelerationmean-z
-timebodyacceleration-standarddeviation-x
-timebodyacceleration-standarddeviation-y
-timebodyacceleration-standarddeviation-z
-timegravityaccelerationmean-x
-timegravityaccelerationmean-y
-timegravityaccelerationmean-z
-timegravityacceleration-standarddeviation-x
-timegravityacceleration-standarddeviation-y
-timegravityacceleration-standarddeviation-z
-timebodyaccelerationjerkmean-x
-timebodyaccelerationjerkmean-y
-timebodyaccelerationjerkmean-z
-timebodyaccelerationjerk-standarddeviation-x
-timebodyaccelerationjerk-standarddeviation-y
-timebodyaccelerationjerk-standarddeviation-z
-timebodygyroscopemean-x
-timebodygyroscopemean-y
-timebodygyroscopemean-z
-timebodygyroscope-standarddeviation-x
-timebodygyroscope-standarddeviation-y
-timebodygyroscope-standarddeviation-z
-timebodygyroscopejerkmean-x
-timebodygyroscopejerkmean-y
-timebodygyroscopejerkmean-z
-timebodygyroscopejerk-standarddeviation-x
-timebodygyroscopejerk-standarddeviation-y
-timebodygyroscopejerk-standarddeviation-z
-timebodyaccelerationmagnitudemean
-timebodyaccelerationmagnitude-standarddeviation
-timegravityaccelerationmagnitudemean
-timegravityaccelerationmagnitude-standarddeviation
-timebodyaccelerationjerkmagnitudemean
-timebodyaccelerationjerkmagnitude-standarddeviation
-timebodygyroscopemagnitudemean
-timebodygyroscopemagnitude-standarddeviation
-timebodygyroscopejerkmagnitudemean
-timebodygyroscopejerkmagnitude-standarddeviation
-frequencybodyaccelerationmean-x
-frequencybodyaccelerationmean-y
-frequencybodyaccelerationmean-z
-frequencybodyacceleration-standarddeviation-x
-frequencybodyacceleration-standarddeviation-y
-frequencybodyacceleration-standarddeviation-z
-frequencybodyacceleration-meanfreq-x
-frequencybodyacceleration-meanfreq-y
-frequencybodyacceleration-meanfreq-z
-frequencybodyaccelerationjerkmean-x
-frequencybodyaccelerationjerkmean-y
-frequencybodyaccelerationjerkmean-z
-frequencybodyaccelerationjerk-standarddeviation-x
-frequencybodyaccelerationjerk-standarddeviation-y
-frequencybodyaccelerationjerk-standarddeviation-z
-frequencybodyaccelerationjerk-meanfreq-x
-frequencybodyaccelerationjerk-meanfreq-y
-frequencybodyaccelerationjerk-meanfreq-z
-frequencybodygyroscopemean-x
-frequencybodygyroscopemean-y
-frequencybodygyroscopemean-z
-frequencybodygyroscope-standarddeviation-x
-frequencybodygyroscope-standarddeviation-y
-frequencybodygyroscope-standarddeviation-z
-frequencybodygyroscope-meanfreq-x
-frequencybodygyroscope-meanfreq-y
-frequencybodygyroscope-meanfreq-z
-frequencybodyaccelerationmagnitudemean
-frequencybodyaccelerationmagnitude-standarddeviation
-frequencybodyaccelerationmagnitude-meanfreq
-frequencybodybodyaccelerationjerkmagnitudemean
-frequencybodybodyaccelerationjerkmagnitude-standarddeviation
-frequencybodybodyaccelerationjerkmagnitude-meanfreq
-frequencybodybodygyroscopemagnitudemean
-frequencybodybodygyroscopemagnitude-standarddeviation
-frequencybodybodygyroscopemagnitude-meanfreq
-frequencybodybodygyroscopejerkmagnitudemean
-frequencybodybodygyroscopejerkmagnitude-standarddeviation
-frequencybodybodygyroscopejerkmagnitude-meanfreq
-angle(timebodyaccelerationmean,gravity)
-angle(timebodyaccelerationjerkmean),gravitymean)
-anglebetween(timebodygyroscopemean,gravitymean)
-anglebetween(timebodygyroscopejerkmean,gravitymean)
-anglebetween(x,gravitymean)
-anglebetween(y,gravitymean)
-anglebetween(z,gravitymean)

The participant collumn represents the 30 people who participated in the expiriment. These are labled 1-30.

The activity collumn show the 6 activityies that data were collected for. In the original data these are labled 1 to 6 but through

the above process they are labled as:1-walking, 2-Walkingupstairs, 3-walkingdownstairs, 4-sitting, 5-standing, 6-laying. 

The other collumns(3:88) show the mean values of the original measured mean and standard deviation values on
participant and activity.


From the expiriment documentation the above variables are explained as:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ 
and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.
 Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency
 of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration
 signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using
 the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ,
 fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
 







###License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
