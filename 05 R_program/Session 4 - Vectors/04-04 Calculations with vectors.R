### Calculations with vectors ###

vect <- c(100, 45, 96, 89)

# Summing vector components 
sum(vect)

# multiplying vector component by a value
vect*2 # this will multiply each component of the vector with 2

# summing 2 vectors 
vect2 <- c(98, 62, 36, 55)
vect_sum <- vect + vect2 # this is doing the addition by component wise
vect_sum
total_sum <- sum(vect+vect2) # this returns the sum of the all component as single value

# Multiplying 2 vectors 
vect_prod <- vect * vect2 # this is doing the multiplication by component wise
vect_prod

# Dividing 2 vectors 
vect_div <- vect/vect2 # division is done by component wise

# Component recycling 
short_vect <- c(2,0)
short_vect_prod <- vect*short_vect

short_uneven_vect <-c (2,3,0)
vect * short_uneven_vect # this will throw an error 

# using the rep function
vect
rep(vect, times =3) # will repeat the vector 3 times 
rep(vect, each =3) # this will repeat each value 3 times 
rep(vect, times = c(3,1,5,9)) # this shows how many time is each component is repeated

# combine 2 vectors 
vect
vect2
comb_vects <- c(vect, vect2) # combining 2 vectors into one vector
# the order matters  while combining vectors
comb_vects
