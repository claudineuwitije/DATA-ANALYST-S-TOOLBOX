### Basic R Functions to use with Vectors ###

## mean, standard deviation, median, range, sorting, length ##

new_vect <- c(5, 20, 9, 46, 20, 11)

# mean
mean(new_vect)

# standard deviation
sd(new_vect)

# median 
median(new_vect)

# range 
range(new_vect)

# sorting 
sort(new_vect)
new_vect[order(new_vect)]

# reverse order 
sort(new_vect, decreasing = TRUE)
new_vect[order(-new_vect)]

rev(new_vect)

# length 
length(new_vect)
