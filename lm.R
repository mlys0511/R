### lm
# lm(formula,data,...)
# formula : ex) y~x1+x2
# data : formula에 사용된 변수가 있는 데이터 객체 지정


# 설명변수 x1입력
광고비 = c(3,6,7,6,8,9,10,4,5,6)   

# 설명변수 x2입력
사후비용 = c(16,19,21,15,18,23,21,17,16,19)  

# 반응변수 y입력
매출액 = c(34,39,41,38,43,51,52,37,43,43)

# 데이터 만들기
sale.dt = data.frame(광고비,사후비용,매출액)

# 랜덤 sample 만들기
s=sample(1:10,7)

# train 및 test 데이터 만들기
train=sale.dt[s,]
test=sale.dt[-s,]

# 모형 구축
sale.reg= lm(매출액~광고비+사후비용, data=sale.dt)
sale.reg
summary(sale.reg)

# 최종 모형 구축
sale.reg.final=lm(매출액~광고비,data=train)
sale.reg.final
# y= 25.159 + 2.551*광고비

# 최종 모형 검증
test.x1=subset(test,select=광고비)
test.predict=predict(sale.reg.final,test.x1)
test.predict

# MSE( Mean Squared Error)
sum(test$매출액-test.predict)^2/length(test$매출액)

# 결론 : 다른 데이터 마이닝 모형들과 MSE 값을 비교하여 이 값이 가장 작은 모형을 선택한다.