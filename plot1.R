## R script for Exploratory Data Analysis Assignment
## This code constructs the plot1.png
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

# Open png device, create 'plot1.png' in the working directory
png(filename = "plot1.png", width = 480, height = 480)

# Make the initial histogram for Global_active_power: 
# household global minute-averaged active power (in kilowatt) 
with(house_sub, hist(Global_active_power, col= "red", main = "Global Active Power",
        xlab = "Global Active Power (kilowatts)"))

# Close the png file device
dev.off()

## Now you can view the file 'plot1.png' on your computer


