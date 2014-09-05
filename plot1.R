## Exploratory Data Analysis 
## Programming Assignment 1 - Plot 1

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

hist(febdata[,3], col = "red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

## Generate png file of plot
png(filename = "plot1.png", width=480, height=480)
hist(febdata[,3], col = "red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
