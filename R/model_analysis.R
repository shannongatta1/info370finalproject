library(plyr)
library(plotly)
library(dplyr)
library(reticulate)
library(lattice)
library(ggplot2)
library(GGally)
library(gridExtra)

# Read in results data
scores <- read.csv('./data/model_accuracy_ML.csv', stringsAsFactors = FALSE) %>% 
  select(Model.Type, Score)
ml_pred <- read.csv('./data/model_test_predictions.csv', stringsAsFactors = FALSE)
stat_scores <- read.csv('./data/model_accuracy_stats.csv', stringsAsFactors = FALSE) %>% 
  select(Model.Type, Score)
stat_pred <- read.csv('./data/logistic_test_predictions.csv', stringsAsFactors = FALSE)

# Count number of predictions for each model
knn_agg <- dplyr::count(ml_pred, outcome, knn_pred)
rfc_agg <- dplyr::count(ml_pred, outcome, rfc_pred)
logistic_agg <- dplyr::count(stat_pred, outcome, lr_pred)

ggplot(knn_agg, aes(knn_agg, fill=outcome)) +
  geom_col()

# Create plots of model results
knn_plot <- ggplot(knn_agg, aes(outcome, knn_pred, color=n)) + 
              geom_point( size = (knn_agg$n)) +
              xlim(-.5, 1.5)+ylim(-1, 1.5) +
              ggtitle("Number of KNN Predictions and Outcome Correlations") + 
              geom_text(aes(label=knn_agg$n), size=5, color = "white")

rfc_plot <- ggplot(rfc_agg, aes(outcome, rfc_pred, color=n)) + 
              geom_point( size = (rfc_agg$n)) +
              xlim(-.5, 1.5)+ylim(-1, 1.5) +
              ggtitle("Number of RFC Predictions and Outcome Correlations") + 
              geom_text(aes(label=rfc_agg$n), size=5, color = "white")

lr_plot <- ggplot(logistic_agg, aes(outcome, lr_pred, color=n)) + 
  geom_point( size = (logistic_agg$n)) +
  xlim(-.5, 1.5)+ylim(-1, 1.5) +
  ggtitle("Number of Logistic Regression Predictions and Outcome Correlations") + 
  geom_text(aes(label=logistic_agg$n), size=5, color = "white")

# Function to display graph based on Shiny input
resultGraph <- function(model) {
  if (model == 'knn') {
    return (knn_plot)
  } else if (model == 'rfc') {
    return (rfc_plot) 
  } else {
    return (lr_plot)
  }
}

# Create bar chart comparing accuracy scores
all_scores <- rbind(scores, stat_scores)[-4,]
acc_score <- ggplot(data =all_scores, aes(x = Model.Type, y = Score, fill=Model.Type )) +
                  geom_bar(stat = "identity") + 
                  ggtitle("Accuracy Scores for Machine Learning Algorithms") + 
                  geom_text(aes(label=round(scores$Score, 2)), size=5, color = "black")