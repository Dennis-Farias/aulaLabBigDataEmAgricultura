library(ggplot2)
help('mtcars')
View(mtcars)

x = mtcars$wt
y = mtcars$mpg
plot(x,y)

lm(y ~ x)

abline(lm(y ~ x))

ggplot(mapping=aes(x, y)) + geom_point() + geom_smooth(method = 'lm')

retas = ggplot(mapping = aes(x, y)) + geom_point() + geom_smooth(se=FALSE, method='lm') + geom_hline(yintercept = mean(y))
retas

retas + geom_segment(aes(x=x, y=y, xend=x, yend=mean(y)), color='red')

retas + geom_segment(aes(x=x, y=y, xend=x, yend=predict(lm(y~x))), color='red')

sqt = sum((mean(y)-y)**2)

sqres = sum((predict(lm(y~x))-y)**2)

r2 = (sqt-sqres)/sqt

r2

modelo = lm(y ~ x)
predict(modelo)

pesos = data.frame(x = c(2.500, 3.000, 3.500))
pesos

predict(modelo, pesos)
