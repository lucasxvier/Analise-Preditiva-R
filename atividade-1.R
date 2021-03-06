library(car)
library(PerformanceAnalytics)
library(MASS)

# Criar um modelo preditivo utilizando a regress�o linear composta que consiga prever o
# prest�gio de uma determinada profiss�o com base nas demais vari�veis preditoras.

attach(Prestige)
View(Prestige)
Prestige_ = Prestige[,-6]
#chart.Correlation(Prestige_)


ajuste = lm(prestige ~ education + income + women + census)
ajuste = lm(prestige ~ education + income)
summary(ajuste)
vif(ajuste)
stepAIC(ajuste, direction = "both")

par(mfrow=c(2,2))
plot(ajuste)

predict.lm(ajuste,data.frame(education=12.77,income=9271))
