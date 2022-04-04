library(markdown) 
shinyUI(navbarPage("Compare Car Gas Cost For Your Trip", 
                   tabPanel("Home", 
                            
                            sidebarLayout( 
                              sidebarPanel( 
                                helpText("Provide your trip detail and preferences on cars:"), 
                                numericInput('dis', 'Distance (in miles):', 50, min = 1, max = 10000), 
                                numericInput('cost', 'Gasoline Price (per gallon):', 4.35, min = 1, max = 10, step=0.01), 
                                checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)), 
                                sliderInput('hp', 'Gross horsepower', min=100, max=340, value=c(50,340), step=10), 
                                checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1)) 
                              ), 
                              mainPanel( 
                                dataTableOutput('table') 
                              ) 
                            ) 
                   )
                   
                   
) )
                    



