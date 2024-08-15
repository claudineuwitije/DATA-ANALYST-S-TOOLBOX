#### dplyr and Data Transformation ####


library(dplyr)

# %>% piping operator

names <- c("Mary", "Anna", "Emma", "Elizabeth", "Minnie", "Evelynn", "Lia",
           "Gracelyn", "Laura", "Lexi") 
pages_read <- c(158, 56, 186, 123, 72, 102, 184, 200, 83, 118)

book <- c("Harry Potter and the Sorcerer's Stone", "Anne of Green Gables", 
          "The Babysitters Club", "Matilda", "A Wrinkle in Time", 
          "Alice in Wonderland", "Where the Red Fern Grows", "Number the Stars",
          "To Kill a Mockingbird", "The Book Thief")
reading_tibble <- tibble("Name"= names, "Pages Read"= pages_read, "book"=book)

# Iris is built In Data Frame in R. 
# Importing iris as a table

iris_tib <- as_tibble(iris)
iris_tib

# filter out rows based upon one variable
# use double "==" to test for equality

setosa <- iris_tib %>% filter(Species == "setosa")
setosa
setosa1 <- iris_tib[iris_tib$Species =="setosa", ]

unique(setosa$Species) # here it returns the setosa species 
# though it also shows all other species on the colomns of species
iris_tib$Species

# careful with double floating point numbers in equality comparisons 
sqrt(2)^2 == 2 # this returns false bcs of the decimal number with sqrt
near(sqrt(2)^2, 2) # this returns True

# logical operators
greater100 <- reading_tibble %>% filter(`Pages Read` >= 100)

# more than one comparison
g100_l150 <- reading_tibble %>% filter(`Pages Read` > 100 & `Pages Read` < 150)

# if data is missing than it will be excluded, have to ask for it explicitly if 
# you want to view them after a comparison
na_example <- tibble(x = c(1, NA, 3))
filter(na_example, x > 1)
filter(na_example, is.na(x) | x > 1)

# reorder the rows based on a variable
petal_length_asc <- iris_tib %>% arrange(Petal.Length)
petal_length_asc
petal_length_desc <- iris_tib %>% arrange(desc(Petal.Length))
petal_length_desc

# missing values always go at the end

# select()
species_petal_width <- iris_tib %>% select(Species, Petal.Width)
species_petal_width
not_species_pw <- iris_tib %>% select(-Species, -Petal.Width) # here select everything unless these with sign "-"
not_species_pw

species_petal_width2 <- iris_tib %>% select(Species, "PW" = Petal.Width)
species_petal_width2

# rename()
petal_length2 <- iris_tib %>% arrange(Petal.Length) %>% rename(PL = Petal.Length)
petal_length2
