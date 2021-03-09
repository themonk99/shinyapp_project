library(shiny)
library(readxl)
homiciderates <- read_excel("Homicide Rates vs Election Results.xlsx", 
                            col_types = c("text", "text", "numeric", 
                                          "numeric", "skip", "skip", "skip", 
                                          "skip", "skip", "skip", "skip"), 
                            skip = 1)

# Define a server for the Shiny app
server <- function(input, output) {
    
    # populate the area created for the reactive table
    output$ratetable <- renderTable({
        
        # Render a reactive table
        stateFilter <- subset(homiciderates, homiciderates$STATE == input$instate) 
    })
}

