# Factors 

# are stored as numbers and tables of levels
  # Factors level will always be visualized as characters

# Fast comparisons 

# Used for categorical variables 

# Especially useful for creating statistical models 

# Factor creation

gender <- factor(c("male","female","female","female","male"))
gender

#level will be automatically ordered alphabetically
questions <- factor(c(1, 2, 3, 5, 2, 3, 4, 5, 3, 1))
questions

# levels are also created when importing data 
als_data <- read.csv("presidents_data.csv",stringsAsFactors = TRUE)
str(als_data)

# elements are stored as indices 

#excluding argument in factor
questions_ex <- factor(c(1, 2, 3, 4, 5, 3, 2), exclude=1)
questions_ex

# R automatically excludes NAS when creating a factor, pass exclude=NULL 
#if you want to have NA's and place them as part of your level, 
# then you need to tell R , that you would like to exclude NULL, 
# not to exclude anything












