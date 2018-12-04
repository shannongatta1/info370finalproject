#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(dplyr)
library(shiny)
library(ggplot2)
library(gridExtra)
source('./R/lgbtq_office_EDA.R')
source('./R/julia.R')
source('./R/data_intro.R')
source('./R/ml_analysis.R')
source('./R/andrea_EDA.R')

shinyServer(function(input, output) {
  
  output$data_preview <- renderText ({
    data_preview
  })
  
  output$LGBTQ_bar <- renderPlot({
    LGBTQ_bar
  })
  
  output$office_bar <- renderPlot({
    office_bar
  })
  
  output$race_pie <- renderPlot({
    race_pie_chart
  })
  
  output$race_status_pair <- renderPlot({
    grid.arrange(status_race_stacked, race_status_stacked, nrow=1)
  })
  
  output$endorsements_bar <- renderPlot({
    grid.arrange(yes_bar, no_bar, neutral_bar, nrow=1)
  })
  
  output$endorsements_table <- renderTable({
    endorsement_table
  })
  
  output$knn_plot <- renderPlot({
    knn_plot
  })
  
  output$rfc_plot <- renderPlot({
    rfc_plot
  })
  
  output$ml_acc <- renderPlot({
    ml_acc_score
  })
  
})
