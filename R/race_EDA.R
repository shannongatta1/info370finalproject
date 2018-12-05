library(ggplot2)
library(dplyr)
library(scales)

# Read in democratic primary data
data <- read.csv('./data/dem_candidates_prepped.csv', stringsAsFactors = FALSE)
dummy_data <- read.csv('./data/dem_with_dummies.csv', stringsAsFactors = FALSE)

# Filter candidates by race
white_can <- data %>% filter(Race == 'White')
non_white_can <- data %>% filter(Race == 'Nonwhite')
unknown_can <- data %>% filter(Race == 'Unknown')

# Filter candidates by advanced or lost
advanced <- data %>% filter(Primary.Status == 'Advanced')
lost <- data %>% filter(Primary.Status == 'Lost')

# Create dataframe of counts for each race type
race <- data.frame(race=c("White", "Nonwhite", "Unknown"), 
                   value=c(nrow(white_can), nrow(non_white_can), nrow(unknown_can)))


# Calculate percentage of advanced - 32% of the total candidates advance
percent_advanced <- nrow(advanced)/(nrow(advanced)+nrow(lost)) * 100

# Create pie chart of race distribution
race_pie_chart <- ggplot(race, aes(x="", y=value, fill=race))+ 
  geom_bar(width = 1, stat = "identity")+
  coord_polar("y", start=0) +
  ggtitle("All Candidates Race Proportions") + 
  geom_text(aes(y = value/2 + 
  c(0, cumsum(value)[-length(value)]), label = percent(value/(nrow(white_can)+nrow(non_white_can)+nrow(unknown_can)))), size=5)

            
# Create stacked bar charts for race and primary status
data$Race <- factor(data$Race) # Create a categorical variable
data$Primary.Status <- factor(data$Primary.Status) # Create categorical variable

status_race_stacked <- ggplot(data%>% dplyr::count(Primary.Status, Race) %>%
         mutate(pct=n/sum(n)),              # Calculate percent within each region
       aes(Primary.Status, n, fill=Race)) +
  geom_bar(stat="identity") +
  ggtitle("Primary Status stacked by Race category") + 
  geom_text(aes(label=paste0(sprintf("%1.1f", pct*100),"%")), 
            position=position_stack(vjust=0.5))+
  labs(y='count')

race_status_stacked <- ggplot(data%>% dplyr::count(Race, Primary.Status) %>%  
         mutate(pct=n/sum(n)),              # Calculate percent within each region
       aes(Race, n, fill=Primary.Status)) +
  geom_bar(stat="identity") +
  ggtitle("Race category stacked by Primary Status") + 
  geom_text(aes(label=paste0(sprintf("%1.1f", pct*100),"%")), 
            position=position_stack(vjust=0.5))+
  labs(y='count')