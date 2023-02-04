ui <- fluidPage(
sidebarPanel("CowBullGame",
             numericInput("guessnum","Input your 4 digit guess:",val=NA),
             actionButton("submit","Submit"),
             actionButton("restart","Restart")
             ),
mainPanel("Score Tab",
          verbatimTextOutput("scorecard")
          )

 )
