## Data Science Specialization
# Derek Geng
# 04/06/2017

# Week 1 assignment 
# plot 1


# download and unzip data
setwd('D:\Downloads')

if(!file.exists('data')) dir.create('data')

fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

download.file(fileUrl, destfile = './data/household_power_consumption.zip')

unzip('./data/household_power_consumption.zip', exdir = './data')


# read data 
InputFile<- file("./data/household_power_consumption.txt")
Data <- read.table(text = grep("^[1,2]/2/2007", readLines(InputFile), value = TRUE),
                   col.names = c("Date", "Time", "Global_active_power", 
                                 "Global_reactive_power", "Voltage", "Global_intensity", 
                                 "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                   sep = ";", header = TRUE)

# Generating Plot 1
hist(Data$Global_active_power, col = "red", main = paste("Global Active Power"), 
     xlab = "Global Active Power (kilowatts)")

## Saving file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

