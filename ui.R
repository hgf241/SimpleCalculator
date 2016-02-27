
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
 
  titlePanel("A simple calculator"),
  "",
  
  #selectVector <- c("n/a"="none", "square" = "sqr", "square root" = "sqrt", "cube" = "cube", "cube root" = "cbrt"),
  #opVector <- c("+" = "+", "-" = "-", "*" = "*", "/" = "/"),
  
  fluidRow(
      column(2, numericInput("nr1", "Numbers to Calculate", 1, min=1)),
      column(2, selectInput("act10", "Additional Operations", 
                           c("n/a"="none", "square" = "sqr", "square root" = "sqrt", "cube" = "cube", "cube root" = "cbrt"))),
      column(2, selectInput("act11", "Special Operations", 
                            c("n/a"="none", "round" = "round", "DIV" = "div", "MOD" = "mod"))),
      column(2, numericInput("act12", "Numbers for special op", 0, min=0
                             ))
      
    ),
  fluidRow(
      column(2, selectInput("op1", NULL, width= '50%', c("+" = "+", "-" = "-", "*" = "*", "/" = "/")))
    ),
  fluidRow(
      column(2, numericInput("nr2", NULL, 2, min=1)),
      column(2, selectInput("act20", NULL, 
                            c("n/a"="none", "square" = "sqr", "square root" = "sqrt", "cube" = "cube", "cube root" = "cbrt"))),
      column(2, selectInput("act21", NULL,
                            c("n/a"="none", "round" = "round", "DIV" = "div", "MOD" = "mod"))),
      column(2, numericInput("act22", NULL, 0, min=0))
  ),
  fluidRow(
      column(2, selectInput("op2", NULL, width= '50%', c("+" = "+", "-" = "-", "*" = "*", "/" = "/")))
    ),
  fluidRow(
      column(2, numericInput("nr3", NULL, 3, min=1)),
      column(2, selectInput("act30", NULL, 
                            c("n/a"="none", "square" = "sqr", "square root" = "sqrt", "cube" = "cube", "cube root" = "cbrt"))),
      column(2, selectInput("act31", NULL, 
                            c("n/a"="none", "round" = "round", "DIV" = "div", "MOD" = "mod"))),
      column(2, numericInput("act32", NULL, 0, min=0))
  ),
  fluidRow(
    column(2, helpText("Enter 3 numbers and choose the operations.")),
    column(2, helpText("You can choose an operation for each of the number. It will be applied before the normal operations.")),
    column(2, helpText("You can apply a second special operation. This will be applied after the first additional operations.")),
    column(2, helpText("For the special operations you need a value. This value should given here."))
    ),

  h4("Formula"),
  verbatimTextOutput("formula"), 
    
  #h4("Steps"),
  #verbatimTextOutput("steps"),
  
  h4("Result"),
  verbatimTextOutput("result")
    
))