library(ggplot2)
library(dplyr)

dems <- read.csv('./data/dem_candidates_prepped.csv', stringsAsFactors = FALSE)

# bar chart:
# x-axis - election month
# y-axis - count
# color by primary status

# map:
# fill each state with a different color depending on the month of the election

# pie chart for endorsements: --> facet grid
# number of yes, no, neutral

# bar chart: --> facet grid
# number of yes, no, neutral
# color by primary status

# [row, ]
test <- dems[1,] %>% select(c(16:27)) 
test$Neutral <- rowSums(test == 'Netural')

count_endorsements <- function(row) {
  row <- row %>% select(c(16:27))
  row
}

test2 <- dems %>% select(c(16:27))
test2$Neutral <- rowSums(test2 == 'Netural')
test2$Yes <- rowSums(test2 == 'Yes')
test2$No <- rowSums(test2 == 'No')