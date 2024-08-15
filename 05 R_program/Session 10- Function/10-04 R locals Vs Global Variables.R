#### Local vs Global Variables ####

# local variable - found within a function

# global variable - found in the global environment

# R will find the variable in the global environment if it is not found locally

func2 <- function() {
  print(x)
}
x <-2 
funct()

# R doesn't change global variable if it is changed inside a function
x <- 1
func3 <- function() {
   x <- 2
   print(x)
}
func3()




