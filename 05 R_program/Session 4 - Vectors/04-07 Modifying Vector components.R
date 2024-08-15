### Modifying Vector components  ###

baby_nighttime_sleep_hours <- c(2, 6, 7, 7.5, 6.5, 5.5, 9)


# Changing a component / updating a component 
baby_nighttime_sleep_hours[1] <- 8

# adding a component 
baby_nighttime_sleep_hours <- c(baby_nighttime_sleep_hours, 6)
baby_nighttime_sleep_hours3 <- c(6, baby_nighttime_sleep_hours) # it does matter the order you put the new elements 

# deleting a component
baby_nighttime_sleep_hours
baby_nighttime_sleep_hours4 <- baby_nighttime_sleep_hours[-1]
baby_nighttime_sleep_hours[which(baby_nighttime_sleep_hours != 8)]
baby_nighttime_sleep_hours
baby_nighttime_sleep_hours[-which(baby_nighttime_sleep_hours == 8)]
baby_nighttime_sleep_hours
# note that deleting a component does not affect the origin vector