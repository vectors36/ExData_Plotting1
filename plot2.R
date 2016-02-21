#File URL = https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#Source file name = household_power_consumption.txt

#load dataset into R
loadData <- function(){
    #source file in working directory
    filePath <- "household_power_consumption.txt"
    df <- read.table(filePath, header=TRUE,na="?", sep=";")
    #convert date time formats
    df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
    df$Date <- as.Date(df$Date, "%d/%m/%Y")
    #filter to only dates required
    dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    df <- subset(df, Date %in% dates)
    return(df)
}

plot2 <- function(data=NULL) {
    if(is.null(data))
        data <- loadData()
    
    png("plot2.png", width=480, height=480)
    
    plot(data$Time, data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
    
    dev.off() #close the png output device
}