## R script for Exploratory Data Analysis Assignment
## This code constructs the plot3.png
## 
## Data set Description: Measurements of electric power consumption in one household with a 
## one-minute sampling rate over a period of almost 4 years. 
## Different electrical quantities and some sub-metering values are available
## 
## Rough estimate of how much memory the dataset will require in memory: 143 mb 

# Load packages
library(dplyr)
library(lubridate)

# Read and load data into R, missing values are coded as "?", and sep =";"
housing <- read.table("household_power_consumption.txt", sep = ";", na.strings= "?", header = TRUE)

# Subset data between 2007-02-01 and 2007-02-02
house_sub<-filter(housing, Date == "1/2/2007" | Date=="2/2/2007")

# Merge Date and Time columns and convert to "POSIXct" "POSIXt", I´m using lubridate packague
house_sub$Date<-dmy_hms(paste(house_sub$Date,house_sub$Time))
house_sub<-select(house_sub, -Time)

# Open png device, create 'plot3.png' in the working directory
png(filename = "plot3.png", width = 480, height = 480)

# Make the plot for Sub_metering_1, Sub_metering_2, Sub_metering_3 
# (in watt-hour of active energy)
with(house_sub, plot(Date, Sub_metering_1, type = "l", 
        ylab = "Energy sub metering", xlab = ""))
with(house_sub, lines(Date, Sub_metering_2, col = "red"))
with(house_sub, lines(Date, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the png file device
dev.off()

## Now you can view the file 'plot3.png' on your computer


