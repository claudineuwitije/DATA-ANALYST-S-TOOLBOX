# Ordering factors 

set.seed(123)
mons <- sample(month.name, 120, replace=TRUE)
month_factor <- factor(mons)
month_factor

# level are automatically ordered alphabetically 
levels(month_factor)

# if you want to preserve the order that show up in the data 
month_factor_preserved <- factor(mons, levels= unique(mons))
levels(month_factor_preserved)

# if you want to place the month in chronological order 
month.name # this is a built in R vector that lists the names of the months in
          # Chronological order
month_factor_chron <- (factor(mons, levels=month.name))
levels(month_factor_chron)

# You can tell R that there is a specific order to the levels
r_knows_ordered <- factor(mons, levels = month.name, ordered= TRUE)
r_knows_ordered[1] # accessing the first month in your data list
r_knows_ordered[2] # accessing the second month in your data list
r_knows_ordered[1] > r_knows_ordered[9] # compare them October > May

# months with counts
table(r_knows_ordered)

# you can reorder the levels based upon another variable
als_data <-read.csv("presidents_data.csv")
reorder(als_data$Year, als_data$Qtr4, mean)
# in ascending order 

# when graphing, sometimes it is useful to reverse the order of the labels
r_knows_reversed <- factor( mons, labels = rev(levels(r_knows_ordered)))
r_knows_reversed

# re-level  to maintain the order of the other level but move one to the front
releveled <- relevel(month_factor_chron, "December") 
releveled # here december is recorder at index 1 and January is place at index 2


