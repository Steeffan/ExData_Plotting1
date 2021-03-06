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
consumptionData <- read.table(dataFile, sep=";",header=TRUE, na.strings="?", comment.char="", stringsAsFactors=FALSE)
## Calculates date & time and subset data
consumptionData <- consumptionData %>%
        mutate(datetime=dmy_hms(paste(Date, Time))) %>% ## add the column datetime
        filter(datetime>=ymd(startDate), datetime<(ymd(endDate)+days(1))) ## subset the data

##########################################
##              Plot 1                  ##
##########################################

## Open the device
png(filename="plot1.png",width = 480, height = 480)
## Plot the graphic
hist(consumptionData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
## Close the device
dev.off()