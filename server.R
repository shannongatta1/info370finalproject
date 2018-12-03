#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(gridExtra)
source('./R/andrea_EDA.R')
source('./R/lgbtq_EDA.R')

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$LGBTQ <- renderPlot({
    LGBTQ_bar
  })
  
  output$endorsements_bar <- renderPlot({
    grid.arrange(yes_bar, no_bar, neutral_bar, nrow=1)
  })
  
  output$endorsements_table <- renderTable({
    endorsement_table
  })
  
})
