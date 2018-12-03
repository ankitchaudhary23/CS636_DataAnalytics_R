
library(tidyverse)
library(rpart)
library(modelr)

trainData <- read.csv(file="/Users/ankitchaudhary/Documents/sem1_fall18/cs636_DataAnalytics_R/kaggle_wsdm/train.csv")

str(trainData)
glimpse(trainData)
summary(trainData)

#p1 <- trainData %>% ggplot(aes(is_churn, fill = is_churn)) + geom_bar() + theme(legend.position = "none")


splitTrainData<- resample_partition(trainData, c(test = 0.5, train  = 0.5))

lapply(splitTrainData, dim)

#fit a new model to our training data
#logistic regression model
model <- glm (is_churn ~ msno, data = splitTrainData$train, family = binomial)

summary(model)
