### Neural Network [nnet] 패키지

#nnet(formula,data,weights,size,decay,...)
# formula : 모형설정
# data : 분석 데이터
# weights : 가중치 (defualt = 1)
# size : 은닉층의 노드 수
# decay : 가중치 decay 모수 (defualt = 0)

### predict 함수

# predict(object,newdata,type,...)
# object : 구축된 모형
# newdata : 테스트데이터
# type : raw(숫자),class(범주)

### 패키지 불러오기 
install.packages("nnet")
library(nnet)

### 데이터 불러오기
wine <- read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data",sep=",",header=F)

### 데이터 변수명
head(wine)
names(wine)=c('Wine_Class', 'Alcohol', 'Macid', 'Ash', 'Aofash', 'Magnesium', 'Tphenols', 'Flavanoids', 
            'Nphenols', 'Proanthocyanins', 'Color', 'Hue', 'OD280', 'Proline')

### 데이터 구조 확인
str(wine)
summary(wine)
plot(wine)

### 랜덤 Sample 만들기
set.seed(1400)
s=sample(1:178,round(178*0.7))    # round() = 반올림

### train 및 test 데이터 만들기
wine_train = wine[s,]
wine_test = wine[-s,]

### 신경망 모형화
wine.nn=nnet(Wine_Class~.,data=wine_train,size=3,decay=5e-4)

### 예측값
y= wine_test[,1]
t1= wine_test[,2:14]
out = predict(wine.nn,t1,type="raw")

### 오분류율 표 만들기
acc= table(y,out)
acc
### 
sum(diag(acc))/sum(acc)
