#File name: plot2.R
#Date: 10.1.2020
#Contents: code to recreate plot2 (line graph, global active power over time)
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

#opens graphics device (plot will be saved as plot2.png) 
png(filename = "plot2.png", width = 480, height = 480, units = "px")

with(power_consumption, {
  
  #plots global active power (y-axis) over time (x-axis) 
  plot(Time, Global_active_power, 
      type = "n", #creates plot without points 
      xlab = "", 
      ylab = "Global Active Power (kilowatts)")
  
  #connects the points with a line, makes line graph 
  lines(Time, Global_active_power)
  
})

#closes graphics device
dev.off()
