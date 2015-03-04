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
##              Plot 2                  ##
##########################################

## set number of graphics by device (necessary to overide previous settings)
par(mfrow=c(1,1))
## Plot the graphic
plot(consumptionData$datetime,consumptionData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
## Export the graphic to PNG file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
