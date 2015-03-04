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
##              Plot 3                  ##
##########################################

## set number of graphics by device (necessary to overide previous settings)
par(mfrow=c(1,1))
## Plot the graphic
plot(consumptionData$datetime,consumptionData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(consumptionData$datetime,consumptionData$Sub_metering_2, type="l", col="red")
points(consumptionData$datetime,consumptionData$Sub_metering_3, type="l", col="blue")
## Add the legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.85, lty=1, lwd=1, col=c("black","red","blue"))
## Export the graphic to PNG file
dev.copy(png, file="plot3.png", width=480, height=480, res=50)
dev.off()
