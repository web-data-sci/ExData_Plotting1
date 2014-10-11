# This program is to plot the Sub metering data from 2007-02-01 and 2007-02-02 as a line chart

# Download the data file in a current working directory
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
data_file <- "household_power_consumption"
download.file(url, data_file, method = "auto")

#Unzip the data file in a current working directory
unzip(data_file)

#Read entire data file in a data frame (complete_data)
complete_data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)

#Filter complete_data data frame and get data from 2007-02-01 and 2007-02-02 only. (feb_data)
complete_data$Date <- as.Date(complete_data$Date, format="%d/%m/%Y")
feb_data <- subset(complete_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Combine Date and Time into a new column (Date_Time) and add a new column to the data frame feb_data.
# This column is used for x-axis of a chart
Date_Time <- paste(as.Date(feb_data$Date), feb_data$Time)
feb_data$Date_Time <- as.POSIXct(Date_Time)

#Plot a line chart for 3 sub metering data in a png file
png(filename = "plot3.png",width = 480, height = 480)
par(mar = c(6,6,2,4))
plot(feb_data$Date_Time,feb_data$Sub_metering_1,type="n",
     ylab="Energy sub metering",xlab="")
points(feb_data$Date_Time,feb_data$Sub_metering_1,col="black",type="l")
points(feb_data$Date_Time,feb_data$Sub_metering_2,col="red",type="l")
points(feb_data$Date_Time,feb_data$Sub_metering_3,col="blue",type="l")
legend("topright",lty=1,lwd=1,col=c("black","red","blue"),cex=0.8,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()