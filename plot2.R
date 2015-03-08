fileName <- "household_power_consumption.txt"
data <- read.table(fileName, 
                   header = TRUE, 
                   sep = ";", 
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")
data1 <- data[which(data$Date == "1/2/2007" | data$Date =="2/2/2007"),]
data1$DateTime <- strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")
plot(data1$DateTime, data1$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()