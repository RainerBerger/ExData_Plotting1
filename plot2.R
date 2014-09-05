## Exploratory Data Analysis 
## Programming Assignment 1 - Plot 2

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

plot(datetime, febdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Generate png file of plot
png(filename = "plot2.png", width=480, height=480)
plot(datetime, febdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
