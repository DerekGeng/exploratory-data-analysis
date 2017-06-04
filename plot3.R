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


## Plot 3
par(mfrow=c(1,1), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
        plot(Sub_metering_1 ~ Datetime, type = "l", 
             ylab = "Energy sub metering", xlab = "")
        lines(Sub_metering_2 ~ Datetime, col = 'Red')
        lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       cex=0.6, pch=1, pt.cex = 1)

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()