library(datasets)

data <- read.table("./household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# filtering the data 
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
data$Time <- paste(data$Date, data$Time)
# Create a plot
plot(data$Sub_metering_1 ~ as.POSIXct(data$Time), 
     type = "n", ylab = "Energy sub metering", xlab = "")
lines(as.POSIXct(data$Time),as.numeric(data$Sub_metering_1), col = "black")
lines(as.POSIXct(data$Time),as.numeric(data$Sub_metering_2), col = "red")
lines(as.POSIXct(data$Time),as.numeric(data$Sub_metering_3), col = "blue")
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()
