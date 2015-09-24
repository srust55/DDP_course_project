shinyUI(
    fluidPage(
        # Application title
        titlePanel("Predicting Alzheimer Disease"),
        
        sidebarLayout(
        
            sidebarPanel(
                numericInput('ncomps', '# of Principal Components [1, 2, ... , 50]', 
                             1, min = 1, max = 50, step = 1),
                numericInput('nfolds', '# of Cross-Validation Folds [3, 4, ... , 20]', 
                             3, min = 3, max = 20, step = 1),
                numericInput('nreps', '# of Cross-Validation Repetitions [1, 2, ... , 10]', 
                             1, min = 1, max = 10, step = 1),
                submitButton('Submit')
            ),
            
            mainPanel(
                tabsetPanel(
                    
                    tabPanel("Output",
                        #h3('Results of Cross-Validation Training'),
                        h3('INPUTS'),
                            h4('# of Principal Components'),
                            verbatimTextOutput("input_ncomps"),
                            h4('# of Cross-Validation Folds'),
                            verbatimTextOutput("input_nfolds"),
                            h4('# of Cross-Validation Repetitions'),
                            verbatimTextOutput("input_nreps"),
                            #h4('Which resulted in a cross-validation accuracy of'),
                        h3('CROSS-VALIDATION ACCURACY'),
                        verbatimTextOutput("accuracy")
                    ),
                    
                    tabPanel("Documentation",
                        h4('Functionality'),
                            h5('This application performs repeated k-fold cross-validation (CV) for a GLM classifer '),
                            h5('based on a specified number of principal components.  The AlzheimerDisease data'),
                            h5('from the AppliedPredictiveModeling package is employed and the classifier '),
                            h5('predicts whether or not each patient has Alzheimer disease.'),
                        h4('Instructions'),
                            h5('1. Specify the number of principal components as an integer between 1 and 50 inclusively'),
                            h5('2. Specify the number of CV folds as an integer between 3 and 20 inclusively'),
                            h5('3. Specify the number of times CV is to be repeated as an integer between 1 and 10 inclusively'),
                            h5('4. Click on the "Submit" button'),
                        h4('Results'),
                            h5('The input parameters are echoed and the cross-validation accuracy is reported in the form '),
                            h5('of a proportion.')
                    )
                )
            )
        )
    )
)
