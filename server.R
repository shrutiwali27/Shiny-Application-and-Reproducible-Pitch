#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(datasets)

# Server code  to draw a scatterplot
shinyServer(function(input, output) {
  output$resultPlot <- renderPlot({
    
    # run linear regression model
    modfit <- lm(dist ~ speed, data = cars)
    # predict the stopping distance
    modpred <- predict(modfit, newdata = data.frame(speed = input$mph))
    
    # Draw the scatterplot using ggplot2
    plot <- ggplot(data=cars, aes(x=speed, y = dist))+
      geom_point(aes(color = speed), alpha = 0.5)+
      geom_smooth(method = "lm")+
      geom_vline(xintercept = input$mph, color = "red")+
      geom_hline(yintercept = modpred, color = "purple") +
      xlab("Speed (MPH)")+
      ylab("Distance (Feet)")+
      ggtitle("Car Stopping Distance vs Speed and Regression Line")
    
    plot
    
  })
  output$resultSpeed <- renderText({                        
    
    res1 <- paste( input$mph," MPH")
    res1
    
  })
  output$resultDist <- renderText({
    # run linear regression model
    modfit <- lm(data = cars, dist ~ speed)
    # predict the stopping distance
    modpred <- predict(modfit, newdata = data.frame(speed = input$mph))
    res2 <- paste(round(modpred, digits = 2), "FT")
    res2
  })
  
})
