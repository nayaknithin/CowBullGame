#This function checks if there is repetition in the number input by the user.
#Returns NA if there is repetition

RepCheckFunc=function(numc){
  test=0;
 for (i in 1:length(numc)) {
   if(any(numc[-i]==numc[i])){test=test+1}
   };
  if(test){return(NA)}else{return(numc)}
}