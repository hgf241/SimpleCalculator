
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)


shinyServer(function(input, output) {

  output$formula <- renderPrint({
    value1 <- renderValue(input$nr1, input$act10)
    value2 <- renderValue(input$nr2, input$act20)
    value3 <- renderValue(input$nr3, input$act30)
    
    value1 <- renderSpecial(value1, input$act11, input$act12)
    value2 <- renderSpecial(value2, input$act21, input$act22)
    value3 <- renderSpecial(value3, input$act31, input$act32)
    
    paste("Your formula is:", value1, input$op1, value2, input$op2, value3)
     })
  
  # Generate a summary of the dataset
  output$result <- renderPrint({
    value1 <- calculateValue(input$nr1, input$act10)
    value2 <- calculateValue(input$nr2, input$act20)
    value3 <- calculateValue(input$nr3, input$act30)

    value1 <- calculateSpecial(value1, input$act11, input$act12)
    value2 <- calculateSpecial(value2, input$act21, input$act22)
    value3 <- calculateSpecial(value3, input$act31, input$act32)

    if (input$op2 =="*" || input$op2 == "/") 
    {
       step1 <- calculate(input$op2, value2, value3)
       step2 <- calculate(input$op1, value1, step1)
    }
    else
    {
      step1 <- calculate(input$op1, value1, value2)
      step2 <- calculate(input$op2, step1, value3)
    }
    
    paste("The result is ", step2)
  })

  calculateValue <- function(input, operation) {
     switch(operation,
            "sqr" = input^2,
            "sqrt" = sqrt(input),
            "cube" = input^3,
            "cbrt" = input^(1/3),
            "none" = input) 
  }
  renderValue <- function(input, operation) {
    switch(operation,
           "sqr" = paste(input,"^2", sep=""),
           "sqrt" = paste(input, "^(1/2)", sep=""),
           "cube" = paste(input,"^3", sep=""),
           "cbrt" = paste(input, "^(1/3)", sep=""),
           "none" = input) 
  }
  
  calculateSpecial <- function(input, operation, value) {
    switch(operation,
           "round" = round(input, value),
           "mod" = input %% value,
           "div" = input %/% value,
           "none" = input) 
  }
  renderSpecial <- function(input, operation, value) {
    switch(operation,
           "round" = paste("round(",input,",", value, ")", sep=""),
           "mod" = paste("(", input,"MOD", value, ")"),
           "div" = paste("(", input, "DIV", value, ")"),
           "none" = input) 
  }
  
  calculate <- function(op, first, second) {
    switch(op,
           "+" = first + second,
           "-" = first - second,
           "*" = first * second,
           "/" = if (second == 0) 0 else first / second)
  }
})
