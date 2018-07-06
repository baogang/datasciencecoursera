pollutantmean<- function (directory, pollutant, id){
  workpath<-str_c(getwd(), '/', directory, '/')
  filenames <- str_pad(id, 3 , 'left', '0')
  filepaths <- str_c(workpath, filenames, '.csv')
  alldata <- c()
  for(filepath  in filepaths){
    filedata <- read.csv(filepath)
    alldata <- append(alldata, filedata[pollutant][!is.na(filedata[pollutant])])
  }
  mean(alldata)
}
