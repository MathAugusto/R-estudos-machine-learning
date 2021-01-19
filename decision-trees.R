# RANDOM FORESTS AND DECISION TREES IN R

# DECISION TREES 
# usando dataframe do R kyphosis
str(kyphosis)
head(kyphosis)
# rpart para construir a árvore
tree <- rpart(Kyphosis ~ .,method = 'class', data = kyphosis)
# print arvore de classificacao
printcp(tree)
# Visualizando o plot da árvore
plot(tree,uniform = T,main = 'Kyphosis Tree')
text(tree, use.n = T, all = T)
# Visualizando com plot do rpart
library(rpart.plot)
library(rattle)
model<-rpart(Kyphosis~ Age+Number+Start, data=kyphosis)
fancyRpartPlot(model)
text(tree, use.n = T, all = T)


# RANDOM FOREST
library(randomForest)
modelo_rf <- randomForest(Kyphosis ~ .,method = 'class', data = kyphosis)
print(modelo_rf)
# Vendo o número de árvores
modelo_rf$ntree
# Matriz de confusão
modelo_rf$confusion
