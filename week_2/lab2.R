#Lab2

setwd("/Users/ankitchaudhary/Documents/IS_Sem1/DataAnalytics_with_R/week_2/")

#1
train<-read.csv("train.csv")
nrow(train)
#Output
#992931
ncol(train)
#Output
#2

#Show the right down corner element of each file in R (namely, last row, last column).
train[nrow(train),ncol(train)]

#2 Output the odd numbers of columns and even numbers of rows of train.csv
train[seq(0,nrow(train),by=2),seq(1,ncol(train),by=2)]

#3. Save into R objects and load them, using dput, dget, dump, source, save, load, save.image
listArr=data.frame(Numbers=1:26,Alphabets=LETTERS)
listArr %>% head
dput(listArr,file="listArr.R")
dget("listArr.R")
class(dget("listArr.R"))

listArr1=data.frame(Numbers=1:26,Alphabets=LETTERS)
listArr2="Empty List"

d<-dump(c("listArr1","listArr2"),file="dumpList.R")
d
#to remove variables from the memory
rm(listArr1,listArr2)
source("dumpList.R")

save(listArr1, listArr2, file = "saveLists.rda")
load("saveLists.rda")

save.image(file = "saveLists.RData")
load("saveLists.RData")

#4Install the readr Package, and use it to read in the data then. Any difference in terms of speed in
#loading the data?

#Reading of data from dataset is completely in fraction of seconds.
