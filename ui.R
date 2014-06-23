shinyUI(pageWithSidebar(
        headerPanel("Welcome to Old Faithful"),
        sidebarPanel(
                numericInput('duration', 
                             'Last Duration (1.5 ~ 3.5 minutes)', 
                             3.5, min = 1.5, max = 6, step = 0.1),
                numericInput('waiting', 
                             'Last Wait Time (40 ~ 100 minutes)', 
                             71, min = 40, max = 100, step = 1),
                sliderInput("waitSL", "Last Waiting Interval (minutes)", 
                            value = 70, min = 40, max = 100, step = 1)
        ),
        mainPanel(
                h3("You have to wait (minutes): "),
                verbatimTextOutput("wait"),
                h3("Next Eruption Duration (minutes): "),
                verbatimTextOutput("duration"),
                h3("Interactive Eruption Graph"),
                plotOutput("newFit")
        )
))