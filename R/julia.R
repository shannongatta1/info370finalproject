library(ggplot2)
library(dplyr)
library(scales)

data <- read.csv('../data/dem_candidates_prepped.csv', stringsAsFactors = FALSE)

#Race
white_can <- data %>% filter(Race == 'White')
non_white_can <- data %>% filter(Race == 'Nonwhite')

race <- data.frame(race=c("White", "Nonwhite"),
                 value=c(nrow(white_can), nrow(non_white_can)))

ggplot(data=race, aes(x=race, y=value, fill=race)) +
  geom_bar(stat="identity")

#pie chart
piechart<- ggplot(race, aes(x="", y=value, fill=race))+
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start=0) + 
        geom_text(aes(y = value/2 + 
        c(0, cumsum(value)[-length(value)]), 
            label = percent(value/(nrow(white_can)+nrow(non_white_can)))), size=5)

#success vs race
white_can_success <- data %>% filter(Race == 'White') %>% filter(Primary.Status == "Advanced")
non_white_can_success <- data %>% filter(Race == 'Nonwhite') %>% filter(Primary.Status == "Advanced")

race_success <- data.frame(race=c("White", "Nonwhite"),
                   value=c(nrow(white_can_success), nrow(non_white_can_success)))

success_pie<- ggplot(race_success, aes(x="", y=value, fill=race))+
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start=0) + 
  geom_text(aes(y = value/2 + 
                  c(0, cumsum(value)[-length(value)]), 
                label = percent(value/(nrow(white_can_success)+nrow(non_white_can_success)))), size=5)


# stacked bar charts
data$Race <- factor(data$Race) # Create a categorical variable
data$Primary.Status <- factor(data$Primary.Status) # Create categorical variable

status_race_stacked <- ggplot(data%>% count(Primary.Status, Race) %>%
         mutate(pct=n/sum(n)),              # Calculate percent within each region
       aes(Primary.Status, n, fill=Race)) +
  geom_bar(stat="identity") +
  geom_text(aes(label=paste0(sprintf("%1.1f", pct*100),"%")), 
            position=position_stack(vjust=0.5))

race_status_stacked <- ggplot(data%>% count(Race, Primary.Status) %>%  
         mutate(pct=n/sum(n)),              # Calculate percent within each region
       aes(Race, n, fill=Primary.Status)) +
  geom_bar(stat="identity") +
  geom_text(aes(label=paste0(sprintf("%1.1f", pct*100),"%")), 
            position=position_stack(vjust=0.5))