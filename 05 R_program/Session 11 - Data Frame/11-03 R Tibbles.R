## Tittbles 
  #  are used to create table in R

# install.packages("tidyverse") # you have to install this package first
install.packages("tidyverse")

library(tidyverse)

# vignette("tibble")
vignette("tibble")

# A vignette in R is a long-form documentation that provides 
# a detailed introduction, explanation, and examples of how to use 
# a specific package or a feature within that package

# reading_df from the previous session 11 ;11 - 01 Data Frame Intro & Creation
names <- c("Mary", "Anna", "Emma", "Elizabeth", "Minnie", "Evelynn", "Lia",
           "Gracelyn", "Laura", "Lexi") 
pages_read <- c(158, 56, 186, 123, 72, 102, 184, 200, 83, 118)

book <- c("Harry Potter and the Sorcerer's Stone", "Anne of Green Gables", 
          "The Babysitters Club", "Matilda", "A Wrinkle in Time", 
          "Alice in Wonderland", "Where the Red Fern Grows", "Number the Stars",
          "To Kill a Mockingbird", "The Book Thief")
reading_df <- data.frame("Names"= names, "pages_read "= pages_read , 
                         'book'=book, stringsAsFactors = FALSE ) 
reading_df

# make the data Frame "Reading_df into a table using tibble
reading_tibble <- tibble("Names"= names, "pages read "= pages_read , 
                         'book'=book)
        # no stringsAsFactors = FALSE  because Tibble do not create factors
reading_tibble
reading_df # notice the difference  between reading_df and reading_tibble

# reading_tibble 
  # doesn't adjust the column names
  # doesn't use row.names()
  # only recycles vectors of length 1

# dataframe 
# import data as data frame and late create table using as_tibble
presidents_data <- read.csv("presidents_data.csv")
head(presidents_data)

# faster than as.data.frame()
as_tibble(presidents_data) # transforming a data frame into table

# just import it as a tibble (readr package - 10x faster!)
# importing data as table
presidents_data <- read_csv("presidents_data.csv") 
presidents_data


#### 3 differences ####

## Printing
# shows only first 10 rows and columns on one screen
mtcars
tib_mtcars <- as_tibble(mtcars)
options(tibble.print_max = 15, tibble.print_min = 15)
tib_mtcars

# printing all rows
options(tibble.print_max = Inf)
tib_mtcars

options(tibble.print_max = 10, tibble.print_min = 10)

# subsetting always returns another tibble
class(reading_df[ ,1:2]) # here it returns only a data frame
class(reading_df[ , 1])

class(reading_tibble[, 1:2])
class(reading_tibble[ , 1])

# Recycling 
# only values of length 1 are recycled
tibble( a=1, b=1:3)

# for tibble, error because they do not have the same dimension 
tibble(a=1:2, b=1:4) 

# but for data frame, no error because one is multiple of the other  
data.frame(a=1:2, b=1:4)

# however the following will throw an error even if it is a data frame 
data.frame(a=1:3, b=1:4) # they are not multiple of each other









