library(shiny)
library(readxl)
homiciderates <- read_excel("Homicide Rates vs Election Results.xlsx", 
                              col_types = c("text", "text", "numeric", 
                              "numeric", "skip", "skip", "skip", 
                              "skip", "skip", "skip", "skip"), 
                              skip = 1)
fluidPage(
     titlePanel("2019 Homicide Rates compared to 2020 Electoral Vote Allocation"),
     
                ##Generate a row with a sidebar
                sidebarLayout(      
                         sidebarPanel(p(strong("Documentation:",style="color:red"), 
                                a("User Help Page",href="https://rpubs.com/TheMonk/homiciderates")),
                                selectInput("instate", "Select a State to see combined data from two sources, 
                                        CDC and National Archives", choices = homiciderates$STATE)
                            ),
                      
        ## Create a table output
        mainPanel(
            tableOutput("ratetable"),
            h5 ("2019 Average National Homicide Rate: 6.16% per 100,000")
        )
                )    
)
        

