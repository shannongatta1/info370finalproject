library(ggplot2)
library(dplyr)
library(gridExtra)

# Read in democratic primary data
dems <- read.csv('./data/dem_candidates_prepped.csv', stringsAsFactors = FALSE)

# Count the number of yes, no, and neutral endorsements
count_endorsements <- dems %>% select(c(16:27))
dems$Neutral.Endorsements <- rowSums(count_endorsements == 'Neutral')
dems$Yes.Endorsements <- rowSums(count_endorsements == 'Yes')
dems$No.Endorsements <- rowSums(count_endorsements == 'No')

# Export csv with endorsement counts
# write.csv(dems, file = './data/dems_with_endorsement_counts.csv', row.names = FALSE)

# Count the number of candidates who advanced or lost for each endorsement category
yes_endorsements <- dems %>% filter(Yes.Endorsements > 0) %>% 
                      group_by(Primary.Status) %>% 
                      dplyr::count(Primary.Status)
no_endorsements <- dems %>% filter(No.Endorsements > 0) %>% 
                      group_by(Primary.Status) %>% 
                      dplyr::count(Primary.Status)
neutral_endorsements <- dems %>% filter(Yes.Endorsements == 0, No.Endorsements == 0) %>% 
                          group_by(Primary.Status) %>% 
                          dplyr::count(Primary.Status)

# Create bar charts of primary results for each endorsement category
yes_bar <- ggplot(yes_endorsements, aes(x=Primary.Status, y=n, fill=Primary.Status))+
  geom_bar(stat = "identity")+
  ggtitle('Results for "Yes" Endorsements')+
  labs(y='count')+
  theme(legend.position="none")

no_bar <- ggplot(no_endorsements, aes(x=Primary.Status, y=n, fill=Primary.Status))+
  geom_bar(stat = "identity")+
  ggtitle('Results for "No" Endorsements')+
  labs(y='count')+
  theme(legend.position="none")

neutral_bar <- ggplot(neutral_endorsements, aes(x=Primary.Status, y=n, fill=Primary.Status))+
  geom_bar(stat = "identity")+
  ggtitle('Results for "Neutral" Endorsements')+
  labs(y='count')+
  theme(legend.position="none")

table_desc <- c('A candidate was specifically endorsed before the primary',
                'A candidate was running against another endorsed candidate, or if they were 
                specifically anti-endorsed before the primary (for example, if money was spent 
                to attack the candidate)',
                'A group did not weigh in on this candidate')

table_cat <- c('Yes', 'No', 'Neutral')

endorsement_table <- data.frame("Type" = table_cat, "Description" = table_desc)