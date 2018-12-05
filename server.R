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
library(plotly)
source('./R/data_intro.R')
source('./R/lgbtq_EDA.R')
source('./R/office_EDA.R')
source('./R/race_EDA.R')
source('./R/endorsements_EDA.R')
source('./R/model_analysis.R')

shinyServer(function(input, output) {
  
  output$data_preview <- renderText({
    data_preview
  })
  
  output$data_desc <- renderTable({
    descriptions
  })
  
  output$LGBTQ_bar <- renderPlot({
    LGBTQ_bar
  })
  
  output$p_percentage <- renderPlotly({
    p_percentage
  })
  
  output$office_pair <- renderPlotly({
    subplot(p_percentage_success, office_bar)
  })
  
  output$p_percentage_success <- renderPlotly({
    p_percentage_success
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
  
  output$lr_plot <- renderPlot({
    lr_plot
  })
  
  output$knn_plot <- renderPlot({
    knn_plot
  })
  
  output$rfc_plot <- renderPlot({
    rfc_plot
  })
  
  output$model_acc <- renderTable({
    all_scores
  })
  
  output$model_plot <- renderPlot({
    return (resultGraph(input$model))
  })
})
