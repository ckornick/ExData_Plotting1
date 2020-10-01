#File name: plot3.R
#Date: 10.1.2020
#Contents: code to recreate plot3 (line graph, 3 sub-meters over time)
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

#opens graphics device (plot will be saved as plot3.png) 
png(filename = "plot3.png", width = 480, height = 480, units = "px")

with(power_consumption, {
  
  #plots meter energy readings (y-axis) over time (x-axis)
  plot(Time, Sub_metering_1, 
      type = "n", #creates plot with no points 
      xlab = "", 
      ylab = "Energy sub metering")
  
  #creates lines connecting points for three different meters in home 
  lines(Time, Sub_metering_1, col = "black")
  lines(Time, Sub_metering_2, col = "red")
  lines(Time, Sub_metering_3, col = "blue")
  
  #adds color-coded legend to plot, distinguishing between meters 
  legend("topright", 
      col = c("black", "red", "blue"), 
      lty = 1, 
      legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
}) 

#closes graphics device
dev.off()
