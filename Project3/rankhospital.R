## Read outcome data
## Check that state and outcome are valid
## Return hospital name in that state with the given rank
## 30-day death rate

rankhospital <- function(state, outcome, num = "best") {
  library(R.utils) #capitalize
  library(dplyr) #arrange
  
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  
  oocm_temp <- subset(oocm, State == state)
  if (nrow(oocm_temp) == 0)
    stop("invalid state")
  
  if (!(outcome %in% valid_outcomes)) 
    stop("invalid outcome")
    
  if (!(is.numeric(num) | num %in% c("worst", "best"))) 
    stop("invalid num")

  oocm_var = paste("Hospital.30.Day.Death..Mortality..Rates.from", paste(capitalize(unlist(strsplit(outcome, " "))), collapse='.'), sep=".")
  
  if (num == "worst") {
    val <- max(oocm_temp[, oocm_var], na.rm=TRUE)
    hosp <- oocm_temp[oocm_temp[[oocm_var]] == val, "Hospital.Name"]
    as.character(hosp[sort.list(hosp)[1]])   
  } else if (num == "best") {
    val <- min(oocm_temp[, oocm_var], na.rm=TRUE)
    min_hosp <- oocm_temp[oocm_temp[[oocm_var]] == val, "Hospital.Name"]
    as.character(min_hosp[sort.list(min_hosp)[1]])
  } else {
    as.character(arrange(oocm_temp, oocm_temp[[oocm_var]], Hospital.Name)$Hospital.Name[num])
  }
}