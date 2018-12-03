dems <- read.csv('./data/dem_candidates_prepped.csv', stringsAsFactors = FALSE)

LGBTQ_bar <- ggplot(data = dems, aes(x = Primary.Status, fill = LGBTQ.)) +
              geom_bar(position=position_dodge()) + 
              ggtitle("Results for LGBTQ+ in the Primary Races") + 
              geom_text(stat="count", aes(label = ..count..), position = position_dodge(.9), vjust = .5)