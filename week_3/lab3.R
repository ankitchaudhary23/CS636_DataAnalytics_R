#1, Please read the train.csv file into R and store the data in a variable called "X".
#https://www.kaggle.com/c/home-depot-product-search-relevance/data

setwd("/Users/ankitchaudhary/Documents/IS_Sem1/DataAnalytics_with_R/week_3/")

x<-read.csv("train.csv")

#2, Write a function, called "distinct_relevance", to count how many distinct values are in the
#column "relevance"? So when we call the function, it returns the desired results:
#  distinct_relevance (vect = X$relevance);
distinct_relevance<-function(vect = X$relevance) {
  dist_vect <- vect[1]
  count = 1
  for (i in vect) {
    if (i %in% dist_vect == TRUE) {
      next
    } else {
      dist_vect[count+1] <- i
      count <- count + 1
    }
  }
  count
}

len<- distinct_relevance(x$relevance)
len

#3, Write a function, called "count", to count the number of appearances of a value, e.g. 3, in
#the column "relevance", so when we call the function, it returns the desired results:
#  count(vect = X$relevance, value=3);

countX=function(vect,value){
  counter=0
  for(i in seq_len(length(vect))){
    if(vect[i]==value){
      counter=counter+1
    }
  }
  counter
}
countX(x$relevance, 3.00)

#4
table(x)

#5. Pi can be computed by adding the following terms
#(http://en.wikipedia.org/wiki/Pi):
#  How many terms does it take to get the first 3 digits to be correct, 3.14? Write an R function
#getPi(N) to compute it, where N specifies the first N digits to be correct, and returns #terms.

getPi=function(N){
  if(N<29){
  pi=0
  
  pie=trunc(3.14159265358979323846264338327*10^N)/10^N
  i=0
  flg=TRUE
  while(flg){
    pi=pi+(((-1)^i)/((2*i)+1))
    i=i+1
    if((trunc((4*pi)*10^N)/10^N)==pie){
      flg=FALSE
    }
  }
  print(i)
  }else{
    print("Enter Value less than 6")
  }
  
}

getPi(3)
