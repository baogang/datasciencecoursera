corr<-function(directory, threshold = 0){
  completed<-complete(directory, 1: 331)
  result <- completed[completed[2] > threshold,]
  ids <- result[,1]
  print(length(ids))
  if(length(ids) > 0){
    workpath<-str_c(getwd(), '/', directory, '/')
    filenames <- str_pad(ids, 3 , 'left', '0')
    filepaths <- str_c(workpath, filenames, '.csv')
    
    alldata <- c()
    for(filepath in filepaths){
      filedata <- read.csv(filepath)
      filtereddata <- filedata[!is.na(filedata[2]) & !is.na(filedata[3]), ]
      scor <- cor(filtereddata[2], filtereddata[3])
      alldata <- append(alldata, scor)
    }
    alldata
  }else {
    numeric(0)
  }
}