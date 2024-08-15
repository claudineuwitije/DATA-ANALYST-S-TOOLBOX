#### Selecting Elements from a List ####

freedom <- list("greeting" = "hello", "logical" = FALSE, "counts" = c(2,3,1), 
                "second_logical" = TRUE, "large_number" = 34, "double" = 3.2)
freedom

# first element # this gives the name and the value
freedom[1]

# just the element of "logical"  # while this only return the value
freedom[[2]]

# 2nd element in counts data
freedom[[3]] [[2]]

# just the vector in counts data
freedom[[3]]

# with the name 
freedom[3]

# using the name of the element
freedom["large_number"]
freedom[["large_number"]]

# using a integer vector
freedom[c(1, 2)]

# using a logical vector
freedom[c(TRUE, FALSE)]
# element recycling applies here too