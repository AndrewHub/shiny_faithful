# Load required packages and data
library(shiny)
library(caret)
data(faithful)

# Split faithful data into training and testing data based on outcomes

# Fit linear model1 -- eruption time prediction
inTrain <- createDataPartition(y = faithful$eruptions, 
                               p = 0.75, list = F)
training1 <- faithful[inTrain, ]
testing1 <- faithful[-inTrain, ]

modFit_wait <- train(waiting ~ eruptions, data = training1, method = "lm", 
                trControl = trainControl(method = "cv"))

# Fit linear model2 -- waiting time prediction
inTrain <- createDataPartition(y = faithful$waiting, 
                               p = 0.75, list = F)
training2 <- faithful[inTrain, ]
testing2 <- faithful[-inTrain, ]

modFit_erupt <- train(eruptions ~ waiting, data = training2, method = "lm", 
                     trControl = trainControl(method = "cv"))

# For plotting use only
lmFit <- lm(eruptions ~ waiting, data = training2)
waitsl <- function(x) {
        predict(lmFit, newdata = data.frame(waiting = x))
}
# Create prediction functions to be used in shinyServer function
waiting <- function(x) {       
        predict(modFit_wait, newdata = data.frame(eruptions = x))
}

durating <- function(x) {       
        predict(modFit_erupt, newdata = data.frame(waiting = x))
}

# shinyServer function
shinyServer(function(input, output) {
        
        # You have to wait (minutes):
        output$wait <- renderPrint({round(waiting(input$duration), 2)})
        
        # Next Eruption Duration (minutes):
        output$duration <- renderPrint({round(durating(input$waiting), 2)})
        
        # Interactive Eruption Graph
        output$newFit <- renderPlot({
                
                plot(training1$waiting, training1$eruptions, 
                     pch = 19, cex = 0.5, col = "lightblue", 
                     xlab = "Waiting Time (min)",
                     ylab = "Eruption Duration (min)",
                     main = "Duration ~ Waiting Time")
                
                lines(training2$waiting, lmFit$fitted, 
                      lwd = 2, col = "lightgreen")
                
                wait <- input$waitSL
                
                points(wait, waitsl(wait), col = "red", pch = 19)
                
                lines(c(wait, wait), c(0, waitsl(wait)), 
                      col = "red", type = "o", pch=22, lty=2)
                
                abline(h = waitsl(wait), 
                       col = "red", pch=22, lty=2)
        })
})

