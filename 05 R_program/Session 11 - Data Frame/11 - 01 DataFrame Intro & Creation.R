#### DataFrames Creation ####

names <- c("Mary", "Anna", "Emma", "Elizabeth", "Minnie", "Evelynn", "Lia",
           "Gracelyn", "Laura", "Lexi") 
pages_read <- c(158, 56, 186, 123, 72, 102, 184, 200, 83, 118)

reading_df <- data.frame("names"= names, "pages_read"=pages_read, 
                         stringsAsFactors = FALSE )
# Here stringAs factor are set to Flase because 
# if not, the datafrrae will create factors as default
reading_df

#structure of dataset
str(reading_df)

# summary statistics and length/class/mode
summary(reading_df)

#single column
reading_df$names

# presidents_data.csv data

presidents_data <- read.csv('presidents_data.csv')
str(presidents_data)
summary(presidents_data)

# show a pop-up window of the dataframe for you to easily edit
edit(presidents_data)
edit(reading_df)
reading_df

# head, tail functions
head(reading_df)
tail(reading_df)

# selecting elements from a dataframe are exactly the same as an array or matrix
# using [], [[]], $
reading_df[1, ] # first row
reading_df [[1]] # first column. however the output is a vector
reading_df$names # names column , however the output is a subset of data frame. It is like slicing the first coloumn
reading_df[[1]][2] # accessing the 1st columns, the value in the 2nd row from the same column
reading_df$names[2] # accessing the columns using the column name

# can also assign names to each row
colnames(reading_df)
row.names(reading_df)
rownames(reading_df) <- reading_df$names # column "names" is assign as index
print(reading_df,row.names = TRUE)

reading_df <- reading_df[-1] # removing the first columns
reading_df
colnames(reading_df) # by rerunning this , you notice that there is only one column remaining


# How many pages did Laura read? 
reading_df["Laura",] # here , the index are names, so you can access value, using rows names

# you can also add rows and columns the same way with cbind and rbind
cbind(reading_df, "Book" = c("Harry Potter and the Sorcerer's Stone", 
                             "Anne of Green Gables", "The Babysitters Club",
                             "Matilda", "A Wrinkle in Time", 
                             "Alice in Wonderland", "Where the Red Fern Grows",
                             "Number the Stars", "To Kill a Mockingbird",
                             "The Book Thief"))
# error 
rbind(reading_df, c("Josephine", 112)) # because in the previous code, we assign rowsname as name. so there will be a mismatch in number of columns 
reading_df

# dataframes are just the beginning - the most effective way to view data in R is
# through the tidyverse
