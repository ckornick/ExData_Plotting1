#File name: plot1.R
#Date: 10.1.2020
#Contents: code to recreate plot1 
#(histogram, frequency of global active power levels)
#Course: Exploratory Data Analysis

power_consumption <- read.csv(file = "household_power_consumption.txt",
    header = TRUE, sep = ";")

#subset of household_power_consumption file for 2/1/2007-2/2/2007
power_consumption <- subset(power_consumption, 
    power_consumption$Date == "1/2/2007" |
    power_consumption$Date == "2/2/2007") 

#opens graphics device (plot will be saved as plot1.png) 
png(filename = "plot1.png", width = 480, height = 480, units = "px")

#plots histogram with data in Global_active_power column 
with(power_consumption, hist(as.numeric(Global_active_power), 
    main = "Global Active Power", 
    xlab = "Global Active Power (kilowatts)",
    ylab = "Frequency", 
    col = "red"))

#closes graphics device
dev.off()
