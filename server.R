server <- function(input,output,session){

  inputlist<-reactiveValues(guess=character(0),
                            guesscheck=NA,
                            ntrials=character(0),quit=FALSE,
                            num=as.character(sample(0:9,4,replace = F))
                            )

  #restart button
  observeEvent(input$restart,{
    inputlist$guess<-character(0)
    inputlist$guesscheck<-NA
    inputlist$num<-as.character(sample(0:9,4,replace = F))
    inputlist$ntrials=character(0);inputlist$ntrials_quit=1
    inputlist$scoreframe=data.frame(Guess=" ",...=" ",Bull.Cow=" ")
  })

  #submit button
  observeEvent(input$submit,{
    guessnumC=strsplit(as.character(input$guessnum),"")[[1]]
    if(length(guessnumC)==3){guessnumC=c("0",guessnumC)}
    if(length(guessnumC)<3){guessnumC=NA}
    if(length(guessnumC)>4){guessnumC=guessnumC[1:4]}
    if(any(is.na(guessnumC))){pasteguessnumC=NA}else{
      pasteguessnumC=paste0(guessnumC,collapse = "")}
    inputlist$guess=c(inputlist$guess[!is.na(inputlist$guess)],pasteguessnumC)
    inputlist$guesscheck=c(inputlist$guesscheck[!is.na(inputlist$guesscheck)],
                           CowBullFunc(inputlist$num,guessnumC))
    inputlist$ntrials=length(inputlist$guess)
    inputlist$scoreframe=data.frame(Guess=inputlist$guess,
                          ...=" ",
                          Bull.Cow=inputlist$guesscheck)

  })

  #GiveUp
  observeEvent(input$quit,{inputlist$quit=T})

  output$scorecard<-renderTable({inputlist$scoreframe})
  output$winmessage<-renderPrint({
    if(!any(is.na(inputlist$guesscheck))){
    if(inputlist$guesscheck[length(inputlist$guesscheck)]=="4 B 0 C"){
      cat("You Win!! \n
                        No. of Trials = ",inputlist$ntrials,"\n")
    }}
      if(inputlist$quit){
        cat("You Didn't Complete the game \n",
            "You Quitted after trying ",inputlist$ntrials," times\n")
    }
  })


 }
