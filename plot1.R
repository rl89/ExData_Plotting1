plot1 <- function(){
     data <- read.table("household_power_consumption.txt", sep = ";", header = T, skip = 66000, nrows = 3700)
     names(data) <- c("Date", "Time", "Global_active_power",
                      "Global_reactive_power", "Voltage", "Global_intensity",
                      "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
     data$Date <- as.Date(data$Date, format="%d/%m/%Y")
     data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
     png("plot1.png")
     hist(data$Global_active_power, 
          main = "Global Active Power",
          col = "red", border = "black",
          xlab = "Global Active Power (kilowatts)")
     dev.off()
}