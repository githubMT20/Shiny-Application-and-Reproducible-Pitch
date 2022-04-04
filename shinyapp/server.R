library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
  output$table <- renderDataTable({
    hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 1)
    data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg, 
                      GasolineCost = round(input$dis/mpg*input$cost,2),
                      Cylinders = cyl, Displacement = disp, Horsepower = hp, 
                      Transmission = am)
    data <- filter(data, Cylinders %in% input$cyl, 
                    Horsepower %in% hp_seq, Transmission %in% input$am)
    data <- mutate(data, Transmission = ifelse(Transmission==1,  "Manual", "Automatic"))
    data <- arrange(data, GasolineCost)
    data
  }, options = list(lengthMenu = c(5, 15, 30), pageLength = 15))
})



