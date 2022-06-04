### 패키지 설치
library(tree)

### 데이터 불러오기
slog=read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/statlog/australian/australian.dat", header=F, sep=" ")

### 데이터 구조
str(slog)
slog[,15]=as.factor(slog[,15]) 
### train test 데이터
slog.s=sample(length(slog[,1]),as.integer(length(slog[,1])*0.7))
slog.train=slog[slog.s,]
slog.test=slog[-slog.s,-15]
slog.test.y=slog[-slog.s,15]

### 컴퓨터 계산 시간
ptm=proc.time() 
slog.tr=tree(V15~., slog.train)
proc.time() - ptm

### 예측하기
pred.y=predict(slog.tr,slog.test)
for(i in 1:length(pred.y[,1])){
  if(pred.y[i,1]<=pred.y[i,2])pred.y[i,1]="1"
  else pred.y[i,1]="0"
}

### 오분류율 표
slog.t=table(slog.test.y,pred.y[,1])
slog.t
sum(diag(slog.t))/sum(slog.t)
