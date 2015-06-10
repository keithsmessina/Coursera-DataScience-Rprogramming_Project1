pollutantmean <- function(directory, pollutant, id = 1:332) {
        filepath <- vector("list", length(id))
        for(i in id){
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
        print(rawdata)
        mean(rawdata[c(pollutant)], na.rm=TRUE)
}
