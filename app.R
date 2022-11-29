library(shiny)

# Define UI for the appearance of the app
ui <- fluidPage(
    h1("Word sucks, shiny better"),


    strong("by Minh-Anh Huynh"),
    # You can add text to the webpage

    # Think of input and output as lists
    textInput(
        inputId = "name",
        label = "Enter your shameful name",
        value = "Minh-Anh"
    ),


    numericInput(
        inputId = "hours",
        label = "How many hours procrastinated?",
        value = 9001,
        min = 0
    ),


    # Application title
    titlePanel("Your procrastination level is (probably) over NINE THOUSAND"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(sidebarPanel(
        sliderInput(
            "Time",
            "Number of procrastination:",
            min = 1,
            max = 9001,
            value = 8999
        )
    )),

    # Show a plot of the generated distribution
    mainPanel(textOutput(outputId = "hours")),

    # Build output in the server
    server <- function(input, output) {
        # Each output needs to be in a render function
        # Each variable needs to be in a output variable
        output$pro_plot <- renderPlot({
            x <- faithful[, 2]
            bins <- seq(min(x), max(x), length.out = input$bins + 1)

            # draw the histogram with the specified number of bins
            hist(
                x,
                breaks = bins,
                col = "darkgray",
                border = "white",
                xlab = "Waiting time to next eruption (in mins)",
                main = "Histogram of waiting times"
            )
        })

        observe({
            print(input$name)
            print(input$hours)
        })
    }



    # Run the application
    shinyApp(ui = ui, server = server)
