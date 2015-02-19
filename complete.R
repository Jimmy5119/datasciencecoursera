complete <- function(directory,id) {
  org_dirs<-getwd()
  dirs<-paste(getwd(),directory,sep="/")
  setwd(dirs)  
  nm <- c("ID", "nobs")
  df <- as.data.frame(matrix(nrow = 0, ncol = 2,dimnames = list(NULL, nm)))
  filenames <- paste(sprintf("%03d", id), ".csv", sep="")
  for (file in filenames){
    nm <- c("ID", "nobs")
    tempdf <- as.data.frame(matrix(nrow = 0, ncol = 2,dimnames = list(NULL, nm)))
    tempdata <- read.csv(file)
    lastrow <- tail(tempdata, 1)
    rowcount <- nrow(na.omit(tempdata))
    id <- lastrow$ID
    tempdf <- cbind(ID=id, nobs=rowcount)
    df <- rbind(df, tempdf)
    rm(tempdata)
    rm(rowcount)
    rm(id)
    rm(tempdf)
  }
  setwd(org_dirs)
  print(df)
}
