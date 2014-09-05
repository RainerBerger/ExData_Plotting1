## Exploratory Data Analysis 
## Programming Assignment 1 - Plot 4

## Data file is assumed to be in current working directory
filename <- "household_power_consumption.txt"

## Separator is a semi-colon. Missing values are encoded as "?"
data <- read.csv(filename, header = TRUE, sep = ";", na.strings="?")

## Convert dates to %Y-%m-%d format from %d/%m/%Y format
data[,1] <- as.Date(data[,1], format="%d/%m/%Y")

## Create a filter
filter <- c("2007-02-01", "2007-02-02")

## Subset by data range
febdata <- data[((data[,1]==filter[1]) | (data[,1]==filter[2])),]

## Merge date and time and convert to R time
tmp <- paste(as.character(febdata[,1]), febdata[,2], sep = " ")
datetime <- strptime(tmp, "%Y-%m-%d %H:%M:%S")

## Create a 2x2 panel of plots
par(mfrow = c(2,2))

## Top left plot
plot(datetime, febdata$Global_active_power, type="l", ylab="Global Active Power", xlab="")

## Top right plot
plot(datetime, febdata$Voltage, type="l", ylab="Voltage")

## Bottom left plot
plot(datetime, febdata$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
points(datetime, febdata$Sub_metering_1, type="l")
points(datetime, febdata$Sub_metering_2, type="l", col="red")
points(datetime, febdata$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")

## Bottom right plot
plot(datetime, febdata$Global_reactive_power, type="l", ylab="Global_reactive_power")

## Generate png file
png(filename = "plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(datetime, febdata$Global_active_power, type="l", ylab="Global Active Power", xlab="")

plot(datetime, febdata$Voltage, type="l", ylab="Voltage")

plot(datetime, febdata$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
points(datetime, febdata$Sub_metering_1, type="l")
points(datetime, febdata$Sub_metering_2, type="l", col="red")
points(datetime, febdata$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")

plot(datetime, febdata$Global_reactive_power, type="l", ylab="Global_reactive_power")

dev.off()

