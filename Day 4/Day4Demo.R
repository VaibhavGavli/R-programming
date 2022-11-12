library(tidyverse)
table4a

gather(table4a,"1999","2000",key="Year",value="Cases")

?gather(table4a,"1999","2000",key="Year",value="Cases",convert = T)

gather(table4a,"1999","2000",key="Year",value="Cases",convert = T,factor_key=F)

#------------------------------------------------------------
table2
spread(table2,key="type",value = "count")

table2 %>%
  spread(key="type",value = "count")

#-------------------------------------------------------------


Salaries <- read.csv("Salaries.csv",stringsAsFactors = T)
data("mtcars")
survey <- read.csv("survey.csv",stringsAsFactors = T)

## scatter plots
ggplot(data = mtcars, aes(x=wt, y=mpg)) + 
  geom_point() + 
  labs(x="Weight",y="MPG",title = "Scatter Plot")

ggplot(data = Salaries, aes(x=yrs.service,y=salary)) +
  geom_point() +
  labs(x="Years in Service",y="Salary",title = "Scatter Plot")

ggplot(data = Salaries, aes(x=yrs.service,y=salary,color=rank)) +
  geom_point() +
  labs(x="Years in Service",y="Salary",title = "Scatter Plot")

ggplot(data = Salaries, aes(x=yrs.service,y=salary,shape=rank)) +
  geom_point() +
  labs(x="Years in Service",y="Salary",title = "Scatter Plot")


ggplot(data = Salaries, aes(x=yrs.service,
                            y=salary,shape=rank,
                            color=sex)) +
  geom_point() +
  labs(x="Years in Service",y="Salary",title = "Scatter Plot")

######### Regression line
ggplot(data = Salaries, aes(x=yrs.service,y=salary)) +
  geom_point() + geom_smooth(method = "lm") +
  labs(x="Years in Service",y="Salary",title = "Scatter Plot")

######## Boxplot
ggplot(data = survey, aes(y=Age)) + geom_boxplot()
ggplot(data = survey, aes(x=Sex,y=Age)) + geom_boxplot()

# salary
ggplot(data = Salaries, aes(y=salary)) + geom_boxplot()
# salary and rank
ggplot(data = Salaries, aes(x=rank,y=salary)) + geom_boxplot()
ggplot(data = Salaries, aes(x=rank,y=salary,color=rank)) + geom_boxplot()
ggplot(data = Salaries, aes(x=rank,y=salary,fill=rank)) + geom_boxplot()


############## Histogram
ggplot(data = Salaries, aes(x=salary)) + 
  geom_histogram(bins = 20,fill='pink',color='red')

ggplot(data = Salaries, aes(x=salary)) + 
  geom_histogram(binwidth = 25000,fill='pink',color='red')

############# Bar Plot
barplot(table(Salaries$rank))
ggplot(data = Salaries, aes(x=rank)) + geom_bar(fill="blue")

barplot(table(Salaries$discipline,Salaries$rank))
barplot(table(Salaries$discipline,Salaries$rank),beside = T)

ggplot(data = Salaries, aes(x=rank,fill=discipline)) + geom_bar()
ggplot(data = Salaries, aes(x=rank,fill=discipline)) + 
  geom_bar(position = 'dodge')

meanSals <- Salaries %>% 
  group_by(rank) %>% 
  summarise(avg_sals = mean(salary))
ggplot(data = meanSals, aes(x=rank,y=avg_sals,fill=rank)) +
  geom_bar(stat='identity')

############ Facet Grid
ggplot(data = Salaries, aes(x=yrs.service,y=salary)) +
  geom_point() + facet_grid(rank ~ .)
ggplot(data = Salaries, aes(x=yrs.service,y=salary)) +
  geom_point() + facet_grid(. ~ rank)

ggplot(data = Salaries,aes(x=salary,fill=rank, alpha=0.3)) + 
  geom_density()

ggplot(data = Salaries,aes(x=salary,fill=rank)) + 
  geom_density()+
  facet_grid(rank ~ .)


