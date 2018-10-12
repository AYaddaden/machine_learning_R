library(arules)
library(mlbench)
data(Adult)

itemFrequencyPlot(Adult)
rules<- apriori(Adult,parameter = list(support=0.01,confidence=0.6))
summary(rules)
inspect(rules)

# lift =  degre de depnedance entre les itemset en sortie
inspect(rules[1:10])
rules1 = sort(rules,by="lift")
inspect(rules1[1:5])

rules.incomSmall <- subset(rules,subset =rhs %in% "income=small")
rules.incomSmall <- sort(rules.incomSmall,by="confidence")
inspect(rules.incomSmall[1:5])

rules2 <- subset(rules,subset =rhs %in% "marital-status=Never-married" & lift>2)
rules.incomSmall <- sort(rules2,by="confidence")
inspect(rules2[1:5])

rule.sub <- subset(rules,subset =lhs %ain% c("age=Young","workclass=Private"))
rule.sub <- sort(rule.sub,by="confidence")
inspect(rule.sub[1:5])