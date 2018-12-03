setwd("/Users/ankitchaudhary/Documents/IS_Sem1/DataAnalytics_with_R/Kaggle_hd/")
library(data.table)
#x<- fread("train.csv", sep=",")
head(x)
summary(x)
dim(x)
str(x)


distinct_relevance <- function(a){
  length((unique(a)))
}
len<- distinct_relevance(x$relevance)
len


count1<- function(a,v){
  length(which(a==v))
}
count1(x$relevance, 3.00)

count2<- function(a,v){
  table(length(which(a==v)))
}
count2(x$relevance, 3.00)

library(plyr)
count(x, "relevance")

 
getPi<- function(N){
  4*sum(((-1)^N) / (2*N+1))
  print(p)
}

#getPi(2)
p=0
#N=0  
while (p==0.8) {
  p<- getPi(2)
  #N= N+1
}


