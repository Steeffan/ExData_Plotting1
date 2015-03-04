#######################################
##       Libraries and settings      ##
#######################################

## Libraries dplyr and lubridate are required
library(dplyr)
library(lubridate)

## Settings

## Working directory
setwd("~/Coursera/Exploratory Data Analysis/Assessment/Assessment 1")

## data file to load
dataFile <- "household_power_consumption.txt"

## dates for data subsetting
startDate <- "2007-02-01"
endDate <- "2007-02-02"

#############################################
##  Load data from the original data file  ##
#############################################

## Load data
consumptionData <- read.table(dataFile, sep=";",header=TRUE, na.strings="?", comment.char="")
## Calculates date & time and subset data
consumptionData <- consumptionData %>%
        mutate(datetime=dmy_hms(paste(Date, Time))) %>% ## add the column datetime
        filter(datetime>=ymd(startDate), datetime<=(ymd(endDate)+days(1))) ## subset the data

##########################################
##              Plot 4                  ##
##########################################

## set number of graphics by device (necessary to overide previous settings)
par(mfrow=c(2,2))
## Plot graphic 1
plot(consumptionData$datetime,consumptionData$Global_active_power, type="l", xlab="", ylab="Global Active Power")
## Plot graphic 2
plot(consumptionData$datetime,consumptionData$Voltage, type="l", xlab="datetime", ylab="Voltage")
## Plot graphic 3
plot(consumptionData$datetime,consumptionData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(consumptionData$datetime,consumptionData$Sub_metering_2, type="l", col="red")
points(consumptionData$datetime,consumptionData$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", cex=0.75, inset=c(0.17,0), lty=1, lwd=1, col=c("black","red","blue"))
## Plot graphic 4
plot(consumptionData$datetime,consumptionData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
## Export the graphic to PNG file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
