# Setting factors level

blood_type <- (c('O','A', 'O', 'O', 'A', 'B', 'B', 'O','B', 'B'))
blood_type_factor <- factor(blood_type )
blood_type_factor 

# what are the level in blood_type
levels(blood_type_factor)

# how is the factor structured?
str(blood_type_factor)

# specify factors level 
blood_type_factor2 <- factor(blood_type, level = c("A","AB","B", "O"))
blood_type_factor2
str(blood_type_factor2)

blood_type_factor2[length(blood_type_factor2)]<- "AB"
blood_type_factor2

# levels versus Labels 
# Levels are related to input while labels are related to output 

set.seed(123)
mons <- sample(month.name, 120, replace=TRUE)
month_factor <- factor(mons,levels= month.name) # notice here the order 
    # is defined to chronological order and not to alphabetical order
month_factor
levels(month_factor)

# specify the Labels to be abbreviation
month_factor2 <- factor(mons, labels = month.abb)
month_factor2

# Labels must be the same length as the number of levels
month_factor3 <- factor(mons, labels = c(month.abb, "Mon")) # Error

# levels does not have the above issue
month_factor4 <- factor( mons, levels = c(month.name, "Mon"))
month_factor4 




















