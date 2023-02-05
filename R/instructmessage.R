InstructMessage=function(input){ if(any(is.na(input))){paste0("The input number dosent comply with the instructions given:\n 1) The number must be 4 digit or 3 digit (if you want 0 in the first place say 0123 can be given as 123).\n 2) There should not be any alphabets or symbols in the number input.\n 3) The digits in the input number should be unique (e.g. 1214 not allowed as 1 is repeating).\n")}else{NA}

}
