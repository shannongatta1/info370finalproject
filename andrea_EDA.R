library(ggplot2)
library(dplyr)

dems <- read.csv('./data/dem_candidates_prepped.csv', stringsAsFactors = FALSE)
dummies <- read.csv('./data/dem_with_dummies.csv', stringsAsFactors = FALSE)

count_endorsements <- dems %>% select(c(16:27))
dems$Neutral.Endorsements <- rowSums(count_endorsements == 'Neutral')
dems$Yes.Endorsements <- rowSums(count_endorsements == 'Yes')
dems$No.Endorsements <- rowSums(count_endorsements == 'No')

write.csv(dems, file = './data/dems_with_endorsement_counts.csv', row.names = FALSE)

yes_endorsements <- dems %>% filter(Yes > 0) %>% group_by(Primary.Status) %>% count(Primary.Status)
no_endorsements <- dems %>% filter(No > 0) %>% group_by(Primary.Status) %>% count(Primary.Status)
neutral_endorsements <- dems %>% filter(Yes > 0, No > 0) %>% 
                          group_by(Primary.Status) %>% 
                          count(Primary.Status)

yes_bar <- ggplot(yes_endorsements, aes(x=Primary.Status, y=n, fill=Primary.Status))+
  geom_bar(stat = "identity")

no_bar <- ggplot(no_endorsements, aes(x=Primary.Status, y=n, fill=Primary.Status))+
  geom_bar(stat = "identity")

neutral_bar <- ggplot(neutral_endorsements, aes(x=Primary.Status, y=n, fill=Primary.Status))+
  geom_bar(stat = "identity")