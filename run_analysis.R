# read datasets
XTrain<-read.table("train/X_train.txt")
YTrain<-read.table("train/y_train.txt")
XTest<-read.table("test/X_test.txt")
YTest<-read.table("test/y_test.txt")
trainsubj<-read.table("train/subject_train.txt")
testsubj<-read.table("test/subject_test.txt")

# (STEP1) merge train and test datasets
Test<-cbind(XTest,YTest,testsubj)
Train<-cbind(XTrain,YTrain,trainsubj)
Data1<-rbind(Test,Train)
featur<-read.table("features.txt")

# take values with mean and std
col_remain1<-grepl("mean",featur[,2])
col_remain2<-grepl("std",featur[,2])
col_remain<-col_remain1|col_remain2
col_remain<-c(col_remain,TRUE,TRUE)

# (STEP2) extracts measurements on mean and std
Data2<-Data1[,col_remain]

# (STEP3) use descriptive activity names
act<-read.table("activity_labels.txt")
act<-act[,2]
len<-nrow(Data2)
for (n in 1:len){
    if (Data2[n,80]=="1")
        {
            Data2[n,80]=as.character(act[1])
        }
    else if (Data2[n,80]=="2")
        {
        Data2[n,80]=as.character(act[2])
        }        
    else if (Data2[n,80]=="3")
    {
        Data2[n,80]=as.character(act[3])
    }
    else if (Data2[n,80]=="4")
    {
        Data2[n,80]=as.character(act[4])
    }
    else if (Data2[n,80]=="5")
    {
        Data2[n,80]=as.character(act[5])
    }
    else if (Data2[n,80]=="6")
    {
        Data2[n,80]=as.character(act[6])
    }
}

#make activity col as factor
Data2[,80]<-as.factor(Data2[,80])

# read descriptive variable names
lbl<-as.character(featur[,2])
lbl<-c(lbl,"Activity","SubjectId")
labl<-lbl[col_remain]

# (STEP4) give descriptive names
colnames(Data2)<-labl

# (STEP5) create tidy data set and save it in a txt file
tidy<-data.frame()
# aggregate by id and by activity
# loop this function for all variables
for (i in 1:79){
    tidy<-rbind(tidy,aggregate(Data2[,i],list(Data2$Activity,Data2$SubjectId),FUN=mean))
}
# create fourth column with variable name
tidy[,4]<-rep(colnames(Data2)[1:79],each=180)
# add col names
colnames(tidy)<-c("Activity","Id","Mean","Variable")

#write tidy dataset on txt file
write.table(tidy,file="tidy.txt",row.name=FALSE)
#OUTPUT tidy data set
tidy
