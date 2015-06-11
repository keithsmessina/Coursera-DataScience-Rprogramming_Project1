pollutantmean <- function(directory, pollutant, id = 1:332) {
        filepath <- vector("list", length(id))
        for(i in 1:length(id)){
            if(id[i] < 10){
                filename <- paste("00",id[i],".csv",sep="")
            }
            else if(id[i] >= 10 && id[i] < 100) {
                filename <- paste("0",id[i],".csv",sep="")
            }
            else {
                filename <- paste(id[i],".csv",sep="")
            }
            filepath[[i]] <- paste(directory,"/",filename,sep="")       
        }
        rawdata <- do.call("rbind", lapply(filepath, read.csv, header = TRUE))
        as.numeric(colMeans(rawdata[c(pollutant)], na.rm=TRUE))
}
