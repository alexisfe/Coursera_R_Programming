complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  df2 = data.frame(id=numeric(), nobs=numeric())
  for (i in id) {
    #Read csv into df
    df <- read.csv(paste(directory, paste(sprintf("%03d", i), "csv", sep="."), sep="/"), header=TRUE, na.strings="NA")
    #Remove columns with at least one NA value and calculate number of rows
    nobs <- nrow(df[complete.cases(df), ]) 
    #Append to df2 csv id and number of complete rows
    df2[nrow(df2)+1, ] <- c(i, nobs)
  }
  return (df2)
}