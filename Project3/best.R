## Read outcome data
## Check that state and outcome are valid
## Return hospital name in that state with lowest 30-day death
## rate

best <- function(state, outcome) {
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  
  oocm_temp <- subset(oocm, State == state)
  if (nrow(oocm_temp) == 0) {
    stop("invalid state")
  }
  if (outcome %in% valid_outcomes) {
    oocm_var = paste("Hospital.30.Day.Death..Mortality..Rates.from", paste(capitalize(unlist(strsplit(outcome, " "))), collapse='.'), sep=".")
    min_val <- min(oocm_temp[, oocm_var], na.rm=TRUE)
    min_hosp <- oocm_temp[oocm_temp[[oocm_var]] == min_val, "Hospital.Name"]
    as.character(min_hosp[sort.list(min_hosp)[1]])
  } else {
    stop("invalid outcome")
  }
}
