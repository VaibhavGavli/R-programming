
library(tidyverse)
setwd("C:\\DBDA\\R")
cars=read.csv("cars93.csv")
cars

class(cars)

tble_cars=as_tibble(cars)
class(tble_cars)
#------------------------------------

print(tble_cars,n=Inf)

str(tble_cars)

summary(tble_cars)

arrange(tble_cars,Model,Manufacturer  )

arrange(tble_cars,Manufacturer,Model)

arrange(tble_cars,Manufacturer,desc(Model)  )

arrange(tble_cars,desc(Manufacturer),Model)


#------------------------------------------
select(tble_cars,Manufacturer,Model)

select(tble_cars,Manufacturer:Price)

select(tble_cars,2:5)

str(tble_cars)

select(tble_cars,starts_with("MPG"))

select(tble_cars,ends_with("Price"))


#-----------------------------------------------


filter (tble_cars,Manufacturer=="Audi")

filter (tble_cars,Manufacturer %in% c("Audi","Volvo"))

filter (tble_cars,Manufacturer %in% c("Audi","Volvo") & Max.Price >25)

filter (tble_cars,Manufacturer %in% c("Audi","Volvo") | Max.Price >40)

select(filter (tble_cars,Manufacturer %in% c("Audi","Volvo") | Max.Price >40),Manufacturer, Max.Price)

select(filter(tble_cars,Manufacturer=="Audi"),Manufacturer:Price)


rename(tble_cars,mf=Manufacturer)

rename(tble_cars,mf=Manufacturer,md=Model,mp=Max.Price)


df<-mutate(tble_cars,PriceDiff=Max.Price-Min.Price)
select(df,Max.Price,Min.Price,PriceDiff)


#---------------------------------------------------------

filter(tble_cars,!is.na(Price))
filter (tble_cars,is.na(Luggage.room))
select(filter (tble_cars,is.na(Luggage.room)),Manufacturer,Luggage.room)

#_______________________________________________

summarise(tble_cars,avg_price=mean(Price))

summarise(tble_cars,avg_price=mean(Price,na.rm=F))

summarise(tble_cars,avg_rm=mean(Luggage.room))
summarise(tble_cars,avg_rm=mean(Luggage.room,na.rm=F))
summarise(tble_cars,avg_rm=mean(Luggage.room,na.rm=T))










#-------------------------------------------------------------
mf<- group_by(tble_cars,Manufacturer) 

summarise(mf,price=max(Price))
summarise(mf,price=min(Price))
summarise(mf,price=mean(Price))

#-------------------------------------------------------------
mf %>%
  summarise (price=mean(Price))

#arrange(tble_cars,Model,Manufacturer  )

tble_cars %>%
  arrange (Model,Manufacturer)

#select(filter (tble_cars,Manufacturer=="Audi"),Manufacturer:Price)
tble_cars %>%
  select(Manufacturer:Price)%>%
  filter(Manufacturer=="Audi")


setwd("C:\\Snehal\\Python_MasterContent\\Upgradation\\R Programming-20221017T131442Z-001\\R Programming\\Datasets")


items <- read.csv("Items.csv",stringsAsFactors = T)
orders <- read.csv("Orders.csv",stringsAsFactors = T)
ord_details <- read.csv("Ord_Details.csv",stringsAsFactors = T)
ord <- inner_join(orders,ord_details,by="Order.ID")
comb <- inner_join(items,ord,by="Item.ID")












