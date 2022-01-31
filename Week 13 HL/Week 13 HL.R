library(stringr)
library(ggplot2)

ggplot2::economics # Viewing the dataset


# Creating 4 subsets of economics containing data for the years 2007-2010

year_07 <- subset(economics,str_starts(date,"2007"))
year_08 <- subset(economics,str_starts(date,"2008"))
year_09 <- subset(economics,str_starts(date,"2009"))
year_10 <- subset(economics,str_starts(date,"2010"))


# The following code is needed for the second graph when plotting the month
# of the date along the x axis

month_07 <- c()
month_08 <- c()
month_09 <- c()
month_10 <- c()

for(i in 1:nrow(year_07)){
  month_07 <- c(month_07,as.double(substr(year_07$date[i],6,7)))
  month_08 <- c(month_08,as.double(substr(year_08$date[i],6,7)))
  month_09 <- c(month_09,as.double(substr(year_09$date[i],6,7)))
  month_10 <- c(month_10,as.double(substr(year_10$date[i],6,7)))
}

year_07 <- cbind(year_07,month_07)
year_08 <- cbind(year_08,month_08)
year_09 <- cbind(year_09,month_09)
year_10 <- cbind(year_10,month_10)


# Setting the corresponding colours for each year from 2007-2010

colours <- c("2007"="red","2008"="blue","2009"="darkorange","2010"="chartreuse2")


# The first graph

ggplot(economics,aes(x=date,y=uempmed))+
  geom_line(colour="red",size=0.5)+
  labs(x="Year",y="Median duration of unemployment (weeks)",
       title="A graph showing how median duration of unemployment varies over time")




plot<- ggplot(colour=year_07)+
  geom_line(data=year_07,aes(x=month_07,y=uempmed,colour="2007"))+
  geom_line(data=year_08,aes(x=month_08,y=uempmed,colour="2008"))+
  geom_line(data=year_09,aes(x=month_09,y=uempmed,colour="2009"))+
  geom_line(data=year_10,aes(x=month_10,y=uempmed,colour="2010"))+
  labs(x="Month",y="Median duration of unemployment (weeks)",
       title="A graph showing how median duration of unemployment varies over months for each year
       from 2007-2010",colour="Year",caption="This graph highlights the effect of the financial crisis
       of 2008-2009 on the median duration of unemployment")+
  scale_colour_manual(values=colours)+
  scale_x_continuous(breaks=seq(1,12,by=1))+
  scale_y_continuous(breaks=seq(5,25,by=2.5))+
  theme_classic()


# The second graph

plot + theme(plot.title=element_text(hjust=0.5),
             plot.caption=element_text(hjust=0.5))
