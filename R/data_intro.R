library(dplyr)
library(knitr)
library(kableExtra)
library(plotly)
library(ggplot2)

# Read in encoded democratic primary data
preview <- read.csv('./data/dem_with_dummies_renamed.csv', stringsAsFactors = FALSE)

# Create preview of data to be used in final resource
preview$X <- NULL
head_dems <- head(preview)
data_preview <- kable(head_dems) %>%
                  kable_styling(bootstrap_options = c("striped", "hover", "condensed"), 
                  position = "left", font_size = 12) %>% 
                  row_spec(0, font_size = 10) %>% 
                  scroll_box(width = "900px", height = "200px") 

