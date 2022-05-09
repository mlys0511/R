###함수 설치
library(dplyr)
###데이터 불러오기
a<-read.csv("C:/use R/a/crx.data.data",sep=",")
###데이터 구조 및 구성 확인(data)
dim(data)
names(data)
table(data)
###데이터 뽑기
data.s=data[,c(2,3,8,9,11,14,15)]
str(data.s)
###데이터 구조 바꾸기
y=as.factor(data.s$t)
z=as.numeric(data.s$X30.83)
m=as.numeric((data.s$X00202))
x=(data.s[,c(-1,-4,-6)])
head(data.s)
data.y.s=cbind(x,y,z,m)
###결측치 제거하기
data.na.s=na.omit(data.y.s)
dim(data.na.s)
is.na(data.na.s)
665*(7/10)
###train, test 뽑기
s=sample(1:665,465)
train=data.na.s[s,]
test=data.na.s[-s,]
###train 신용등급
(train)
str(train)
data.g=glm(y~., family=binomial, data=train)
summary(data.g)

p=exp(-2.1623061+0.0764472*train$X0 +0.3020987*train$X1.25+0.4010907*train$X01+0.0003696*train$X0.1)/(1+exp(-2.1623061+0.0764472*train$X0 +0.3020987*train$X1.25+0.4010907*train$X01+0.0003696*train$X0.1))
credit<-as.numeric(p>0.5)
data.f<-data.frame(train,credit.1=c(credit))
data.f
###test 신용등급
p.t=exp(-2.1623061+0.0764472*test$X0 +0.3020987*test$X1.25+0.4010907*test$X01+0.0003696*test$X0.1)/(1+exp(-2.1623061+0.0764472*test$X0 +0.3020987*test$X1.25+0.4010907*test$X01+0.0003696*test$X0.1))
credit.1<-as.numeric(p.t>0.5)
credit.1
data.ff<-data.frame(test,credt.t=c(credit.1))
data.ff
