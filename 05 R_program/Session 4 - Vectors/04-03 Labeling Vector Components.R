### Labeling Vector Components 

# Naming vector components 
fruit_count <- c(apples=3, bananas=10,papayas=2)
fruit_count
is.vector(fruit_count)
typeof(fruit_count) # here the type is double (it is like a float number)
fruit_count <- c(apples=3L, bananas=10L,papayas=2L)
fruit_count
is.vector(fruit_count)
typeof(fruit_count) # here type is integer bcs on value there is "L"

# indexing 
fruit_count["apples"]
fruit_count[apples] # this will throw an error , be careful on how you call values

# assigning name (variables) to values 
# naming vectors components( objects) in a vector
fruit_count2 <- c(5,7,9)
fruit_count2
fruit_count2 <- setNames(fruit_count2, c('avocados', 'mangoes', 'grapes'))
fruit_count2

fruit_count3 <- c(4,1,10)
fruit_count3
names(fruit_count3) <-c('apples','bananas','papayas')
fruit_count3
