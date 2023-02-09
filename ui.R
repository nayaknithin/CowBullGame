# UI for the game
ui <- fluidPage(theme=shinytheme("darkly"),
tabsetPanel(tabPanel("Wiki",uiOutput("wikiUI")),
tabPanel("Click here to play the Game",
sidebarPanel(h2("CowBullGame"),
             numericInput("guessnum","Input your 4 digit guess:",val=NA),
             actionButton("submit","Submit"),
             actionButton("restart","New Game"),
             actionButton("quit","I Give up!")
             ),
mainPanel(
          h1("Score Tab"),
          uiOutput("instructmessage"),
          tableOutput("scorecard"),
          verbatimTextOutput("winmessage")
          )
))
 )