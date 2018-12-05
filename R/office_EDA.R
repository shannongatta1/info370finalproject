library(dplyr)
library(ggplot2)
library(plotly)

dems <- read.csv('./data/dem_candidates_prepped.csv', stringsAsFactors = FALSE)

governor <- filter(dems, Office.Type == "Governor")
g_per <- 100 / 811
governor <- filter(governor, Primary.Status == "Advanced")
g_per_succ <- 22/811
g_per_in <- 0.22

rep <- filter(dems, Office.Type == "Representative")
rep_per <- 687 / 811
rep <- filter(rep, Primary.Status == "Advanced")
rep_per_secc <- 235 / 811
rep_per_in <- 235 / 687

sen <- filter(dems, Office.Type == "Senator")
sen_per <- 24 / 811
sen <- filter(sen, Primary.Status == "Advanced")
sen_per_secc <- 8 / 811
sen_per_in <- 8 / 24

colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)')
p_percentage <- plot_ly(
  labels = c("Governor", "Representative", "Senator"),
  values = c(g_per, rep_per, sen_per),
  name = "Percentages of Candidates",
  type = "pie",
  marker = list(colors = colors,
                line = list(color = '#FFFFFF', width = 1))
) %>% layout(title = 'Percentage of Candidates in Total',
             xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
             yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))


p_percentage

p_percentage_success <- plot_ly(
  x = c("Governor", "Representative", "Senator"),
  y = c(g_per_in, rep_per_in, rep_per_in),
  type = "bar",marker = list(color = 'rgb(158,202,225)',
                             line = list(color = 'rgb(8,48,107)',
                                         width = 1.5))
) %>% layout(title = "Percentage of Candidates that Advanced within each Office Type", yaxis = list(title = 'Percentage'))

p_percentage_success

subplot(p_percentage, p_percentage_success, nrows=1)

# Create bar chart of results for advancements and losses, filled by office type data
office_bar <- ggplot(data = dems) +
                geom_bar(mapping = aes(x = Primary.Status, fill = Office.Type)) +
                labs(
                  title = "How Do Different Office Types Affect the Possibilty of Winning the Primary?"
                )+ scale_fill_brewer(palette="Blues")