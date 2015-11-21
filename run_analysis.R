
run<-function()
{  
library(data.table)
library(dplyr)
xx<-read.csv("./test/X_test.txt", sep = "")
yy<-read.csv("./test/Y_test.txt", sep = "")
xx2_test<-fread("./test/X_test.txt", sep = "auto")
yy2_test<-fread("./test/Y_test.txt", sep = "auto")
subj_test<-fread("./test/subject_test.txt", sep = "auto") 
xx2_train<-fread("./train/X_train.txt", sep = "auto")
yy2_train<-fread("./train/Y_train.txt", sep = "auto")
subj_train<-fread("./train/subject_train.txt", sep = "auto") 
k_xx<-rbind(xx2_test, xx2_train)
k_yy<-rbind(yy2_test, yy2_train)
k_subj<-rbind(subj_test, subj_train)
features<-fread("./features.txt", sep = "auto")
k_xx<-data.frame(k_xx)
names(k_xx)<-features$V2
extract<-sort(c(grep("mean", features$V2),grep("std", features$V2)))
k_xx<-k_xx[,extract]
k_all<-cbind(subject=k_subj,move= k_yy, k_xx)
k_all=data.table(k_all)
activity<-fread("./activity_labels.txt", sep = "auto")
names (activity)<- c("No","Activity Name")
k_all<-data.frame(k_all)
ractivity<-function(k) {activity[k,]$"Activity Name"}
k_all<-mutate(k_all, "Activity Name"=ractivity(move.V1))

k_all<-k_all[,c(2, 1, 82,c(3:81))]
grp<-group_by(k_all, subject.V1,`Activity Name`)
h<-summarise_each(grp, funs(mean), c(4:82))
h<-data.table(h)
print(h)
}

write.table(h, file="Project result.txt",row.name=FALSE )
