library(mlbench)
library(e1071)
data(Glass)
summary(Glass)
n = dim(Glass)[1]

appren = Glass[1: n*0.7,]
test = Glass[n*0.7+1:n,]

nb.model<- naiveBayes(Type~.,data=appren)
pred=predict(object = nb.model,newdata=test)
test.mod<- cbind(test,pred)

head(test.mod,5)

confusion = table(test.mod$Type,test.mod$pred)
round(prop.table(confusion),2)

