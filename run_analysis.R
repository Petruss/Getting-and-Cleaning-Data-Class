# check and create working directory
getwd()
if (!file.exists("projectdata")) {dir.create("projectdata")}
# Download file and unzip file to folder
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./projectdata/Dataset.zip", mode = "wb")
unzip<- unzip( "./projectdata/Dataset.zip", exdir= "projectdata")
##set working directory to folder with unzipped data
setwd("./projectdata/UCI HAR Dataset")
##read headers file
headerfile<- read.table("features.txt", stringsAsFactors=FALSE)
headerfile1<- headerfile[,2]
colheader<- c("participant","activity", headerfile1)
##read test and label data files- and create test DF
testdata<- read.table("./test/x_test.txt", header = FALSE)
subjectfile_t<- read.table("./test/subject_test.txt", header = FALSE)
activityfile_t<- read.table("./test/y_test.txt" , header = FALSE)
testdf <- (cbind(cbind(subjectfile_t,activityfile_t),testdata))
names(testdf)  <- colheader
##read test data files- test file and labels files
traindata<- read.table("./train/x_train.txt", header = FALSE)
subjectfile_tr<- read.table("./train/subject_train.txt", header = FALSE)
activityfile_tr<- read.table("./train/y_train.txt" , header = FALSE)
traindf <- (cbind(cbind(subjectfile_tr,activityfile_tr),traindata))
names(traindf)  <- colheader
##combine test and train DF
combineddata<- rbind(testdf,traindf)
##change activity names to name the activities in the data set
act<- combineddata$activity
act1<- gsub("1","walking",act)
act2<-gsub("2","Walkingupstairs",act1)
act3<-gsub("3","walkingdownstairs", act2)
act4<-gsub("4","sitting",act3)
act5<-gsub("5","standing",act4)
  act6<-gsub("6","laying",act5)
combineddata$activity <-act6
##lower the case in collumn header and identify collumns with mean and std 
##and subset collumns using the collumn position.
names(combineddata)<- tolower(names(combineddata))
col_list1<- grep("std",names(combineddata))
col_list2<- grep("mean",names(combineddata))
collumnlist <- sort(c(1:2,col_list1,col_list2))
meanandsdev<- (combineddata[,collumnlist])
##cleanup the variable names for the dataset(meanandsdev). At the risk of making long collumn 
##names I added time,frequency, gyroscope, standard deviation, acceleration
##magnitude etc, removed "()". I left "-" character to make it easy on the readers eyes.
names(meanandsdev)<- gsub("^t","time",names(meanandsdev))
names(meanandsdev)<- gsub("^f","frequency",names(meanandsdev))
names(meanandsdev)<- gsub("[t][b][o][d][y]","timebody",names(meanandsdev))
names(meanandsdev)<- gsub("[-][m][e][a][n][(][)]","mean",names(meanandsdev))
names(meanandsdev)<- gsub("[s][t][d][(][])]","std",names(meanandsdev))
names(meanandsdev)<- gsub("[f][r][e][q][(][)]","frequency",names(meanandsdev))
names(meanandsdev)<- gsub("[s][t][d]","standarddeviation",names(meanandsdev))
names(meanandsdev)<- gsub("[a][c][c]","acceleration",names(meanandsdev))
names(meanandsdev)<- gsub("[m][a][g]","magnitude",names(meanandsdev))
names(meanandsdev)<- gsub("[g][y][r][o]","gyroscope",names(meanandsdev))
names(meanandsdev)<- gsub("[a][n][g][l][e]","anglebetween",names(meanandsdev))
names(meanandsdev)<- gsub(" ","",names(meanandsdev))
##create a tidy data set with the average by participant and activity
tidydata<- aggregate(meanandsdev[3:88], by=meanandsdev[c("participant","activity")], FUN=mean)
##view tidydataset 
tidydata







