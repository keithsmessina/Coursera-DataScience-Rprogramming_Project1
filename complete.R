complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        rawdata <- vector("list", length(id))
        returnvector <- data.frame(id=c(id))
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
            filepath <- paste(directory,"/",filename,sep="")   
            rawdata[[i]] <- read.csv(filepath)
            returnvector$nobs[[i]] <- sum(as.numeric(complete.cases(rawdata[[i]])))
        }
        return(returnvector)
}

