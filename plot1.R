
##WEEK1 Assignment: Course Project 1
#https://github.com/sarahnatacha/ExData_Plotting1
#Plot1

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

#creates the plot
png("plot1.png",width=480,height=480)
hist(data_feb$Global_active_power, main = "Global Active Power", ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13, ylim = c(0, 
1200), xlim = c(0, 6), xaxp = c(0, 6, 3))
dev.off()

