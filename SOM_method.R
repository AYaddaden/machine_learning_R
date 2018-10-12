#SOM method using iris dataset
library(kohonen)

dataset = iris[-5]

data <- scale(dataset)
som <- som(data)

plot(som,main = "data", type="dist.neighbours")
plot(som,type="count")

plot(som,type="dist.neighbours")

plot(som,type="codes")

plot(som,type="mapping",labels=iris$Species)

plot(som,type="quality")