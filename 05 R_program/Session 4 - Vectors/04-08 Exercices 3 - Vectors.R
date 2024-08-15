 ### EXERCICE 3 - VECTORS # 

# type your answers that you receive in the console underneath each question

# 1. Create an atomic vector.
vect1 <- c(1,2,3 )

# 2. Use the c() function to create a character vector with your favorite foods
# and assign it to the variable "fav_foods"

fav_foods <- c('avocado','vegetables','potatoes')


# 3. Select the first value from your fav_foods vector. 
fav_foods[1]

# 4. Create a vector of your favorite food ratings and assign them to a variable
# called "ratings"

ratings <- c(1,3,2)

# 5. Use your fav_foods vector to set the names of your ratings vector

names(ratings) <- fav_foods
ratings <- setNames(ratings,fav_foods)
ratings

# 6. Find the total sum of the following two numeric vectors:
numbers <- c(5, 2, 3)
numbers2 <- c(4, 9, 16)

totol_sum <- sum(numbers + numbers2)

# 7. Find the mean of the numbers vector

mean(numbers)

# 8. Change the 2 in the numbers vector to a 9.
numbers[2] <- 9
numbers

# 9. Find out if there are any components that are the same between numbers and
# numbers2
numbers2[numbers %in% numbers2]
