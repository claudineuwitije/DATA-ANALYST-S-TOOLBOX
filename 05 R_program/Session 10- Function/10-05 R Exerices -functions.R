#### Exercise 9 - Functions ####

# 1. Write a function that given the individual input of 1 through 10 will give the
#     following output
# [1]    3   10   29   66  127  218  345  514  731 1002
func1 <- function(x) {
  sec <- c()
  for (i in x){
    y <- i^3 +2
    sec <- c(sec, y)
  } 
  return(sec)
}

x <- 1:10
func1(x)


# 2. Create a function with 2 parameters that puts any number to any power.

func2 <- function(a,b) {
  y <- a^b
return(y)
}
func2(2,3)


# 3. Change the above function to have the default of being squared.

func3 <- function (a, b=2) {
  y <- a^b
  return(y)
}
func3(4)

# 4. Create a function that converts a vector of temperatures in degrees Fahrenheit
#       into degrees Celcius
# Example vector of degrees Fahrenheit
fahrenheit <- c(75,  76,  54,  99,  77,  58,  78,  84,  57, 100,  56,  95,  68,
                85,  63,  66,  61,  64,  81,  59)

celcius <- c()
temp_conversion <- function (x) {
  for (i in 1:length(x)) {
    celcius[i] <- round ((x[i]-32)*5/9, 2)
  }
  return ( celcius)  
}
temp_conversion(fahrenheit)

# or 
temp_conversion1 <- function (x) {
  celcius <- c()
  for (i in x) {
    deg <- round ((i-32)*5/9,2)
    celcius <- c(celcius, y)
  }
  return(celcius)
}
temp_conversion(fahrenheit)


# 5. Create a nested function by using your temperature conversion function from 
#     question 4 and find the mean and standard deviation of the temperature in 
#     degrees Celcius

mean_std_celcius_fx <- function(y) {
  v <- temp_conversion(y)
  m <- mean(v)
  s <- sd(v)
  result_list <- list(" mean"= m, "standard deviation" = s)
  return(result_list) 
}

mean_std_celcius_fx(fahrenheit)

# or 
mean_std_celcius_fx <- function(y) {
  v <- temp_conversion(fahrenheit)
  m <- mean(v)
  s <- sd(v)
  result_list <- list(" mean"= m, "standard deviation" = s)
  return(result_list) 
}

mean_std_celcius_fx(v)

