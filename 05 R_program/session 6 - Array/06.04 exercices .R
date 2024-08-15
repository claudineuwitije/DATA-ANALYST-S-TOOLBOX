#### Exercise 5 - Arrays ####

# 1. Create a multi-dimensional array that is not a matrix. 

v1 <- c(1:15, 12 )
arr1 <- array(v1, dim = c(3, 4, 2))
arr1

# 2. Make the following vector (e) 3 dimensional, name the dimensions, and list the
#       attributes below this question in the script.
set.seed(123)
e <- sample(1:100, 30)
dim(e) <- c(2, 5, 3)
e_rnames <- c("a", "b")
e_cnames <- c("col1", "col2", "col3", "col4", "col5")
e_mnames <- c("matrix1", "matrix2", "matrix3")
dimnames(e) <- list(e_rnames, e_cnames, e_mnames)
e

# list attributes here: 
attributes(e)


# 3. Find the sum of each row of your 3 dimensional array from question 2
apply(e, c(2), sum)

