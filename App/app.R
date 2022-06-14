library(shiny)
library(fontawesome)
#Adding R file to app.R#
source("helper.R")

ui <- fluidPage(
  #Connecting to CSS#
  theme = "style.css",
  tags$div(class = "header",
    tags$h1("A2PG's Intern Hours"),
    tags$h2("Worked Calculator"),
    icon("wallet")
  ),
  tags$hr(),
  tags$div(class = "input-data",
    textInput("date", label = "Date", width = 50),
    textInput("start", label = "Start", width = 75),
    textInput("end", label = "End", width = 75),
  ),
  tags$div(class = "action-buttons",
           actionButton("add", "Add!"),
           actionButton("done", "Done!")
  )
  
  
)

server <- function(input, output, session)
{
  observeEvent(
    input$add,
    {
      print("add works")
    }
  )
  observeEvent(
    input$done,
    {
      print("done works")
    }
  )
}

shinyApp(ui = ui, server = server)