library(shiny)

shinyUI(fluidPage(
  titlePanel("BMI Calculator"),
  
  sidebarLayout(
    sidebarPanel(
      h3("Enter your details"),
      numericInput("weight", "Weight (kg):", value = 70, min = 1),
      numericInput("height", "Height (m):", value = 1.75, min = 0.5, step = 0.01),
      actionButton("calc", "Calculate BMI")
    ),
    
    mainPanel(
      h3("Results"),
      verbatimTextOutput("bmi_result"),
      textOutput("bmi_category"),
      
      hr(),
      h4("How to Use This App"),
      p("1. Enter your weight in kilograms."),
      p("2. Enter your height in meters."),
      p("3. Click 'Calculate BMI'."),
      p("Your BMI value and health category will appear above.")
    )
  )
))
