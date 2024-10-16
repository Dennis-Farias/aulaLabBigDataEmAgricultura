dados = read.csv('milknew.csv')
dados$Grade <- as.factor(dados$Grade)

str(dados)

View(dados)

nrow(dados)

sample(1:1059, 741)

filtro = sample(1:nrow(dados), nrow(dados)*0.7)
treino = dados[filtro,]
teste = dados[-filtro,]

library(rpart)
modelo = rpart(Grade ~., data=treino)

library(rpart.plot)
prp(modelo, extra=1)

library(caret)
prev = predict(modelo, teste, type = 'class')
View(prev)

confusionMatrix(prev, teste$Grade)
