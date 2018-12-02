library(ggplot2)
library(dplyr)

# Read in democratic primary data
dems <- read.csv('./data/dem_candidates_prepped.csv', stringsAsFactors = FALSE)

# Count the number of yes, no, and neutral endorsements
count_endorsements <- dems %>% select(c(16:27))
dems$Neutral.Endorsements <- rowSums(count_endorsements == 'Neutral')
dems$Yes.Endorsements <- rowSums(count_endorsements == 'Yes')
dems$No.Endorsements <- rowSums(count_endorsements == 'No')

# Export csv with endorsement counts
write.csv(dems, file = './data/dems_with_endorsement_counts.csv', row.names = FALSE)

# Count the number of candidates who advanced or lost for each endorsement category
yes_endorsements <- dems %>% filter(Yes > 0) %>% group_by(Primary.Status) %>% count(Primary.Status)
no_endorsements <- dems %>% filter(No > 0) %>% group_by(Primary.Status) %>% count(Primary.Status)
neutral_endorsements <- dems %>% filter(Yes > 0, No > 0) %>% 
                          group_by(Primary.Status) %>% 
                          count(Primary.Status)

# Create bar charts of primary results for each endorsement category
yes_bar <- ggplot(yes_endorsements, aes(x=Primary.Status, y=n, fill=Primary.Status))+
  geom_bar(stat = "identity")+
  ggtitle('Results for "Yes" Endorsements')+
  labs(y='count')

no_bar <- ggplot(no_endorsements, aes(x=Primary.Status, y=n, fill=Primary.Status))+
  geom_bar(stat = "identity")+
  ggtitle('Results for "No" Endorsements')+
  labs(y='count')

neutral_bar <- ggplot(neutral_endorsements, aes(x=Primary.Status, y=n, fill=Primary.Status))+
  geom_bar(stat = "identity")+
  ggtitle('Results for "Neutral" Endorsements')+
  labs(y='count')

# Our dataset also contains information on the endorsements candidates received from 
# various individuals and groups, such as Barack Obama, Bernie Sanders, and the Working Families 
# Party. Endorsements can have a profound effect on election outcomes, but by how much? 

# We have three types of of endorsements - yes, no, and neutral:
# - "Yes" endorsements - a candidate was specifically endorsed before the primary
# - "No" endorsements - a candidate was running against another endorsed candidate, or if they
# were specifically anti-endorsed before the primary (for example, if money was spent to attack
# the candidate)
# - "Neutral" endorsements - a group did not weigh in on this candidate
# After counting how many of each a candidate has, we can see the effect of this on the candidates
# who won or lost.

# If you thought that having "yes" endorsements would go along with a candidate winning, you were
# right. Of the candidates who had "yes" endorsements, more of them advanced in the primaries than
# those who had "no" or "neutral" endorsements. Similarly, having "no" endorsements hurt candidate
# chances of winning the elections. "Neutral" endorsements didn't negatively impact results as bad
# as "no" endorsements. 

# TLDR; Having endorsements in your favor is probably helpful in winning an election.