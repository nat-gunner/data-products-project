library(shiny)
shinyUI(navbarPage("Iris Classification Wizard",
    tabPanel("Documentation",
             mainPanel(
                     p("This app will help you determine the species of an iris based on measurements of the Petal Length and Petal Width.  Simply put a value into the fields for Petal Length and Petal Width, press the 'Go!' button, and the app will tell you what species the iris belongs to.  It will also disply the probabilities for each species according to the model."),
                     p("The app is able to determine the species by comparing the inputs to a prediction model based on the iris dataset in R.  The model creates a categorization tree that is able to determine the species based on Petal Length and Width.")
                     )
                 ),
    tabPanel("Wizard",
    sidebarLayout(
    sidebarPanel(
        h3('Instructions'),
        p('Please provide the Petal Length and Petal Width of your iris.  The wizard will then determine what species your iris belongs to!'),
        numericInput('length', 'Petal Length', 0, min=0, step=.1),
        numericInput('width', 'Petal Width', 0, min=0, step=.1),
        actionButton('Submit', "Go!")
        ),
    mainPanel(
        h4('For Petal Length, you entered:'),
        verbatimTextOutput("input1"),
        h4('For Petal Width, you entered:'),
        verbatimTextOutput("input2"),
        h3('Your iris is of species:'),
        verbatimTextOutput("species"),
        h4('Explanation'),
        verbatimTextOutput("explanation"),
        verbatimTextOutput("calculation")
        ## plotOutput('tree')
        ))
)
    )
)