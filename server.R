#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
filename = "quest.txt"
if (!file.exists(filename)){
        write.csv(x = list(value = integer()), file = filename)
}

shinyServer(function(input, output) {
        
        values <- reactive({
                r <- read.csv(filename)
                values <- c(r$value, input$grade)
                write.csv(x = list(value = values), file = filename)
                
                values
        })
        
        output$gradePlot <- renderPlot({
                # generate bins based on input$bins from ui.R
                data <- values()
                plot(x = 1:length(data),y = data, type="l")
        })
})
