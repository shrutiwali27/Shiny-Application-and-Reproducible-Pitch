#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Car Stopping Distance Prediction Tool"),
  
  # Sidebar with options selectors 
  sidebarLayout(
    sidebarPanel(
      helpText("This application predicts the distance taken to stop a car based on the speed of the car."),
      h3(helpText("Select:")),
      numericInput("mph", label = h4("Speed (MPH)"), step = 1, value = 25)
      
    ),
    
    # Show a plot with car observations and regression line
    mainPanel(
      plotOutput("resultPlot"),
      h4("Car Speed:"),
      h4(textOutput("resultSpeed")),
      h4("Predicted Stopping Distance:"),
      h4(textOutput("resultDist"))
    )
  )
))