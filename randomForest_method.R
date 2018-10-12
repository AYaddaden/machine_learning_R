library(randomForest)
library(mlbench)

rf <- randomForest(Species~.,data=iris,importance=TRUE, proximity=TRUE)

rf

data(Glass)
rf <- randomForest(Type~.,data=Glass,importance=TRUE, proximity=TRUE)
rf

data("Shuttle")

dim(Shuttle)

rf <- randomForest(Class~.,data=Shuttle,importance=TRUE, proximity=TRUE)
rf


