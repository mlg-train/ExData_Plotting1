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
png(file = "plot2.png", width = 480, height = 480)

plot(hdata$Time, hdata$Global_active_power, type = "n",
     xlab = "", ylab = "Global Active Power (kilowatts)")
lines(hdata$Time, hdata$Global_active_power)

dev.off()
