corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  vcor <- vector()
  files <- list.files(directory)
  for (f in files) {
    #Read csv into df
    df <- read.csv(paste(directory, f, sep="/"), header=TRUE, na.strings="NA")
    #Remove columns with at least one NA value and calculate number of rows
    df <- df[complete.cases(df), ]
    nobs <- nrow(df) 
    if (nobs>=threshold) {
      vcor <- append(vcor, cor(df$sulfate, df$nitrate))
    }
  }
  return (vcor)
}

#corr("specdata", 0)
