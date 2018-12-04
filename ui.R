library(shiny)
library(shinythemes)
library(markdown)
library(dplyr)
library(ggplot2)
library(plotly)

# Define UI for application
shinyUI(fluidPage(theme = shinytheme('flatly'),
  
  (navbarPage('The Democratic Primaries 2018',
              tabPanel("A Political Shift...",
                       mainPanel(
                         includeMarkdown("./md/a_political_shift.md"),
                         width=12
                       )),
              tabPanel("Meet our Data", 
                       mainPanel(
                         includeMarkdown("./md/data_intro.md"),
                         htmlOutput('data_preview'),
                         includeMarkdown('./md/data_intro_2.md'),
                         width=12
                       )),
              tabPanel("Get to Know our Data",
                       mainPanel(
                         # LGBTQ EDA
                         includeMarkdown("./md/lgbtq_EDA.md"),
                         plotOutput('LGBTQ_bar', width = '80%'),
                         # Office EDA
                         plotOutput('office_bar', width = '80%'),
                         # Race EDA - resource Julia's data files
                         includeMarkdown('./md/race_EDA.md'),
                         plotOutput('race_pie', width = '80%'),
                         includeMarkdown('./md/race_EDA_2.md'),
                         plotOutput('race_status_pair'),
                         # Endorsements EDA
                         includeMarkdown("./md/endorsements_EDA.md"),
                         tableOutput('endorsements_table'),
                         includeMarkdown("./md/endorsements_EDA_2.md"),
                         plotOutput('endorsements_bar'), 
                         includeMarkdown("./md/endorsements_EDA_3.md"), 
                         width=12
                       )),
              tabPanel('Making our Predictions',
                       mainPanel(
                         tabsetPanel(
                           tabPanel("Statistical Methods",
                                    mainPanel(
                                      includeMarkdown('./md/logistic_regression.md'),
                                      width=12
                                    )),
                           tabPanel("Machine Learning",
                                    mainPanel(
                                      includeMarkdown('./md/ml_analysis.md'),
                                      plotOutput('knn_plot'),
                                      plotOutput('rfc_plot'),
                                      includeMarkdown('./md/ml_analysis_2.md'),
                                      plotOutput('ml_acc'),
                                      width=12
                                    ))
                         ),
                         width=12
                       )),
              tabPanel("So What Matters?",
                       mainPanel(width=12
                        # plotOutput('yes_bar')
                       ))
  )
  )
))
