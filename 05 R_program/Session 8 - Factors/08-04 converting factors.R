## Converting Factors to other data types ##

# to numeric
set.seed(123)
num_factor <- sample(1:10, 10, replace = TRUE)
num_factor
num_factor <- factor(num_factor)
num_factor

# converting value into numeric 
as.numeric(levels(num_factor))[num_factor]

# the following code does not work
as.numeric(num_factor) # this return the level of each value and is not what we are looking for

# convert value into string 
char_factbr <- factor(month.name)
char_factbr
as.character(char_factbr)
# or 
levels(char_factbr)  # but this will be in alphabetical order other than in chronological 

# convert value into data
date_factor <- factor( c("03/21/2021", "03/22/2021", "03/23/2021"))
date_factor
as.Date(date_factor, format = "%m/%d/%Y")
data_factor
