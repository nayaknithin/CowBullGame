server <- function(input,output,session){

  inputlist<-reactiveValues(guess=character(0),
                            guesscheck=character(0),
                            num=as.character(sample(0:9,4,replace = F))
                            )

  #restart button
  observeEvent(input$restart,{
    inputlist$guess<-character(0)
    inputlist$guesscheck<-character(0)
    inputlist$num<-as.character(sample(0:9,4,replace = F))
  })

  #submit button
  observeEvent(input$submit,{
    inputlist$guess=c(inputlist$guess[!is.na(inputlist$guess)],input$guessnum)
    guessnumC=strsplit(as.character(input$guessnum),"")[[1]]
    inputlist$guesscheck=c(inputlist$guesscheck[!is.na(inputlist$guesscheck)],
                           CowBullFunc(inputlist$num,guessnumC))
    inputlist$scoreframe=data.frame(Guess=inputlist$guess,
                          ...=" ",
                          Bull.Cow=inputlist$guesscheck)

  })


  output$scorecard<-renderPrint({inputlist$scoreframe})
 }
