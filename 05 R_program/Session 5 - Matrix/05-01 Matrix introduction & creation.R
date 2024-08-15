#### Matrices ####

# 2 dimensional vector
# must be all the same type 
# R will coerce to the most general data type

# Matrix Creation

# general formula for matrix
# matrix(vector, nrow, ncol, byrow = FALSE, dimnames = NULL)

v1 <- c(1:25)

m1 <- matrix(v1)
m1
matrix(v1, nrow=5) # components are placed into matrix by columns

matrix(v1, nrow=5, byrow=TRUE) # components are placed into matrix by rows

# characters
as <- rep('a',3)
bs <- rep('b',3)
matrix(c(as,bs), ncol=2)

# Logical 
trues <- rep(TRUE, 3)
false <- rep(FALSE,3)
matrix(c(trues,false),ncol=2)
matrix(c(trues,false),ncol=3)
matrix(c(trues,false),ncol=3, byrow=3)

# possible, but ....
matrix(v1, nrow=5, ncol=2) # warning 
matrix(v1, nrow=4, ncol=7) # warning 

# cbind and rbind
f <- c(1:5)
f2 <- c(6:10)
mc <- cbind(f,f2)
mc
class(mc)
typeof(mc)
 mr <- rbind(f,f2)
mr 

# special matrices 

# matrix with all rows and columns are filled by a single constant 'k'
# matrix(k, nrow, ncol)
matrix(3, 2, 3)


# Diagonal matrix
# entries outside main diagonal are zero
# diag(k, nrow, ncol)
diag(8, 3, 3) # diagonal component are the same of value K = 8
diag(c(2,3,4),3,3) # defining the element of the diagonal

# Identity matrix
# ones and zeros
diag(1,3,3)
