library(ggplot2)

AirBnb_df <- read.csv("airbnb_clean.csv")
AirBnb_df

mean(AirBnb_df$price)
length(AirBnb_df)
str(AirBnb_df)


# Set seed  
set.seed(15)

# Subset to Brooklyn
AirBnb_df$index <- 1:length(AirBnb_df$X)
Brooklyn <- AirBnb_df[AirBnb_df$neighbourhood_group_cleansed == "Brooklyn",]
# Generate random index
random_int <- sample(1:length(Brooklyn$neighbourhood_group_cleansed), 1)
# Isolate the room type
Brooklyn[random_int,]$room_type
# Isolate people it accomodates
Brooklyn[random_int,]$accommodates
# Isolate bathrooms
Brooklyn[random_int,]$bathrooms
# Isolate price
Brooklyn[random_int,]$price
Brooklyn[random_int,]$index

# Same process for Manhattan
Manhattan <- AirBnb_df[AirBnb_df$neighbourhood_group_cleansed == "Manhattan",]
random_int <- sample(1:length(Manhattan$neighbourhood_group_cleansed), 1)
Manhattan[random_int,]$room_type
Manhattan[random_int,]$accommodates
Manhattan[random_int,]$bathrooms
Manhattan[random_int,]$price

# Same process for Bronx
Bronx <- AirBnb_df[AirBnb_df$neighbourhood_group_cleansed == "Bronx",]
random_int <- sample(1:length(Bronx$neighbourhood_group_cleansed), 1)
Bronx[random_int,]$room_type
Bronx[random_int,]$accommodates
Bronx[random_int,]$bathrooms
Bronx[random_int,]$price

# Same process for Queens
Queens <- AirBnb_df[AirBnb_df$neighbourhood_group_cleansed == "Queens",]
random_int <- sample(1:length(Queens$neighbourhood_group_cleansed), 1)
Queens[random_int,]$room_type
Queens[random_int,]$accommodates
Queens[random_int,]$bathrooms
Queens[random_int,]$price
Queens[random_int,]$name

# Same process for Staten Island
Staten_Island <- AirBnb_df[AirBnb_df$neighbourhood_group_cleansed == "Staten Island",]
random_int <- sample(1:length(Staten_Island$neighbourhood_group_cleansed), 1)
Staten_Island[random_int,]$room_type
Staten_Island[random_int,]$accommodates
Staten_Island[random_int,]$bathrooms
Staten_Island[random_int,]$price

# Set seed
set.seed(70)

# Subset to Brooklyn
AirBnb_df$index <- 1:length(AirBnb_df$X)
Brooklyn <- AirBnb_df[AirBnb_df$neighbourhood_group_cleansed == "Brooklyn",]
# Generate random index
random_int <- sample(1:length(Brooklyn$neighbourhood_group_cleansed), 1)
# Isolate the room type
Brooklyn[random_int,]$room_type
# Isolate people it accomodates
Brooklyn[random_int,]$accommodates
# Isolate bathrooms
Brooklyn[random_int,]$bathrooms
# Isolate price
Brooklyn[random_int,]$price
Brooklyn[random_int,]$index

# Same process for Manhattan
Manhattan <- AirBnb_df[AirBnb_df$neighbourhood_group_cleansed == "Manhattan",]
random_int <- sample(1:length(Manhattan$neighbourhood_group_cleansed), 1)
Manhattan[random_int,]$room_type
Manhattan[random_int,]$accommodates
Manhattan[random_int,]$bathrooms
Manhattan[random_int,]$price

# Same process for Bronx
Bronx <- AirBnb_df[AirBnb_df$neighbourhood_group_cleansed == "Bronx",]
random_int <- sample(1:length(Bronx$neighbourhood_group_cleansed), 1)
Bronx[random_int,]$room_type
Bronx[random_int,]$accommodates
Bronx[random_int,]$bathrooms
Bronx[random_int,]$price

# Same process for Queens
Queens <- AirBnb_df[AirBnb_df$neighbourhood_group_cleansed == "Queens",]
random_int <- sample(1:length(Queens$neighbourhood_group_cleansed), 1)
Queens[random_int,]$room_type
Queens[random_int,]$accommodates
Queens[random_int,]$bathrooms
Queens[random_int,]$price
Queens[random_int,]$name

# Same process for Staten Island
Staten_Island <- AirBnb_df[AirBnb_df$neighbourhood_group_cleansed == 
                             "Staten Island",]
random_int <- sample(1:length(Staten_Island$neighbourhood_group_cleansed), 1)
Staten_Island[random_int,]$room_type
Staten_Island[random_int,]$accommodates
Staten_Island[random_int,]$bathrooms
Staten_Island[random_int,]$price
