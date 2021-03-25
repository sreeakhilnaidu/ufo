#1 
ufo_data <- read.csv("ufo.csv",na.strings=c("","NA"))

#2
ufo_data[1:15,]

n_row <- nrow(ufo_data)
n_row

#3
converted_date <- as.Date(ufo_data$date.posted, "%m/%d/%y")
converted_date
str(converted_date)

#4
ufo_data$date.posted <-converted_date
str(ufo_data)
ufo_data[1:15,]

#5
names(ufo_data)

names(ufo_data)[6] <-"DurationSeconds"
names(ufo_data)[7] <-"DurationHoursMin"
names(ufo_data)[9] <-"DatePosted"

names(ufo_data)

#6
ufo_data$latitude <- as.numeric(ufo_data$latitude) 

str(ufo_data)

#7
install.packages("mice")
library(mice)
md.pattern(ufo_data)

# List rows with missing values 
missingValues <- sum(is.na(ufo_data))
missingValues


# List rows that do not have missing vals
install.packages("VIM")
library(VIM)
missing_values <- aggr(ufo_data, prop = FALSE, numbers = TRUE)

#8
ufo_data <- ufo_data[c("datetime", "shape","city", "state", "country", "DurationSeconds" , "DurationHrsMins","comments","DatePosted","latitude","longitude" )]

ufo_data
names((ufo_data))
sorted_ufo_data <- ufo_data[c("datetime","country","shape","city")]
sorted_ufo_data
head(sorted_ufo_data,15)

#9
attach(sorted_ufo_data)
ufo_gb_disk <- subset(sorted_ufo_data, country == "gb" & shape == "disk" )
str(ufo_gb_disk)


