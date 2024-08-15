###  other considerations ###

# generating factors levels
# gl(n,k,labels)
#   n: integer giving the number of levels
#   k: integer giving the number of replications
#   labels: vector of labels for the resulting factors levels

sports <- gl(4, 3, labels = c("running", "biking", "swimming", "jumping"))
sports

# "cut" function to create bins or categories
mtcars
car_mpg <- cut(mtcars$mpg, 3) # mtcars is a data frame built in R
car_mpg # mpg is a variable in mtcars data frame 
# 3 here is cutting the value in column mpg into 3 equal categories
is.factor(car_mpg)
table(car_mpg)

# "pretty" function to make nicer default labels 
car_mpg <- cut(mtcars$mpg, pretty(mtcars$mpg)) # create nicer group than cut
car_mpg
table(car_mpg)

car_mpg <- cut(mtcars$mpg, 3, c("low","medium", "high")) # renaming the category
table(car_mpg)

