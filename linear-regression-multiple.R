# Importando o DataFrame e checando informações:
startups <- read.csv("50_Startups.csv")
head(startups)
is.na(startups)
summary(startups)

# encode State column 
startups$State= factor(startups$State,
                     levels = c('New York','California', 'Florida'),
                     labels = c(1, 2,3))
head(startups)


# random state
set.seed(123)
# y e test_size
split = sample.split(startups$Profit, SplitRatio = 0.8)
# train e test
train_set = subset(startups, split == TRUE)
test_set = subset(startups, split == FALSE)


# Regressao linear multipla NAO PRECISA de Feature Scaling

# Fitting to the training set
# Pode passar assim e selecionar os "X": Profit ~ R.D.Spend + Administration + Marketing.Spend + State
# Ou usar um " . " e ele usa todos os argumentos
regressor = lm(formula = Profit ~ ., 
               data=train_set)
# Dados sobre o regressor
summary(regressor)

#-- Com os dados estatísticos obtidos pelo regressor, pode-se concluir que a unica variavel que tem feito sobre Y 
#-- No caso, é a variavel R.D.Spend, entao podemos mudar o modelo apenas para uma regressao simples
#-- Basta alterar o valor do regressor:
regressor = lm(formula = Profit ~ R.D.Spend, 
               data=train_set)

#Predict dos resultados do set de TESTE:
y_pred = predict(regressor, newdata = test_set)
y_pred



