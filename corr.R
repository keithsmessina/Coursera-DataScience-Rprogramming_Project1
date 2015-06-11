corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!

    testThreshold <- function(file, threshold){
        readFile <- na.omit(read.csv(file))
        if(threshold <= nrow(readFile)) addFile <- cor(readFile$nitrate, readFile$sulfate)
    }
    readingVector <- na.omit(as.numeric(do.call("rbind", lapply(list.files(directory, full.names=TRUE),testThreshold, threshold=threshold))))
}
