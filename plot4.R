fileName <- "household_power_consumption.txt"
data <- read.table(fileName, 
                   header = TRUE, 
                   sep = ";", 
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")
data1 <- data[which(data$Date == "1/2/2007" | data$Date =="2/2/2007"),]
data1$DateTime <- strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
par(mfrow = c(2, 2))
plot(data1$DateTime, data1$Global_active_power, 
     type = "l",
     xlab = "", ylab = "Global Active Power")
plot(data1$DateTime, data1$Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")
plot(data1$DateTime, data1$Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(data1$DateTime, Sub_metering_2, col = "red")
lines(data1$DateTime, Sub_metering_3, col = "blue")
legend("topright", 
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
plot(data1$DateTime, data1$Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()