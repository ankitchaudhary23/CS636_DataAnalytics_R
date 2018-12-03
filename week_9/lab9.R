library(tidyverse)
library(rpart)
library(modelr)
library(ROCR)
library(mlbench)
library(caret)

N=2000 # sample size
set.seed(1) #Make simulation reproducible
x1=rnorm(N,0,1);
x2=rnorm(N,0,1)
fx= - 1 + 3*x1 - 2*x2
y=rbinom(N, 1, exp(fx)/(1+exp(fx)))
y=factor(y)
simu.data=data.frame(y,x1,x2)
train.data<- simu.data[1:(N/2),]
test.data<- simu.data[-(1:(N/2)),]

# glm(y ~ x1 + x2, family=binomial, data=train.data)

#Call:  glm(formula = y ~ x1 + x2, family = binomial, data = train.data)

#Coefficients:
#(Intercept)           x1           x2  
#     -1.120        3.121       -2.149  
#
#Degrees of Freedom: 999 Total (i.e. Null);  997 Residual
#Null Deviance:      1335 
#Residual Deviance: 574.3        AIC: 580.3


#The fitted logistic Model
glm1<-glm(y ~ x1 + x2, family=binomial, data=train.data)

#(1) Prediction over training data
# ?predict.glm to see more information about predict()
train.y_hat=factor(as.numeric(predict(glm1, newdata=train.data, type = "response")>0.5))
##How accurate
#confusion table
table(train.data$y, train.y_hat)

#> table(train.data$y, train.y_hat)
#   train.y_hat
#      0   1
#  0 556  57
#  1  67 320

#accuracy
mean(train.data$y == train.y_hat)
#> mean(train.data$y == train.y_hat)
#[1] 0.876

#(1) Prediction over testing data
test.y_hat=factor(as.numeric(predict(glm1, newdata=test.data[,-1], type = "response")>0.5))
table(test.data$y, test.y_hat)
mean(test.data$y == test.y_hat)

#> table(test.data$y, test.y_hat)
#   test.y_hat
#      0   1
#  0 544  55
#  1  84 317
#> mean(test.data$y == test.y_hat)
#[1] 0.861
#

# leave one out validation
nn=nrow(simu.data)
LOO.y_hat=gl(n=2, k=1, labels=0:1, len=nn)  #what is gl()?  Try ?gl
#or LOO.yy=rep(NA, len=nn)                       
for (i in 1:nn) {
  glm1<-glm(y ~ x1 + x2, family=binomial, data=simu.data[-i,])
  LOO.y_hat[i]=as.numeric(predict(glm1, newdata=simu.data[i,], type = "response")>0.5)
}
#Arruracy
table(y, LOO.y_hat)
mean(y == LOO.y_hat)

#> table(y, LOO.y_hat)
#   LOO.y_hat
#y      0    1
#  0 1101  111
#  1  145  643
#> mean(y == LOO.y_hat)
#[1] 0.872


########Kaggle Data

library(dplyr)
library(glmnet)
library(ROCR)
library(e1071)

a=read.csv("train.csv")

# str(a)
#'data.frame':   76020 obs. of  371 variables:
# $ ID                           : int  1 3 4 8 10 13 14 18 20 23 ...
# $ var3                         : int  2 2 2 2 2 2 2 2 2 2 ...
# $ var15                        : int  23 34 23 37 39 23 27 26 45 25 ...
# $ imp_ent_var16_ult1           : num  0 0 0 0 0 0 0 0 0 0 ...
# $ imp_op_var39_comer_ult1      : num  0 0 0 195 0 0 0 0 0 0 ...
# $ imp_op_var39_comer_ult3      : num  0 0 0 195 0 0 0 0 0 0 ...
x<- select(a, -ID, -TARGET) #remove ID column, and Target Column
y<- a$TARGET
#remove constant features
x1<- x[,apply(x, 2, sd)>0]

train.inx<- 1:70000

train.x<- as.matrix(x1[train.inx,]); train.y<- as.factor(y[train.inx])
test.x<- as.matrix(x1[-train.inx,]); test.y<- as.factor(y[-train.inx])


##(1) logistic regression with L1 regularization (lasso)
glmnet.fit<-cv.glmnet(x=train.x, y=train.y,family="binomial",type.measure="auc",nfolds=5)
plot(glmnet.fit)
pdf(file="Kaggle5CVplot.pdf")
plot(glmnet.fit)
dev.off()

train.yhat<- predict(glmnet.fit,type="response",newx=train.x)
train.auc<- performance(prediction(train.yhat[,1],train.y),"auc")@y.values[[1]]

#test on test data
test.yhat<- predict(glmnet.fit,type="response",newx=test.x)
test.auc<- performance(prediction(test.yhat[,1],test.y),"auc")@y.values[[1]]

train.auc
test.auc
#> train.auc
#[1] 0.7914178
#> test.auc
#[1] 0.8021744

test.pred <- prediction(test.yhat[,1],test.y)
test.perf <- performance(test.pred,"tpr","fpr")
plot(test.perf)

pdf(file="KaggleTestROCcurv.pdf")
plot(test.perf)
dev.off()

##(2) SVM
model.SVM <- svm(train.x, train.y) 
#Warning message:
#In svm.default(train.x, train.y) :
#  Variable(s) ��imp_reemb_var17_hace3�� and ��num_reemb_var17_hace3�� constant. Cannot scale data.
#> print(model.SVM)
#
#Call:
#svm.default(x = train.x, y = train.y)
#
#
#Parameters:
#   SVM-Type:  C-classification 
# SVM-Kernel:  radial 
#       cost:  1 
#      gamma:  0.002985075 
#
#Number of Support Vectors:  56387

# train AUC
train.pred.SVM <- predict(model.SVM, train.x, decision.values = T)
svm.train.auc <- performance(prediction(-attr(train.pred.SVM, "decision.values"),train.y),"auc")@y.values[[1]]

# test AUC
pred.SVM <- predict(model.SVM, test.x, decision.values = T)
svm.test.auc <- performance(prediction(-attr(pred.SVM, "decision.values"),test.y),"auc")@y.values[[1]]

svm.train.auc
svm.test.auc

#> svm.train.auc
#[1] 0.9569993
#> svm.test.auc
#[1] 0.4985603

