library(mlbench)
library(dbscan)

#data(Vehicle)
#data(Glass)

#dataset = Vehicle[-19]
#dataset = Glass[-10]
dataset = iris[-5]
#nombre de voisins: nombre de class + 1 //dimentionalité + 1
kNNdistplot(dataset,k=2)
abline(h=0.4,col="red",lty=2)

res <- dbscan(dataset,eps=30,minPts = 4)
res

hullplot(dataset,res)

pairs(Vehicle,col=res$cluster+1)

plot(dataset,col=res$cluster)
