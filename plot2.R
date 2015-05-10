plot2 <- function(){
     data <- read.table("household_power_consumption.txt", sep = ";", header = T, skip = 66000, nrows = 3700)
     names(data) <- c("Date", "Time", "Global_active_power",
                      "Global_reactive_power", "Voltage", "Global_intensity",
                      "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
     subset <- as.Date(data$Date, format="%d/%m/%Y")
     data <- data[subset == "2007-02-01" | subset == "2007-02-02",]
     
     x <- paste(data$Date, data$Time)
     x <- strptime(x, format="%d/%m/%Y %H:%M:%S")
     
     png("plot2.png")
     plot(x, data$Global_active_power, type = "l",
          main = "", xlab="", ylab="Global Active Power (kilowatts)")
     dev.off()
}