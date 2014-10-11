# This program is to plot the Global Active Power data from 2007-02-01 and 2007-02-02 in a histogram

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

#Plot historgram for Global Active Power data in a png file
png(filename = "plot1.png",width = 480, height = 480)
par(mar = c(6,6,2,4))
hist(feb_data$Global_active_power,main="Global Active Power",
                                  xlab="Global Active Power (kilowatts)",
                                  ylab="Frequency",
                                  col="red")
dev.off()