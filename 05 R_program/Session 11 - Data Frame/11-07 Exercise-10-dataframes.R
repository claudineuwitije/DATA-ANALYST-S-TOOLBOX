#### Exercise 10 - DataFrames ####
library(tidyverse)

# 1. Create a dataframe from 3 vectors.
v1 <- c(1:5)
v2 <- c("a","b","c","d","e")
v3 <- c(20:24)

# storing our vector into a data frame 
v_df <- data.frame(v1,v2,v3)

# 2. Create a tibble from those 3 vectors by any method. (bonus if you can do all 4
#     methods!)
v_tibble1 <- tibble(v_df)
v_tibble2 <- tibble(v1, v2, v3)
v_tibble3 <- tribble(
  ~v1, ~v2, ~v3,
  1,   "a",  20,
  2,   "b",  21,
  3,   "c",  22,
  4,   "d",  23,
  5,   "e",  24
)

write.csv(v_tibble1, "example2.csv")
v_tibble4 <- read_csv ("example2.csv")


# 3. Convert the following untidy data to be in tidy format. 
air_data <- read_csv("AirPassengers_example.csv")
air_data

air_data_tidy <- air_data %>% pivot_longer(c("Jan":"Dec"), 
                        names_to = "Month", values_to = "numPassengers" )


# 4. Using your tidy dataset from question 3, filter out the data to only include
#     when the number of passengers was between 150 and 250, then rename the 
#     the passengers column to "Number of Passengers"

# passenger between 150 and 250
air_data_tidy_filtered <- air_data_tidy %>% filter(numPassengers >= 150 & 
                                                     numPassengers <= 250)
min(air_data_tidy_filtered$numPassengers)
max(air_data_tidy_filtered$numPassengers)


# 5. Using the tidy dataset from question 3, sort the number of passengers in 
#       descending order (greatest to least)
air_data_tidy_dsc <- air_data_tidy %>% arrange(desc(numPassengers))

# 6. From the mtcars dataset, select only mpg and horsepower (hp).
mtcars_tib <- as_tibble(mtcars)
mtcars_tib_sel <- mtcars_tib %>% select(mpg, hp)

# 7. From the presidents dataset, find the average Quarterly approval rating of 
#     the presidents each year. 
presidents_data <- read_csv("presidents_data.csv")
presidents_data_avr <- presidents_data %>% rowwise() %>% 
                      mutate(average_score = mean (c(Qtr1,Qtr2,Qtr4,Qtr4), na.rm=TRUE ))

# 8. From the ToothGrowth dataset, find the average length for each supplement
ToothGrowth_tib <- as_tibble (ToothGrowth)
ToothGrowth_avr <- ToothGrowth_tib %>% group_by(supp) %>% summarize(average_len= mean(len))

