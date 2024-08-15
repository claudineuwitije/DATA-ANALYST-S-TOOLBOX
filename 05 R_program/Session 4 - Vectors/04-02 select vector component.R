### vector component selection ###

greetings <- c('hi','hello', 'hola', 'hey') 
# c here stand for combing or concatenate arguments into one vector

# single component indexing 
# the indexing in R is 1 based and not 0 based as in python
greetings[1] # slicing the first value in the vector

# negative indexing 
greetings[-1] # selecting everything in the vector other than the first value

greetings # not that the slicing does not change the original variable

# multiple component indexing 
greetings[c(-2,-1)]
greetings[c(1,3)]

# but i cannot mix positive and negative indices 
greetings[c(2,-1)] # this will return error

# logical indexing
greetings[c(TRUE,FALSE,FALSE,TRUE)]

# numerical vectors
num_vect <- c(5,9,0,-8)

# logical indexing 
num_vect < 6
num_vect[num_vect < 6]
