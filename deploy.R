install.packages('devtools')
devtools::install_github('rstudio/shinyapps')
shinyapps::setAccountInfo(name='srust55',
                          token='9894E1789A1021A3691821E5DF3F9154',
                          secret='T7t+Ju59sbnxkplJ1ADbdtcuEuCFaYoOnmKhPXnK')
library(shinyapps)
setwd("C:/Users/Steve/Documents/My Folders/Coursera/Data Science/Developing Data Products/CP")
shinyapps::deployApp(appName="GLM_PCA_Classification")
