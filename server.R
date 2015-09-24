#Execute preliminaries
library(shiny)
library(caret)
library(AppliedPredictiveModeling)
library(e1071)
data(AlzheimerDisease)
predictors <- predictors[,-130]
predictors$Betacellulin <- as.numeric(predictors$Betacellulin)
predictors$Eotaxin_3 <- as.numeric(predictors$Eotaxin_3)

#Define function to calculate the CV accuracy
cv.accuracy <- function(ncomps, nfolds, nreps) {
    PreProcAlg <- preProcess(predictors, method="pca", pcaComp=ncomps)
    train.PCs <- predict(PreProcAlg, predictors)
    fitControl <- trainControl(method = "repeatedcv", number = nfolds, repeats = nreps)
    trained.model <- train(diagnosis ~ ., method="glm", trControl = fitControl, data=train.PCs)
    cv.accuracy <- round(mean(trained.model$resample$Accuracy),digits=3)
    return(cv.accuracy)
}

#Shiny server
shinyServer(
    function(input, output) {
        output$input_ncomps <- renderPrint({input$ncomps})
        output$input_nfolds <- renderPrint({input$nfolds})
        output$input_nreps  <- renderPrint({input$nreps })
        output$accuracy     <- renderPrint({cv.accuracy(input$ncomps,input$nfolds,input$nreps)})
    }
)