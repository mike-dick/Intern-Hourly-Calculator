library(shiny)

#UI Module#
addDayUI <- function(id)
{
  ns <- NS(id)
  fluidPage(
    theme = "style.css",
    tags$div(class = "input-data",
             textInput("date", label = "Date", width = 50),
             textInput("start", label = "Start", width = 75),
             textInput("end", label = "End", width = 75),
    )
  )
}