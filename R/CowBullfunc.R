CowBullFunc<-function(num,guess){
  if(any(is.na(guess))){return(NA)}
  checkmat=matrix(guess,nrow=4,ncol=4,byrow = T)==num
  bull=sum(diag(checkmat))
  diag(checkmat)<-rep(F,4)
  cow=sum(colSums(checkmat))

  return(paste0(c(bull,"B",cow,"C"),collapse = " "))
}