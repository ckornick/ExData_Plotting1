#File name: plot4.R
#Date: 10.1.2020
#Contents: code to recreate plot4 (a 2x2 panel of plots)
#Course: Exploratory Data Analysis

power_consumption <- read.csv(file = "household_power_consumption.txt",
    header = TRUE, sep = ";")

#subset of household_power_consumption file for 2/1/2007-2/2/2007
power_consumption <- subset(power_consumption, 
    power_consumption$Date == "1/2/2007" |
    power_consumption$Date == "2/2/2007") 

#combines date with time in Time column 
power_consumption$Time <- paste(power_consumption$Date, 
    power_consumption$Time, sep = " ")

#converts Time column from class "character" to class "POSITXlt"
power_consumption$Time <- strptime(power_consumption$Time, 
    format = "%d/%m/%Y %H:%M:%S")

#opens graphics device (plot will be saved as plot4.png) 
png(filename = "plot4.png", width = 480, height = 480, units = "px")

#sets global graphics parameters (2 rows of plots, 2 plots per row) 
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

with(power_consumption, {
  
  #1st plot (global active power over time)
  plot(Time, Global_active_power, 
       type = "n",
       xlab = "", 
       ylab = "Global Active Power")
  lines(Time, Global_active_power)
  
  #2nd plot (voltage over time)
  plot(Time, Voltage, 
       type = "n", 
       xlab = "datetime", 
       ylab = "Voltage")
  lines(Time, Voltage)
  
  #3rd plot (sub metering over time)
  plot(Time, Sub_metering_1, type = "n", xlab = "", 
       ylab = "Energy sub metering")
  lines(Time, Sub_metering_1, col = "black")
  lines(Time, Sub_metering_2, col = "red")
  lines(Time, Sub_metering_3, col = "blue")
  legend("topright", 
       col = c("black", "red", "blue"), 
       lty = 1, 
       bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  #4th plot (global reactive power over time)
  plot(Time, Global_reactive_power, type = "n", 
       xlab = "datetime", 
       ylab = "Global_reactive_power")
  lines(Time, Global_reactive_power)
  
})

#closes graphics device
dev.off()
