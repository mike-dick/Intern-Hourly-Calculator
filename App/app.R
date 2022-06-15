library(shiny)
library(fontawesome)
#Adding R file to app.R#
source("helper.R")

#global variable for tracking:
COUNT <- 0
NAMESPACE <- "default"
addDayUI <- function(id)
{
  ns <- NS(id)
  print(id)
  fluidPage(
    tagList(
      tags$div(class = "input-data",
               textInput(ns("date"), label = "Date", width = 50),
               textInput(ns("start"), label = "Start", width = 75),
               textInput(ns("end"), label = "End", width = 75),
      )
    )
  )
}

ui <- fluidPage(
  #Connecting to CSS#
  theme = "style.css",
  tags$div(class = "header",
           tags$h1("A2PG's Intern Hours"),
           tags$h2("Worked Calculator"),
           icon("wallet")
  ),
  tags$hr(),
  addDayUI("default"),
  #NEW BAR GOES BELOW#
  tags$div(id = "placeholder"),
  #NEW BAR GOES ABOVE#
  tags$div(class = "action-buttons",
           actionButton("add", "Add!"),
           actionButton("done", "Done!")
  )
)

addDayServer <- function(input, output, session)
{
  # if(COUNT > 0)
  # {
  #   namespace <- paste("default", COUNT, sep = "")
  # }
  # else
  # {
  #   namespace <- "default"
  # }
  input_date <- input$date
  input_start <- input$start
  input_end <- input$end
  # print(namespace)
  print(input_date)
  print(input_start)
  print(input_end)
  print(COUNT)
  # insertUI(
  #   selector = "#placeholder",
  #   ui = addDayUI(namespace)
  # )
  COUNT <<- COUNT + 1
}

server <- function(input, output, session)
{
  
  observeEvent(input$add,
               {
                 namespace <- "default"
                 # if(COUNT > 0)
                 # {
                 #   namespace <- paste(namespace, COUNT, sep = "")
                 # }
                 callModule(addDayServer, namespace)
                 insertUI(selector = "#placeholder",
                          ui = addDayUI(namespace))
               }
  )
  observeEvent(input$done,
               {
                 print("done works")
               }
  )
}

shinyApp(ui = ui, server = server)