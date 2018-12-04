library(plyr)
library(plotly)
library(dplyr)
library(reticulate)
library(lattice)
library(ggplot2)
library(GGally)
library(gridExtra)

# Read in ML results data
scores <- read.csv('./data/model_accuracy_ML.csv', stringsAsFactors = FALSE)
pred <- read.csv('./data/model_test_predictions.csv', stringsAsFactors = FALSE)

# Count number of predictions for each model
knn_agg <- dplyr::count(pred, outcome, knn_pred)
rfc_agg <- dplyr::count(pred, outcome, rfc_pred)

# Create plots of ML results
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

# Create bar chart comparing accuracy scores
ml_acc_score <- ggplot(data = scores, aes(x = Model.Type, y = Score, fill=Model.Type )) +
                  geom_bar(stat = "identity") + 
                  ggtitle("Accuracy Scores for Machine Learning Algorithms") + 
                  geom_text(aes(label=round(scores$Score, 2)), size=5, color = "black")