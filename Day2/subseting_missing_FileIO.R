v<-10:30
v
v[4]
v[-4]
v[4:6]
v[c(3,6,9)]
v[-c(3,6,9)]

v[v==20]
v[v<15]
v[v>15 & v<25]

v[v==15 | v>25]


#--------------------------------
ls<-list(1,2,3,c(12,34,56,78,90),"Kishor",34)
ls[4]
ls[-4]
ls[[4]][3]

ls[c(1,3)]
ls[-c(1,3)]
#-----------------------------------------
m=matrix(11:25,5,3)
m
m[4,2]
m[4,]
m[,3]
m[,3,drop=F]
m[3]
m[1:2,2:3]
m[4,c(1,3)]
m[4,c(3,1)]
m[4,-c(3,1)]
#----------------------------------------
a <-array(30:1,dim=c(3,5,2))
a
a[1,1,1]
a[2,4,1]
a[2,4,2]
a[2,-4,2]
a[c(1,3),c(4),]
#-----------------------------
chickwts              

df<-chickwts
df
df['weight']
df$weight


df$weight[df$weight >200]

df[1:34,1:2]
df[1,2]
df[4,2]
df[4,]
df[,2]
df[,2,drop=F]
df[2]
df[1:2,1:2]
df[4,c(1,2)]
df[4,c(2,1)]
df[4,-c(2,1)]


df$weight[df$weight >200 & df$weight <250 ]

df$weight[df$weight >200 | df$feed =="horsebean" ]


df$weight[which(df$weight >200)]

dfn <-subset(df,df$weight >200)
dfn


dfn <-subset(df,df$weight >200,select = c("feed"))
dfn

#---------------------------------------------------
 v<-c(NA,2,3,4,NA,5,6,8)
is.na(v)


v<-c(NA,2,3,0/0,4,NA,5,6,8,0/0)
is.nan(v)

v<-c(NA,2,3,0/0,4,NA,5,Inf,8,0/0,-Inf,23/0)
is.finite(v)
is.infinite(v)
 

#------------------------------------
setwd("C:\\DBDA\\Python\\R programming\\DS")
df<-read.csv("cars2.csv")
df

df1<-subset(df,df$speed>15)
df1


write.csv(df1,"newcars.csv")

write.csv2(df1,"newcars2.csv")

write.table(df1,"newcars2.txt")

df2<-read.table("test.txt",sep=" ",header = T,skip=1)
df2
#--------------------------------------------------