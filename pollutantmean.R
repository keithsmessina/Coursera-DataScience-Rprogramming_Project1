pollutantmean <- function(directory, pollutant, id = 1:332) {
        filepath <- vector("list", length(id))
        for(i in 1:length(id)){
            if(i < 10){
                filename <- paste("00",i,".csv",sep="")
            }
            else if(i >= 10 && i < 100) {
                filename <- paste("0",i,".csv",sep="")
            }
            else {
                filename <- paste(i,".csv",sep="")
            }
            filepath[[i]] <- paste(directory,"/",filename,sep="")       
        }
        rawdata <- do.call("rbind", lapply(filepath, read.csv, header = TRUE))
        colMeans(rawdata[c(pollutant)], na.rm=TRUE)
}
