library(datasets)

data <- read.table("./household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# filtering the data 
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
data$Time <- paste(data$Date, data$Time)
data$Global_active_power <- as.numeric(data$Global_active_power)
# Create a plot
plot(data$Global_active_power ~ as.POSIXct(data$Time), 
     type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png")
dev.off()
