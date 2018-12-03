#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(markdown)
library(dplyr)
library(ggplot2)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  (navbarPage('The Democratic Primaries 2018',
              tabPanel("A Political Shift...",
                       mainPanel(
                         includeMarkdown("./md/A\ Political\ Shift.md")
                       )),
              tabPanel("The Data", # Include introduction and exploration?
                       mainPanel(
                         # LGBTQ EDA
                         plotOutput('LGBTQ', width = '80%', height = '500px'),
                         # Endorsements EDA
                         includeMarkdown("./md/endorsements\ EDA.md"),
                         tableOutput('endorsements_table'),
                         includeMarkdown("./md/endorsements\ EDA\ 3.md"),
                         plotOutput('endorsements_bar'), 
                         includeMarkdown("./md/endorsements\ EDA\ 2.md"), width=12
                       )),
              tabPanel("Statistical Methods",
                       mainPanel(
                         #plotOutput('yes_bar')
                       )),
              tabPanel("Machine Learning",
                       mainPanel(
                         #plotOutput('yes_bar')
                       )),
              tabPanel("So What Matters?",
                       mainPanel(
                        # plotOutput('yes_bar')
                       ))
  )
  )
))
