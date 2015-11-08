# Load data
DATES = c("1/2/2007", "2/2/2007")

readData <- function(fileName) {
    hdata <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?")
    hdata <- subset(hdata, hdata$Date %in% DATES)
    hdata$Time <- strptime(paste(hdata$Date, hdata$Time), format = "%d/%m/%Y %H:%M:%S")
    hdata$Date <- NULL
    hdata
}

hdata <- readData("household_power_consumption.txt")

# Figure
png(file = "plot3.png", width = 480, height = 480)

plot(hdata$Time, hdata$Sub_metering_1, type = "n",
     xlab = "", ylab = "Energy sub metering")
lines(hdata$Time, hdata$Sub_metering_1, col = "black")
lines(hdata$Time, hdata$Sub_metering_2, col = "red")
lines(hdata$Time, hdata$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

dev.off()
