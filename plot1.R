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
png(file = "plot1.png", width = 480, height = 480)
hist(hdata$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red")
dev.off()
