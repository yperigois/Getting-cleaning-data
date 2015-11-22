
run<-function()
{  
library(data.table)
library(dplyr)

#reading and loading raw data  
xx2_test<-fread("./test/X_test.txt", sep = "auto")
yy2_test<-fread("./test/Y_test.txt", sep = "auto")
subj_test<-fread("./test/subject_test.txt", sep = "auto") 
xx2_train<-fread("./train/X_train.txt", sep = "auto")
yy2_train<-fread("./train/Y_train.txt", sep = "auto")
subj_train<-fread("./train/subject_train.txt", sep = "auto") 

#combining test and train datsets
k_xx<-rbind(xx2_test, xx2_train)
k_yy<-rbind(yy2_test, yy2_train)
k_subj<-rbind(subj_test, subj_train)

k_xx<-data.frame(k_xx)

#Reading and loading the features dataset
features<-fread("./features.txt", sep = "auto")


#Adding the column names loaded from Features
names(k_xx)<-features$V2

#extracting features containing "mean" and standard deviation "std"
extract<-sort(c(grep("mean", features$V2),grep("std", features$V2)))

#keep columns that contain "mean" and "std" 
k_xx<-k_xx[,extract]

#Create one table with subject identification, activity identification, all records including mean and std features
k_all<-cbind(subject=k_subj,move= k_yy, k_xx)
k_all=data.table(k_all)

#loading the activity labels
activity<-fread("./activity_labels.txt", sep = "auto")
names (activity)<- c("No","Activity Name")

#loading the activity labels and to k_all adding a new column with activity label corresponding to activity code
ractivity<-function(k) {activity[k,]$"Activity Name"}
k_all<-mutate(k_all, "Activity Name"=ractivity(move.V1))

k_all<-data.frame(k_all)

#Keeping columns in the following order: "subject", "activity Name", and columns containing "mean" or "std"
k_all<-k_all[,c(2, 1, 82,c(3:81))]

#Group the table by subject and Acivity Name

grp<-group_by(k_all, subject.V1,Activity.Name)

#Calculate the mean of the features grouped by subject and "Activity Name"

h<-summarise_each(grp, funs(mean), c(4:82))

h<-data.table(h)
print(h)
return(h)
}

res<-run()
write.table(res, file="Project result 2.txt",row.name=FALSE )


