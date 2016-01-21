
##WEEK1 Assignment: Course Project 1
#https://github.com/sarahnatacha/ExData_Plotting1
#Plot4

library(dplyr)

# Download file
downloadedFile <-"./data/power_data.zip"

if (!file.exists("./data/household_power_consumption.txt")) {
    download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile=downloadedFile)
    unzip(downloadedFile, overwrite = T, exdir = "./data")
    file.remove(downloadedFile)
}

#Reads and Subsets the data to data in February
datafile <- "./data/household_power_consumption.txt"
data <- read.csv(datafile, sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?") 
data_feb <- filter(tbl_df(data),Date %in% c("1/2/2007","2/2/2007")) 
data_feb$Datetime <- strptime(paste(data_feb$Date, data_feb$Time), "%d/%m/%Y %H:%M:%S")

#creates the plot
png("plot4.png",width=480,height=480)

par(mfrow = c(2, 2))

#Plot 1-NW
plot(data_feb$Datetime, data_feb$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
#Plot 2-NE
plot(data_feb$Datetime, data_feb$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

#Plot 3-SW
plot(data_feb$Datetime, data_feb$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering",col="black")
points(data_feb$Datetime, data_feb$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
points(data_feb$Datetime, data_feb$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

#Plot 4-SE
plot(data_feb$Datetime, data_feb$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", ylim = c(0, 0.5))

dev.off()

