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

plot4 <- function(data=NULL) {
    if(is.null(data))
        #call to load the dataframe function
        data <- loadData()
    
    png("plot4.png", width=480, height=480)
    #plot frame setup
    par(mfrow=c(2,2))
    # Call plots and lines in sequence for all four plots
    plot(data$Time, data$Global_active_power,type="l",xlab="",ylab="Global Active Power")
    plot(data$Time, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
    plot(data$Time, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
        lines(data$Time, data$Sub_metering_2, col="red")
        lines(data$Time, data$Sub_metering_3, col="blue")
        legend("topright",col=c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1)	
    plot(data$Time, data$Global_reactive_power, type="n",xlab="datetime", ylab="Global_reactive_power")
        lines(data$Time, data$Global_reactive_power)
    
    dev.off() #close the png output device
    
}