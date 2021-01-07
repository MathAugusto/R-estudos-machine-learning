
# Import the dataframe 
df<- read.csv("Salary_simple_linear_regression.csv")
head(df)

# Splitting the data in training and test 

# Install the "caTools" library
#install.packages("caTools")
library(caTools)
set.seed(123)
# adiciona somente o Y e escolhe a porcentagem de TREINO
split = sample.split(df$Salary, SplitRatio = 2/3)
# Criando set de treino e teste
train_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)


# Regressao linear simples NAO PRECISA de Feature Scaling
# Fit da regressao linear no Train Set
regressor = lm(formula = Salary ~ YearsExperience, 
               data=train_set)
# Dados sobre o regressor
summary(regressor)

#Predict dos resultados do set de TESTE:
y_pred = predict(regressor, newdata = test_set)

# Visualization: com GGPLOT2
# SET DE TREINO (TRAIN_SET)
library(ggplot2)
ggplot() +
  geom_point(aes(x=train_set$YearsExperience, y=train_set$Salary),
             colour='red') +
  geom_line(aes(x=train_set$YearsExperience, y=predict(regressor, newdata = train_set)),
            colour="blue") +
  ggtitle('Salary vs Experience (TRAINING Set)') +
  xlab('Years of Experience') +
  ylab("Salary")

# SET DE TESTE (TEST_SET)

ggplot() +
  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
             colour='red') +
  geom_line(aes(x=train_set$YearsExperience, y=predict(regressor, newdata = train_set)),
            colour="blue") +
  ggtitle('Salary vs Experience (TEST Set)') +
  xlab('Years of Experience') +
  ylab("Salary")
