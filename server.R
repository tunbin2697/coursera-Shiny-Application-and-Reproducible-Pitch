library(shiny)

shinyServer(function(input, output) {
  
  bmi_calc <- eventReactive(input$calc, {
    req(input$weight, input$height)
    bmi <- input$weight / (input$height ^ 2)
    return(round(bmi, 2))
  })
  
  output$bmi_result <- renderText({
    bmi <- bmi_calc()
    paste("Your BMI is:", bmi)
  })
  
  output$bmi_category <- renderText({
    bmi <- bmi_calc()
    category <- ifelse(bmi < 18.5, "Underweight",
                       ifelse(bmi < 24.9, "Normal weight",
                              ifelse(bmi < 29.9, "Overweight", "Obese")))
    paste("Category:", category)
  })
  
})
