### Vector creation ### --> atomic vector all the value in the single vector are
### the same data type or R coerce them into one same vector

# 1. single value known as atomic vector
hi<-'hi'
is.vector(hi)

# 2. colon to create a sequence 
vect1 <- 3:9
vect1
is.vector(vect1)

# 3. sequence operator (seq operator)
vect2 <- seq(1,9, by=2)
vect2
is.vector(vect2)

# 4. c()
vect3 <- c(3,4,5,10)
vect3

# 5. what happens if ...
vect4 <- c(3,'hi',3) # the data type is coerced into string 
vect4
is.vector(vect4)

vect5 <- c(0, TRUE, FALSE, 10) # the data type is coerced into string
vect5
is.vector(vect5)

vect6 <- c(TRUE, 'hi', FALSE, 1, 4.533) # the data type is coerced into string
vect6
is.vector(vect6)
