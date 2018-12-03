setwd("/Users/ankitchaudhary/Documents/IS_Sem1/DataAnalytics_with_R/week_5/")

homicides <- readLines("homicides.txt")
homicides %>% head

cause_count<-function(cause= NULL) {
possible_causes = c('asphyxiation', 'Asphyxiation', 'blunt force', 'Blunt force', 'other', 'Other', 'shooting', 
                      'Shooting', 'stabbing', 'Stabbing', 'unknown','Unknown')
  if (is.null(cause) == TRUE) {
    stop('Please provide a cause')
  }
  if ((cause %in% possible_causes) == FALSE) {
  stop('Invalid cause')
  }

  a = substr(cause, 1,1)
  
  upper_a = capitalize(a)
  lower_a = tolower(a)
  rest = substr(cause,2,nchar(cause))
  cause_new = paste('[',upper_a,lower_a,']',rest, sep = '')
  con <- paste("<dd>[Cc]ause:",cause_new)
  val = length(grep(con, homicides))
  return (val)
}
cause_count("shooting")



###############################################################
#Part2

age_count<-function(age= NULL) {
  if (is.null(age) == TRUE) {
    stop('Please provide an age for count')
  }
 age_con <- paste("Age:",age, "years old")
 val = length(grep(age_con, homicides))
 return(val)
 num <- age_count(val)
}
age_count(0)
