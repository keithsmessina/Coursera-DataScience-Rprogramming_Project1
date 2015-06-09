pollutantmean <- function(directory, pollutant, id = 1:332) {        
        data <- for(i in id){
            if(i < 10){
                filename <- paste("00",i,".csv",sep="")
            }
            else if(i >= 10 && i < 100) {
                filename <- paste("0",i,".csv",sep="")
            }
            else {
                filename <- paste(i,".csv",sep="")
            }
            filepath <- paste(directory,"/",filename,sep="")                     
        }
        mean(adata$pollutant), na.rm=TRUE)
}

