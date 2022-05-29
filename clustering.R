### 데이터 불러오기
trip<-read.csv("C:/use R/a/tripadvisor_review.csv")

### 데이터 구조
str(trip)
head(trip)
summary(trip)
trip.1<-trip[,-1]
names(trip.1)<-c("미술관","클럽","바","레스토랑","박물관","리조트","공원","해변","극장","종교기관")
head(trip.1)

### 변수 관계
pairs(trip.1)
cor(trip.1)

### 관측치 간 거리
dist_trip<-dist(trip.1,method="euclidean")
dist_trip

### 2차원 좌표
two_trip<- cmdscale(dist_trip)
two_trip
plot(two_trip)

### 계층적 군집화
hc<-hclust(dist_trip,method="average")
plot(hc,xlab="where",ylab="distance")

### K-means 군집화
km<-kmeans(trip.1,centers=10)
km
km$cluster
plot(trip.1,col=km$cluster)

### 최적 군집 개수 결정
km$withinss
wss<-0
for(i in 1:10){
  wss[i]<-sum(kmeans(trip.1,centers=i)$withinss)
}
wss
plot(wss,type="b",xlab="Number of Clusters",ylab="Within-cluster sum of suqares")