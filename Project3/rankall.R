## Read outcome data
## Check that outcome is valid
## For each state, find the hospital of the given rank
## Return a data frame with the hospital names and the
## (abbreviated) state name

rankall <- function(outcome, num = "best") {
  oocm_split<-split(oocm, oocm$State)
  hosp_list <- lapply(oocm_split, function(x) {
    rankhospital(x$State, outcome, num)
  })
  data.frame(hospital=unlist(hosp_list), state=names(hosp_list))
}