# Data pre-processing and train-test-split

# Import the dataframe ---------------------------------------------------
df <- read.csv("Data.csv")
head(df)


# Taking care of missing data --------------------------------------------
# Age
df$Age = ifelse(is.na(df$Age),
                ave(df$Age, FUN = function(x) mean(x, na.rm=TRUE)),
                df$Age)
# Salary
df$Salary = ifelse(is.na(df$Salary),
                   ave(df$Salary, FUN = function(x) mean(x, na.rm=TRUE)),
                   df$Salary)


# Encoding categorical data ----------------------------------------------
# Country
df$Country = factor(df$Country,
                       levels = c('France', 'Spain', 'Germany'),
                       labels = c(1, 2, 3))
# Purchased
df$Purchased= factor(df$Purchased,
                    levels = c('No', 'Yes'),
                    labels = c(0, 1))


# Splitting the data in training and test -----------------------------------

# Install the "caTools" library
#install.packages("caTools")
library(caTools)
set.seed(123)
# adiciona somente o Y e escolhe a porcentagem de TREINO
split = sample.split(df$Purchased, SplitRatio = 0.8)
# Criando set de treino e teste
train_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)


# Feature Scaling ------------------------------------------------------------
# Excluir as colunas que são factor, o modelo reconhece numeros apenas.
# Standarlization or Normalization
train_set[, 2:3] = scale(train_set[, 2:3])
test_set[,2:3]= scale(test_set[,2:3])




