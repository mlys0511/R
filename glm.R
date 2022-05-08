###함수 설치
library(dplyr)
###데이터 불러오기a<-read.csv("C:/Users/kkang/Desktop/crx.data.data",sep=",")
###????데이터 구조 및 구성 확인(data)
dim(data)
names(data)
table(data)
boxplot(data)
###????데이터 뽑기a.s=data[,c(2,3,8,9,11,14,15)]
str(data.s)
### ???데이터 구조 바꾸기s.factor(data.s$t)
z=as.numeric(data.s$X30.83)
m=as.numeric((data.s$X00202))
x=(data.s[,c(-1,-4,-6)])
data.y.s=cbind(x,y,z,m)
###????결측치 제거.s=na.omit(data.y.s)
dim(data.na.s)
665*(7/10)
###train, test ?з?
s=s뽑기기e(1:665,465)
train=data.na.s[s,]
test=data.na.s[-s,]
###
(train)
str(train)
data.g=glm(y~., family=binomial, data=train)
summary(data.g)
train$X0

p=exp(-2.1623061+0.0764472*train$X0 +0.3020987*train$X1.25+0.4010907*train$X01+0.0003696*train$X0.1)/(1+exp(-2.1623061+0.0764472*train$X0 +0.3020987*train$X1.25+0.4010907*train$X01+0.0003696*train$X0.1))



train.test.pre=predict(data.g,test[])

