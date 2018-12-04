library(ggplot2)
library(dplyr)

# Read in democratic primary data
dems <- read.csv('./data/dem_candidates_prepped.csv', stringsAsFactors = FALSE)

# Create bar chart of results for advancements and losses, filled by LGBTQ data
LGBTQ_bar <- ggplot(data = dems, aes(x = Primary.Status, fill = LGBTQ.)) +
              geom_bar(position=position_dodge()) + 
              ggtitle("Results for LGBTQ+ in the Primary Races") + 
              geom_text(stat="count", aes(label = ..count..), position = position_dodge(.9), vjust = .5)

# Create bar chart of results for advancements and losses, filled by office type data
office_bar <- ggplot(data = dems)+
                geom_bar(mapping = aes(x = Primary.Status, fill = Office.Type))+
                labs(
                  title = "Results for Primary Races by Office Type"
                )+ 
                scale_fill_brewer(palette="Blues")