#### For Loops ####

# for (iterator in [vector, sequence, dataframe column]) {
# code block to be iterated  
# }

set.seed(123)
f_vector <- sample(-10:10, 10)
f_vector

for (i in f_vector){
  print(i)
}

for (i in f_vector){
  print(i^2)
}


# you can use if-else statement into for loop as well
f_vector

for (i in f_vector){
  if (i > 0){
    print(sqrt(i))
  } else {
    print(i^2)
  }
}  # creating multiple for loops, slow down the computer 


# assign to a new variable so that we can call it later
f_vector
root <- c()
squared <- c()

for (i in f_vector){
  if (i > 0){
    root <- c(root, sqrt(i))
  } else {
    squared <- c(squared, i^2)
  }
}
root 
squared 

# nesting for loops
  #  for matrix
my_matrix <- matrix(nrow= 10, ncol = 10)
my_matrix

# assign values based on position
for (i in 1: dim(my_matrix)[1]){
  for (j in 1: dim(my_matrix)[2]) {
    my_matrix[i,j]= i*j
  }
}
my_matrix

# next in loops
m <- 20
m 
 for (k in 1:m){
   if (!k%%2)
     next
   print(k)
 }


G <- 20
G
for (k in 1:G){
  if (!k%%2)
    next
    print(k)
}
