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