#### New York City Uber Pickups ####
# from April to September 2014

# Step 1: 
# find the data! 
# Dataset can be downloaded via the link below New York City Uber Pickups 
  # from April to September 2014 -these are separate file for each month
  # and janjune_2015 = this is a unique file

# uber pickups
# https://www.kaggle.com/fivethirtyeight/uber-pickups-in-new-york-city

# loading some library to Use
library(tidyverse)
library(dplyr)
install.packages("visdat")
library(visdat) #  visualize missing data 
library(lubridate) # for date 
install.packages("tictoc")  # time series Groups
library(tictoc) # help to determine how long a code run
install.packages("plotrix") # time series Groups
library(plotrix) 
install.packages("ggthemes") # for data visualization
library(ggthemes) 

# step 1. Load in your data
library(tidyverse)

apr_2014 <- read_csv("NY_City_Uber_Pickups_2014/uber-raw-data-apr14.csv")
may_2014 <- read_csv("NY_City_Uber_Pickups_2014/uber-raw-data-may14.csv")
jun_2014 <- read_csv("NY_City_Uber_Pickups_2014/uber-raw-data-jun14.csv")
july_2014 <-read_csv("NY_City_Uber_Pickups_2014/uber-raw-data-jul14.csv")
aug_2014 <- read_csv("NY_City_Uber_Pickups_2014/uber-raw-data-aug14.csv")
sep_2014 <- read_csv("NY_City_Uber_Pickups_2014/uber-raw-data-sep14.csv")
janjune_2015 <- read_csv("NY_City_Uber_Pickups_2014/uber-raw-data-janjune-15.csv")


# Step 2: some of the business questions could be asked in regard of this dataset

# 1. Is there a significant difference between the number of pickups between any of
# the days of the week?

# 2. Is there a significant difference between any hour of the day? 

# 3. Does the weather (rain/sun) effect the number of pickups? 

# 4. Are there areas with significantly higher numbers of pickups during the day? 

# 5. Are certain areas more popular for pickups at different times of the day/week/month?

# 6. Are there any cycles in the data? 


# Step 3: Comprehending the Dataset 

# join each of the datasets into a single dataset except janJun2015
rides <- apr_2014 %>% full_join(may_2014) %>% full_join(jun_2014) %>% 
  full_join(july_2014) %>% full_join(aug_2014) %>% full_join(sep_2014) 

write_csv(rides, "NY_ride_2014_data.csv")

# looking at the beginning of the dataset
head(rides)

# looking at the bottom of the dataset
tail(rides)

# random sample in between # looking in the middle of the sample randomly 
rides %>% sample_n(15)

#explicitly look at the structure
str(rides)

# summary 
summary(rides)

unique(may_2014$Base)

# outliers
## Boxplot

#### Missing values??? ####
sum(is.na(rides))

# vis_miss(rides) if any 

# correlation of missing values between variables if any 

# correlation heatmap between variables
# https:/r-charts.com/correlation

# Step 4: Tidying Data 
# let's first rename our Latitude and Longitude columns
rides <- rides %>% rename(Latitude = Lat, Longitude = Lon)

# fix "Date/Time" to make it an actual datetime # changing it into date type
library(lubridate)

rides <- rides %>% mutate(datetime = str_replace_all(`Date/Time`, "//*", "-")) %>%
  mutate(datetime = mdy_hms(datetime)) %>% select(-`Date/Time`)
rides 

# let' look at JanJun 2015 dataset before joining it with rides
janjune_2015

# Join rides and janjune_2015 dataset 

rides <- rides %>% full_join(janjune_2015, 
                             by = c("Base"= "Affiliated_base_num",
                                    "datetime" = "Pickup_date")) %>%
                             select(datetime, base = Base)

write_csv(rides, "ride_data.csv")
rides <- read_csv("ride_data.csv")


# step 5 : Grouping time_series Data

#### Time Series Groups ####

install.packages("tictoc")
library(tictoc)

install.packages("plotrix")
library(plotrix)

# tic("base R") # help to know how long a code run
# rides <- read.csv("ride_data.csv")
# toc()
# base: 122.24 sec elapsed

tic("readr")
rides <- read_csv("ride_data.csv")
toc()

# how many trips by the number of hours in a day
rides

hourly <- rides %>% group_by(hour = hour(datetime)) %>%
  summarize(Total = n())
head(hourly, 25)


# trips by hour and month

monthly_hourly <- rides %>% 
  group_by(month = month(datetime), hour = hour(datetime)) %>% 
  summarize(Total = n())


# trips by each day of the month

day_trips <- rides %>% group_by(day = day(datetime)) %>%
              summarize(Total = n())

# trips by day and month

day_month <- rides %>% 
            group_by(month = month(datetime), day = day(datetime)) %>%
            summarize(Total = n())

# trips just by month

month_groups <- rides %>% 
                group_by(month = month(datetime)) %>% 
                summarize(Total = n())

# trips just by weekday of the month

month_weekday <- rides %>%
                group_by(month = month(datetime), dayofweek = weekdays(datetime)) %>%
                summarize(Total = n())

# trips just by hours
per_hour_totals <- rides %>% group_by(year = year(datetime),
                                      month = month(datetime), 
                                      day = day(datetime),
                                      hour = hour(datetime)) %>%
                  summarize(Total = n())
# trips just by day
per_day_totals <- rides %>% group_by(year = year(datetime),
                                     month = month(datetime), 
                                     day = day(datetime),
                                     dayofweek = weekdays(datetime)) %>%
                    summarize(Total = n())

average_hourofday <- per_hour_totals %>% group_by(hour) %>%
        summarize(average_num_rides = mean(Total))

average_dayofweek <- per_day_totals %>% group_by(dayofweek) %>%
  summarize(average_num_rides = mean(Total))


# Step 6:  Data Visualization 
install.packages("ggthemes") # for data visualization
library(ggthemes) 
library(ggplot2)
# remember we are still using the same dataset "rides"

# Trips per hour of the day
ggplot(hourly, aes(factor(hour), Total)) + 
  geom_bar( stat = "identity", fill = "blue")+
  theme(legend.position = "none") + xlab("Hour") + 
  ggtitle("Total Trips per Hour")


# Average trips per hour during the day 
ggplot(average_hourofday, aes(x = factor(hour), y = average_num_rides)) +
  geom_bar(stat = "identity") + geom_errorbar(aes(ymin = average_num_rides, 
                                                  ymax = average_num_rides)) + 
  ggtitle("Average Number of Trips Per Hour") + ylab("Average Number of Trips") +
  xlab("Hour")

# Trips per hour of the day separated into months
ggplot(monthly_hourly, aes(x = factor(hour), y = Total, fill = 
                             factor(month, labels = head(month.abb, -3)))) + 
  geom_bar( stat = "identity") + xlab("Hour") + 
  guides(fill = guide_legend("Month")) +
  ggtitle("Trips by Hour and Month")

# Trips For Each day of the month
ggplot(day_trips, aes(day, Total)) + 
  geom_bar( stat = "identity") +
  ggtitle("Trips Every Day")

# Trips by Day and Month
ggplot(day_month, aes(day, Total, fill = 
                        factor(month, labels = head(month.abb, -3)))) + 
  geom_bar(stat = "identity") +
  ggtitle("Trips by Day and Month") +
  guides(fill = guide_legend("Month")) +
  scale_fill_calc()

# Trips by month
ggplot(month_groups, aes(factor(month, labels = head(month.abb, -3)), Total, fill = 
                           factor(month, labels = head(month.abb, -3)))) + 
  geom_bar( stat = "identity") + xlab("Month") +
  ggtitle("Trips by Month") +
  guides(fill = guide_legend("Month")) +
  theme(legend.position = "none") +
  scale_fill_calc()

# Trips by Day and Month
ggplot(month_weekday, aes(factor(month, labels = head(month.abb, -3)), 
                          Total, fill = factor(dayofweek))) + 
  geom_bar( stat = "identity", position = "dodge") +
  ggtitle("Trips by Day and Month") + xlab("Month") +
  guides(fill = guide_legend("Weekday")) +
  scale_fill_calc()

days_week <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", 
               "Saturday")
# Average trips during the week
ggplot(average_dayofweek, aes(x = factor(dayofweek, levels = days_week), y = average_num_rides)) +
  geom_bar(stat = "identity") + geom_errorbar(aes(ymin = average_num_rides, 
                                                  ymax = average_num_rides)) + 
  ggtitle("Average Number of Trips Per Weekday") + ylab("Average Number of Trips") +
  xlab("Weekday")

### Really cool example I found online at:
# https://data-flair.training/blogs/r-data-science-project-uber-data-analysis/

data_NY_ride_2014_data <- read_csv("NY_ride_2014_data.csv")
head(data_NY_ride_2014_data)
library(ggthemes)
min_lat <- 40.5774
max_lat <- 40.9176
min_long <- -74.15
max_long <- -73.7004
ggplot(data_NY_ride_2014_data, aes(x=Lon, y=Lat)) +
  geom_point(size=1, color = "blue") +
  scale_x_continuous(limits=c(min_long, max_long)) +
  scale_y_continuous(limits=c(min_lat, max_lat)) +
  theme_map() +
  ggtitle("NYC MAP BASED ON UBER RIDES DURING 2014 (APR-SEP)")

ggplot(data_2014, aes(x=Lon, y=Lat, color = Base)) +
  geom_point(size=1) +
  scale_x_continuous(limits=c(min_long, max_long)) +
  scale_y_continuous(limits=c(min_lat, max_lat)) +
  theme_map() +
  ggtitle("NYC MAP BASED ON UBER RIDES DURING 2014 (APR-SEP) by BASE")


# Step 7: Statistical Analysis 
# using some of the business question in step 2

rides <- read_csv("ride_data.csv")

# 1. Is there a significant difference between the number of pickups 
# between any of  the days of the week?

# ANOVA
weekday_anova <- aov(Total ~ factor(dayofweek), data=per_day_totals)
summary(weekday_anova)

# slightly significant difference!
# But the question is now, where is that difference

tukey_week <- TukeyHSD(weekday_anova)
tukey_df <- as.data.frame(tukey_week$dayofweek)  
tukey_df[tukey_df$p.adj < 0.05]


# 2. Is there a significant difference between any hour of the day? 
hourly_anova <- aov(Total ~ factor(hour), data=per_hour_totals)
summary(hourly_anova)

# Highly Significant difference - but where?

tukey_hour <- TukeyHSD(hourly_anova)
tukey_df_hour <- data.frame(tukey_hour$`factor(hour)`)
names <- rownames(tukey_df_hour)[tukey_df_hour$p.adj < 0.05]
p_values <- tukey_df_hour$p.adj[tukey_df_hour$p.adj < 0.05]
significant <- tibble(names, p_values)
significant
