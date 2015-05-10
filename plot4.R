plot4 <- function(){
     data <- read.table("household_power_consumption.txt", sep = ";", header = T, skip = 66000, nrows = 3700)
     names(data) <- c("Date", "Time", "Global_active_power",
                      "Global_reactive_power", "Voltage", "Global_intensity",
                      "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
     subset <- as.Date(data$Date, format="%d/%m/%Y")
     data <- data[subset == "2007-02-01" | subset == "2007-02-02",]
     
     x <- paste(data$Date, data$Time)
     x <- strptime(x, format="%d/%m/%Y %H:%M:%S")
     
     png("plot4.png")
     par(mfcol=c(2,2))
     plot(x, data$Global_active_power, type = "l",
          main = "", xlab="", ylab="Global Active Power (kilowatts)")
     
     plot(x, data$Sub_metering_1, type = "l", col = "black", 
          xlab = "", ylab = "Energy sub metering", main = "")
     lines(x, data$Sub_metering_2, type = "l", col = "red")
     lines(x, data$Sub_metering_3, type = "l", col = "blue")
     legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
            col = c("black", "red", "blue"), lty=c(1,1,1), bty = "n")
     
     plot(x, data$Voltage, type = "l",
          xlab = "datetime", ylab = "Voltage")
     
     plot(x, data$Global_reactive_power, type = "l",
          xlab = "datetime", ylab = "Global_reactive_power")
     dev.off()
}