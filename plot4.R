## Getting full data
dataFull <- read.table("./data/household_power_consumption.txt", 
                       header=TRUE, sep=";", 
                       stringsAsFactors=FALSE, 
                       dec=".")
dataFull$Date <- as.Date(dataFull$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(dataFull, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
        plot(Global_active_power ~ Datetime, type = "l", 
             ylab = "Global Active Power", xlab = "")
        plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
        plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",
             xlab = "")
        lines(Sub_metering_2 ~ Datetime, col = 'Red')
        lines(Sub_metering_3 ~ Datetime, col = 'Blue')
        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
               bty = "n",
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               cex=0.3, pch=1, pt.cex = 1)
        plot(Global_reactive_power ~ Datetime, type = "l", 
             ylab = "Global_rective_power", xlab = "datetime")
})

## Saving file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()