library(class)
library(mlbench)
library(nnet)
library(e1071)
library(ramify)
data(Glass)
n = dim(Glass)[1]

index = sample(n,0.7*n)
index
appren = Glass[index,]
test = Glass[-index,]

nn = nnet(Type ~ ., data = appren, size = 100, rang = 0.1, decay = 5e-4, maxit = 200)
predi <- predict(nn, test[,-10])
predi
argpredi = argmax(predi)
argpredi
confustion <- table(pred = argpredi, test = test[,10])
confustion
