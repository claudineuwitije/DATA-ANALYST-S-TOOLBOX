### Comparing 2 differents vectors ###


birds_day1 <- c("Cardinal", "Blue Jay", "Veery")
birds_day2 <- c("Veery", "Red-tailed Hawk", "Turkey Vulture", "Eastern Bluebird",
                "Catbird", "American Robin")

# which ones are common between the two
birds_day1 %in% birds_day2
birds_day2 %in% birds_day1

# return common components

birds_day1[birds_day1 %in% birds_day2]

# are any the same?
any(birds_day1 %in% birds_day2)

# are all of them the same
all(birds_day1 %in% birds_day2)

# numeric vector comparisons
bird_count_day1 <- c(5, 2, 1)
bird_count_day2 <- c(4, 1, 1, 9, 25, 30)

bird_count_day1 < bird_count_day2
bird_count_day2[bird_count_day1 < bird_count_day2]
