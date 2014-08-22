library(shiny)
data(iris)
library(rpart)
modFit <- rpart(Species ~ Petal.Length + Petal.Width , data=iris)

shinyServer(
    function(input, output) {
        ## newdata <- data.frame(Petal.Length=input$length,Petal.Width=input$width)
       
        output$input1 <- renderPrint({
            input$Submit
            if (input$Submit == 0)
            return(print("Waiting for input..."))
            iso <- isolate(input$length)
            iso
            })
        output$input2 <- renderPrint({
            input$Submit
            if (input$Submit == 0)
                return(print("Waiting for input..."))
            iso2 <- isolate(input$width)
            iso2
            })
        output$species <- renderPrint({
            input$Submit
            if (input$Submit == 0)
                return(print("Waiting for input..."))
            iso3 <- isolate(input$length)
            iso4 <- isolate(input$width)
            newdata <- data.frame(Petal.Length=iso3,Petal.Width=iso4)
            if (predict(modFit, newdata=newdata)[1] > .8 ){
                return(c("setosa"))
            }
            else if (predict(modFit, newdata=newdata)[2] > .8 ){
                return(c("versicolor"))
            }
            else {
                return(c("virginica"))
            }
            })
        output$explanation <- renderPrint({
            if (input$Submit == 0)
                return(c("Waiting for input..."))
            iso5 <- isolate(input$length)
            iso6 <- isolate(input$width)
            newdata2 <- data.frame(Petal.Length=iso5,Petal.Width=iso6)
            if (predict(modFit, newdata=newdata2)[1] > .8 ){
                return(c("Since your Petal Length is less than 2.5, the model suggests that the iris is of species setosa."))
            }
            else if (predict(modFit, newdata=newdata2)[2] > .8 ){
                return(c("Since your Petal Length is greater than 2.5 and your Petal Width is less than 1.8, the model suggests that the iris is of species versicolor."))
            }
            else {
                return(c("Since your Petal Length is greater than 2.5 and your Petal Width is greater than 1.8, the model suggests that the iris is of species virginica."))
            }
            
            
            })
        
        output$calculation <- renderPrint({
            if (input$Submit == 0)
                return(c("Waiting for input..."))
            iso7 <- isolate(input$length)
            iso8 <- isolate(input$width)
            newdata2 <- data.frame(Petal.Length=iso7,Petal.Width=iso8)
            predict(modFit, newdata=newdata2)
        })
        
       ## output$tree <- renderPlot({
        ##    if (input$Submit == 0)
          ##      return()
            ## fancyRpartPlot(modFit)
        ## })
        
    }
)
