# Comparing between difference ML methods on Glass dataset using
# the same training samples and the same test samples for all the methods

library(class)
library(e1071)
library(mlbench)
library(rpart)
library(ramify)
library(nnet)
library(randomForest)

## General function to compute error rate fromo confusion matrix
computeErrorRate <- function(m){
  error <- sum(m) - sum(diag(m))
  return(error)
}

data(Glass)
# get number of line of the dataset
n = dim(Glass)[1]

# take 70% for training and 30% for testing randomly
index = sample(n,0.7*n)
#index
appren = Glass[index,]
#summary(Glass)
test = Glass[-index,]
#test



#SVM
svm.model <- svm(Type ~ ., data = appren)
svm.pred <- predict(svm.model, test[,-10])

confusion.svm = table(pred = svm.pred, true = test[,10])
confusion.svm


err = computeErrorRate(confusion.svm)
err/(n*0.3)

#NaiveBais

nb.model <- naiveBayes(Type~.,data=appren)
nb.pred <- predict(nb.model, test[,-10])

confusion.nb = table(pred = nb.pred, true = test[,10])
confusion.nb


err = computeErrorRate(confusion.nb)
err/(n*0.3)

# Neural Network
nn = nnet(Type ~ ., data = appren, size = 5, rang = 0.1, decay = 5e-4, maxit = 200)
predi <- predict(nn, test[,-10])
#predi
argpredi = argmax(predi)
#argpredi
confusion <- table(pred = cbind(argpredi), test = test[,10])
confusion

err = computeErrorRate(confusion)
err/(n*0.3)

# Decision Tree

dt.model <- rpart(Type~.,data=appren)
dt.pred <- predict(dt.model, test[,-10])
c= argmax(dt.pred)

confusion.dt = table(pred = c, true = test[,10])
confusion.dt


err = computeErrorRate(confusion.dt)
err/(n*0.3)

# random forest
rf <- randomForest(Type~.,data=Glass,importance=TRUE, proximity=TRUE)
rf

################################################################