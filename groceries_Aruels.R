library(mlbench)
library(arules)

data(Groceries)

summary(Groceries)

rules<- apriori(Groceries,parameter = list(support=0.01,confidence=0.5))
summary(rules)
inspect(rules)

rules.incomSmall <- subset(rules,subset =rhs %in% "whole milk")
rules.incomSmall <- sort(rules.incomSmall,by="confidence")
inspect(rules.incomSmall)
