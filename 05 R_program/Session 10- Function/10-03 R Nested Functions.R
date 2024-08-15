#### Nested Functions ####
x <- 20
nested_function <- function(x, y) {  # note that this function is not nested
  a <- x +y
  return(a)
}

# this is the nested part:
nested_function(nested_function(3,4), nested_function(9,10))

# or 

outer_fx <- function(x,y,z) {
  prod <- nested_function(x,y)* z
  return(prod)
}
outer_fx(3,4,20)

# Recursion 
# careful! easy to write a function that never terminates or uses
# excess amounts of memory/processing power

tri_recursion <- function(k) {
  if (k>0) {
    result <-  k + tri_recursion(k-1)
    print(result)
  } else {
    result =0
    return(result)
  }
}

tri_recursion(6)

# more recursion examples:
# https://data-flair.training/blogs/r-recursive-function/









