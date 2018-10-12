library(mlbench)
library(cluster)
data(Vehicle)
##K-means
data = iris[-5]
KM = kmeans(data,3)

KM

### Représentation graphique

clusplot(data,KM$cluster,color=TRUE)

## Hierarchique

d = dist(data,method="euclidian")
cah = hclust(d,method="ward.D")
plot(cah)

cah1 = cutree(cah,3)
sort(cah1)


