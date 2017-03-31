library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Questionnaire"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       "Please grade this Shiny app with a number between 1 and 32.",
            sliderInput("grade",
                   "Grade for this Shiny app:",
                   min = 1,
                   max = 32,
                   value = 12),
       submitButton("Submit grade")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        "History of submitted grades:",
        plotOutput("gradePlot")
    )
  )
))
