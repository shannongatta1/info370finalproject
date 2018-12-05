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
              tabPanel("Meet Our Data", 
                       mainPanel(
                         includeMarkdown("./md/data_intro.md"),
                         tags$br(),
                         htmlOutput('data_preview'),
                         tags$br(),
                         includeMarkdown('./md/data_intro_2.md'),
                         tags$br(),
                         tableOutput('data_desc'),
                         width=12
                       )),
              tabPanel("Get to Know Our Data",
                       mainPanel(
                         includeMarkdown('./md/EDA_intro.md'),
                         tags$br(),
                         tabsetPanel(
                           # LGBTQ EDA
                           tabPanel("LGBTQ",
                             mainPanel(
                               includeMarkdown("./md/lgbtq_EDA.md"),
                               tags$br(),
                               plotOutput('LGBTQ_bar', width = '80%'),
                               tags$br(),
                               includeMarkdown("./md/lgbtq_EDA_2.md"),
                               width=12
                             )
                           ),
                           # Office EDA
                           tabPanel("Office Type",
                             mainPanel(
                               includeMarkdown("./md/office_EDA.md"),
                               plotlyOutput('p_percentage'),
                               includeMarkdown("./md/office_EDA_2.md"),
                               plotlyOutput('office_pair'),
                               width=12
                               )
                           ),
                           # Race EDA
                           tabPanel("Race",
                                    mainPanel(
                                      includeMarkdown('./md/race_EDA.md'),
                                      plotOutput('race_pie', width = '80%'),
                                      includeMarkdown('./md/race_EDA_2.md'),
                                      plotOutput('race_status_pair'),
                                      width=12
                                    )
                           ),
                           # Endorsements EDA
                           tabPanel("Endorsements",
                                    mainPanel(
                                      includeMarkdown("./md/endorsements_EDA.md"),
                                      tableOutput('endorsements_table'),
                                      includeMarkdown("./md/endorsements_EDA_2.md"),
                                      plotOutput('endorsements_bar'), 
                                      tags$br(),
                                      includeMarkdown("./md/endorsements_EDA_3.md"),
                                      width=12
                                    )
                           )),
                         width=12
                       )),
              tabPanel('Our Prediction Models',
                       mainPanel(
                         includeMarkdown('./md/model_intro.md'),
                         tags$br(),
                         tabsetPanel(
                           tabPanel("Statistical Analysis: Logistic Regression",
                                    mainPanel(
                                      includeMarkdown('./md/logistic_regression.md'),
                                      width=12
                                    )),
                           tabPanel("Machine Learning: K Nearest Neighbors",
                                    mainPanel(
                                      includeMarkdown('./md/knn_desc.md'),
                                      includeMarkdown('./md/knn_app.md'),
                                      width=12
                                    )),
                           tabPanel("Machine Learning: Random Forest",
                                    mainPanel(
                                      includeMarkdown('./md/rfc_desc.md'),
                                      includeMarkdown('./md/rfc_app.md'),
                                      width=12)
                                    )),
                         tags$br(),
                         width=12
                         ),
                        includeMarkdown('./md/limitations.md'),
                        width=12
                       ),
              tabPanel("So What Matters?",
                       mainPanel(
                         includeMarkdown('./md/model_comparison.md'),
                         tableOutput('model_acc'),
                         includeMarkdown('./md/model_comparison_2.md'),
                         tags$br(),
                         sidebarLayout(
                           sidebarPanel(
                             radioButtons("model", "Model Type:",
                                          c("KNN" = "knn",
                                            "Random Forest" = "rfc",
                                            "Logistic" = "lr"),
                                          selected = 'knn')
                           ), 
                           mainPanel(
                             plotOutput('model_plot')
                           )
                         ),
                         includeMarkdown('./md/conclusion.md'),
                         width=12
                       ))
  )
  )
))
