#### Exercise 7 - Factors ####

# 1. Create a factor with 4 levels.
set.seed(123)
scores <- c("A", "B", "C", "D", "E", "F" )
student_score <- sample(scores, 20, replace = TRUE)
student_score_factors <- factor(student_score)
levels(student_score, levels = scores )

# you can also define the factor in the following way:
factor(student_score_factors)

# 2. Convert the following vector to a factor in chronological order 
# and specify to R that there is an order to the levels
set.seed(123)
exercise_vector <- sample(month.name, 100, replace = TRUE)
exercise_vector_chron <- factor(exercise_vector, labels= month.abb, ordered = TRUE)
exercise_vector_chron

# 3. Convert the following factor to numeric
set.seed(123)
samp <- sample(1:3, 15, replace=TRUE)
exercise_factor <- factor(samp)
exercise_factor
as.numeric(levels(exercise_factor))[exercise_factor]

# 4. Separate "Petal.Length" from "iris" dataset into groups with "pretty" labels,
#     test whether it is a factor, and print it as a table
iris
iris_Petal_lengh_pretty <- cut(iris$Petal.Length, pretty(iris$Petal.Length))
iris_Petal_lengh                       
is.factor(iris_Petal_lengh )                         
table(iris_Petal_lengh )
