library(ggplot2)
library(GGally)
library(MASS)


###exploratory data analysis


###Remove insignificant variables from the data frame
data<-airbnb_clean.2
data$experiences_offered <- NULL
data$host_name <- NULL
data$name <- NULL
data$host_total_listings_count <- NULL
data$neighbourhood_cleansed <- NULL
data$property_type <- NULL



#correlation matrix plot
ggcorr(data, name="Color \nScale", cex=2) +
  ggtitle("Correlation Color Matrix \n of Numeric Variables") +
  theme(plot.title=element_text(hjust=0.5))

#correlation values for predictors
cor(data[,unlist(lapply(data, is.numeric))])


#scatterplots with Least Squares Regression line (using shape or color) for numeric variables

ggplot(data, aes(x= accommodates, y=price)) +
  geom_point() + 
  stat_smooth(method="lm", formula= y ~ x, size=2)+
  ggtitle("Plot of Price vs. Accommodates \n(Price = 45.11 +33.61*Accommodates)")
theme(plot.title = element_text(hjust = 0.5))
sc1<-lm(price~accommodates, data=data)
summary(sc1)

ggplot(data, aes(x= bathrooms, y=price)) +
  geom_point() + 
  stat_smooth(method="lm", formula= y ~ x, size=2) +
  ggtitle("Plot of Price vs. Bathrooms \n(Price = 57.44 + 73.24*Bathrooms)")
theme(plot.title = element_text(hjust = 0.5))
sc2<-lm(price~bathrooms, data=data)
summary(sc2)

ggplot(data, aes(x= bedrooms, y=price)) +
  geom_point() + 
  stat_smooth(method="lm", formula= y ~ x, size=2) +
  ggtitle("Plot of Price vs. Bedrooms \n(Price = 68.96 + 61.27*Bedrooms)")
theme(plot.title = element_text(hjust = 0.5))
sc3<-lm(price~bedrooms, data=data)
summary(sc3)

ggplot(data, aes(x= beds, y=price)) +
  geom_point() + 
  stat_smooth(method="lm", formula= y ~ x, size=2) +
  ggtitle("Plot of Price vs. Beds \n(Price = 66.19 + 47.58*Beds)")
theme(plot.title = element_text(hjust = 0.5))
sc4<-lm(price~beds, data=data)
summary(sc4)

ggplot(data, aes(x=extra_people, y=price)) +
  geom_point() +
  stat_smooth(method="lm", formula= y~x, size=2) +
  ggtitle("Plot of Price vs. Extra People \n(Price = 45.11 +33.61*Extra People)")
theme(plot.title = element_text(hjust = 0.5))
sc5<-lm(price~extra_people, data=data)
summary(sc5)

#barGraphs (using color) for categorical variables

barGraph = ggplot(data, aes(x= host_identity_verified, y= price, fill=host_identity_verified))
barGraph +
  stat_summary(fun.y="mean", geom="bar") + 
  ggtitle("Relationship between Price and \ndifferent levels of Host Identity Verified")
theme(plot.title = element_text(hjust = 0.5))

barGraph3 = ggplot(data, aes(x= neighbourhood_group_cleansed, y= price, fill=neighbourhood_group_cleansed))
barGraph3 +
  stat_summary(fun.y="mean", geom="bar") +
  ggtitle("Relationship between Price and different \nlevels of Neighbourhood Group Cleansed") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


barGraph4 = ggplot(data, aes(x= room_type, y= price, fill=room_type))
barGraph4 +
  stat_summary(fun.y="mean", geom="bar") +
  ggtitle("Relationship between Price and \ndifferent levels of Room Type") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

barGraph6 = ggplot(data, aes(x= bed_type, y= price, fill=bed_type))
barGraph6 +
  stat_summary(fun.y="mean", geom="bar") +
  ggtitle("Relationship between Price and \ndifferent levels of Bed Type") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

