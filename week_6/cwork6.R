

library(dplyr)
msleep <- read.csv("https://web.njit.edu/~zhiwei/CS636/msleep_ggplot2.csv")
str(msleep)
sleepData <- select(msleep, name, sleep_total)
head(sleepData) 
head(select(msleep, -name))
head(select(msleep, name:order)) 
head(select(msleep, starts_with("sl")))
filter(mtcars, cyl == 8)
filter(mtcars, cyl < 6)
# Multiple criteria
filter(mtcars, cyl < 6 & vs == 1)
filter(mtcars, cyl < 6 | vs == 1)

# Multiple arguments are equivalent to and
filter(mtcars, cyl < 6, vs == 1)

#arrange
arrange(mtcars, cyl, disp)
arrange(mtcars, desc(disp))
rename(mtcars, Weight=wt)


#mutate & transmute
head(mutate(msleep, sleep_total_min = sleep_total * 60))
head(transmute(msleep, sleep_total_min = sleep_total * 60))

#group_by
by_cyl <- group_by(mtcars, cyl)
by_cyl
summarise(by_cyl, mean(disp), mean(hp))
by_vore <- group_by(msleep, vore)
by_vore
summarise(by_vore, total=mean(sleep_total), avg_sleep_rem=mean(sleep_rem, na.rm=T))


#pipe %>%
names(msleep)
msleep %>% select(name, order, sleep_total) %>% arrange(order, sleep_total) %>% head

msleep %>% select(name, order, sleep_total) %>% arrange(order, sleep_total) %>% filter(sleep_total >= 16)

msleep %>% group_by(order) %>% summarise(avg_sleep = mean(sleep_total), min_sleep = min(sleep_total), max_sleep = max(sleep_total), total = n()) 

search()




#reshape2
library(reshape2)

names(airquality) <- tolower(names(airquality))
head(airquality)
aql <- melt(airquality) 
head(aql)
aql %>% tail
dim(airquality)
dim(aql)


aql <- melt(airquality, id.vars = c("month", "day"))
head(aql)
head(airquality)
subset(airquality, month==5 & day==1)
subset(aql, month==5 & day==1)

aql <- melt(airquality, id.vars = c("month", "day"),
            variable.name = "climate_variable", 
            value.name = "climate_value")
head(aql)
head(airquality)
aql2 <- melt(airquality, id.vars = c("month", "day", "ozone"))
head(aql2)
names(airquality)
airquality %>% head

aql3 <- melt(airquality[1,], id.vars = c("month", "day", "ozone"))
aql3

#cast
aql <- melt(airquality, id.vars = c("month", "day"))
aqw <- dcast(aql, month + day ~ variable)
head(aqw)
head(airquality) 

dcast(aql, month ~ variable)
dcast(aql, month ~ variable, fun.aggregate = mean, na.rm = TRUE)
