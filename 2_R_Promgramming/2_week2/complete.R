complete <- function(directory, id = 1:332){
  workpath<-str_c(getwd(), '/', directory, '/')
  filenames <- str_pad(id, 3 , 'left', '0')
  filepaths <- str_c(workpath, filenames, '.csv')
  nobs <- c()
  for(filepath  in filepaths){
    filedata <- read.csv(filepath)
    cnt <- nrow(filedata[!is.na(filedata[2]) & !is.na(filedata[1]), ])
    nobs <- append(nobs, cnt)
  }
  data.frame(id, nobs)
}