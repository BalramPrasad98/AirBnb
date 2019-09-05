library(lubridate)

final_project_data <- read.csv(file = "listings.csv", header = TRUE)

View(final_project_data)

head(final_project_data,10)
summary(final_project_data)

airbnb <- final_project_data[,c("name", "experiences_offered", "host_name", "host_since", "host_total_listings_count", "host_identity_verified", "neighbourhood_cleansed", "neighbourhood_group_cleansed", "room_type", "property_type", "accommodates", "bathrooms", "bedrooms", "beds", "bed_type", "price", "extra_people") ]
  
levels(final_project_data$bed_type)

head(airbnb,10)
str(airbnb)

airbnb$price <- as.character(airbnb$price)
is.character(airbnb$price)
airbnb$price <- strsplit(airbnb$price,"$")
airbnb$price

airbnb$price <- as.numeric (gsub( "\\$", "", airbnb$price))
airbnb$extra_people <- as.numeric (gsub( "\\$", "", airbnb$extra_people))
airbnb$bathrooms <- as.numeric(airbnb$bathrooms)

airbnb$bathrooms[is.na(airbnb$bathrooms)] <- 0
airbnb$bedrooms[is.na(airbnb$bedrooms)] <- 0
airbnb$beds[is.na(airbnb$beds)] <- 0
airbnb

airbnb$days_since <- NULL
airbnb$host_since <- as.Date(airbnb$host_since)
is.Date(airbnb$host_since)
for (i in 1:length(airbnb$host_since)){
  airbnb$days_since[i] <- unclass(Sys.Date() - airbnb$host_since[i])[1]
}
airbnb_clean <- airbnb

summary(airbnb$price)
na.omit(airbnb_clean)
View(airbnb_clean)
summary(airbnb_clean$price)

index <- NULL
for(i in 1:length(airbnb$price)){
  if (is.na(airbnb$price[i])){
    index <- c(index, i)
  }
}
airbnb_clean <- airbnb_clean[-index,]

index_date <- NULL
for(i in 1:length(airbnb_clean$host_since)){
  if (is.na(airbnb_clean$host_since[i])){
    index_date <- c(index_date, i)
  }
}
airbnb_clean <- airbnb_clean[-index_date,]

summary(airbnb_clean$price)
airbnb_clean$price_range <- NULL
for (i in 1:length(airbnb_clean$price)){
  if (airbnb_clean$price[i] < 69.0) {
    airbnb_clean$price_range[i] <- "$0 - $69"
  } else if((airbnb_clean$price[i] >= 69.0) & (airbnb_clean$price[i] < 106.0)){
    airbnb_clean$price_range[i] <- "$69 - $106"
  } else if (airbnb_clean$price[i] >= 106.0 & airbnb_clean$price[i] < 175.0){
    airbnb_clean$price_range[i] <- "$106 - $175.0"
  } 
  else {
    airbnb_clean$price_range[i] <- "$175.0+"
  }
}
length(airbnb_clean$price)/4
airbnb_clean$price_range <- as.factor(airbnb_clean$price_range)
summary(airbnb_clean)
airbnb_clean <- airbnb_clean[,-19]
airbnb_clean[,19] <- "price_range"
airbnb_clean$price_range <- airbnb_clean$price_range2
airbnb_clean <- airbnb_clean[,-19]
    
write.csv(airbnb_clean, file = "airbnb_clean.csv", sep = ",")

View(airbnb_clean)

summary(airbnb_clean$accommodates)


table(airbnb_clean$accommodates)
sum(airbnb_clean$accommodates == 12)
sum(airbnb_clean$accommodates == 11)
sum(airbnb_clean$accommodates == 10)
sum(airbnb_clean$accommodates == 9)
sum(airbnb_clean$accommodates == 8)
sum(airbnb_clean$accommodates == 7)
sum(airbnb_clean$accommodates == 6)





