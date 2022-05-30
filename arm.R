# Association RUle Mining (연관 규칙 마이닝)

# 지지도 (support) : 두 사건 A와 B에 대하여 A와 B가 동시에 발생할 확률 P(AB)
# 신뢰도 (confidence): A가 발생했다는 조건 하에서 B가 발생할 확률, P(B|A)
# 향상도 (lift): P(B|A)/P(B) | lift > 1 : 상호보완 lift = 1 : 독립 lift < 1 : 상호대체 

# 패키지 설치
install.packages("arules")
install.packages("arulesViz")
library(arules)
library(arulesViz)

# 데이터 불러오기
rm<-read.transactions("C:/use R/a/rm.data.txt",format="basket",sep=",")
rm

# 데이터 
rules=apriori(rm,parameter = list(support=0.1,confidence=0.8))
rules
inspect(rules)
# 지지도 관련 정리
inspect(head(sort(rules,by="support"),10))

# 신뢰도 관련 정리
inspect(head(sort(rules,by="confidence"),10))

# 향상도 관련 정리
inspect(head(sort(rules,by="lift"),10))

# 데이터 plot으로 정리
plot(rules,method="scatterplot")


# 연습
wm<-read.transactions("C:/Use R/a/sd.txt",format = "basket",sep = ",")
wm
rules=apriori(wm,parameter = list(support=0.1,confidence=0.8))
rules
inspect(rules)
inspect(head(sort(rules,by="support"),10))
inspect(head(sort(rules,by="confidence"),10))
inspect(head(sort(rules,by="lift"),10))
plot(rules,method = "scatterplot")