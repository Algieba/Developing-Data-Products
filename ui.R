library(shiny)
library(ggplot2)

data(Titanic)
dataSet <- as.data.frame(Titanic)

shinyUI(pageWithSidebar(

      headerPanel('Survival of passengers on the Titanic'),
      sidebarPanel(
            selectInput("class", "Class:", c("All" = " ",
                                             levels(dataSet$Class))),
            selectInput("sex", "Sex:", c("All" = " ",
                                         levels(dataSet$Sex))),
            selectInput("age", "Age:", c("All" = " ",
                                         levels(dataSet$Age))),
            radioButtons("graphType", "Graph type:", c("Bar" = "normal",
                                                       "Pie" = "polar"),
                         selected = "polar"),

            # Char and data
            wellPanel(
                  plotOutput("plot1"),
                  br(),
                  tableOutput("table")
            )
      ),
      mainPanel(

            # Show a tabset that includes: app instructions,
            # 'ui.R' file and 'server.R' file.
            tabsetPanel(type = "tabs",
                        tabPanel("App Documentation",
                                 includeHTML("instructions.html")),
                        tabPanel("ui.R",
                                 includeHTML("ui.R.html")),
                        tabPanel("server.R",
                                 includeHTML("server.R.html"))
            )
      )
))
