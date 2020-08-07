library(datasets)

data <- read.table("./household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# filtering the data 
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
data$Time <- paste(data$Date, data$Time)

# Creating the Plots
par(mfrow = c(2,2), mar=c(4,4,2,1))
# Top left plot
plot(as.numeric(data$Global_active_power) ~ as.POSIXct(data$Time), 
     type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
# Top right plot
plot(as.numeric(data$Voltage) ~ as.POSIXct(data$Time), type = "l",
     ylab = "Voltage", xlab = "datetime")
# Bottom left plot
plot(data$Sub_metering_1 ~ as.POSIXct(data$Time), 
     type = "n", ylab = "Energy sub metering", xlab = "")
lines(as.POSIXct(data$Time),as.numeric(data$Sub_metering_1), col = "black")
lines(as.POSIXct(data$Time),as.numeric(data$Sub_metering_2), col = "red")
lines(as.POSIXct(data$Time),as.numeric(data$Sub_metering_3), col = "blue")
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Bottom right plot 
plot(as.numeric(data$Global_reactive_power) ~ as.POSIXct(data$Time), 
     type = "l", ylab = "Global_reactive_power", xlab = "datetime")
# Save as png file
dev.copy(png, file = "plot4.png")
dev.off()