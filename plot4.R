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

# Figures
png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# Fig 1
plot(hdata$Time, hdata$Global_active_power, type = "n",
     xlab = "", ylab = "Global Active Power (kilowatts)")
lines(hdata$Time, hdata$Global_active_power)

# Fig 2
plot(hdata$Time, hdata$Voltage, type = "n",
     xlab = "datetime", ylab = "Voltage")
lines(hdata$Time, hdata$Voltage)

# Fig 3
plot(hdata$Time, hdata$Sub_metering_1, type = "n",
     xlab = "", ylab = "Energy sub metering")
lines(hdata$Time, hdata$Sub_metering_1, col = "black")
lines(hdata$Time, hdata$Sub_metering_2, col = "red")
lines(hdata$Time, hdata$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1, bty = "n")

# Fig 4help
plot(hdata$Time, hdata$Global_reactive_power, type = "n",
     xlab = "datetime", ylab = "Global_reactive_power")
lines(hdata$Time, hdata$Global_reactive_power)

dev.off()
