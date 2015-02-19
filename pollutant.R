pollutantmean<-function(directory,pollutant,id=1:332){
  org_dirs<-getwd()
  dirs<-paste(getwd(),directory,sep="/")
  setwd(dirs)   
  files<-dir()
  data<-data.frame()
  for(i in id)
  {
    data<-rbind(data,read.csv(files[i]))
  }
  mean<-mean(data[,pollutant],na.rm=TRUE)
  setwd(org_dirs)
  mean
}
