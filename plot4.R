#Coursera Data Science
#Exploratory Data Analysis
#Course Project 1, plot 4
#Last Modified: 8/8/15
#========================================================================================
#This script produces the fourth set of required plots for the first course project. It reads 
#in an “Individual household electric power consumption Data Set” from the UCI Machine 
#Learning Repository 
#(https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption). 
#The output is a file of 4 png plots:
#1. Global active power over the date and time from Feb. 1st to Feb. 2nd 2007.
#2. Minute averaged voltage from Feb. 1st to Feb. 2nd, 2007.
#3. Energy sub metering in three areas of the home over from Feb. 1st to Feb. 2nd, 2007.
#4. Global reactive power over the date and time from Feb. 1st to Feb. 2nd 2007.
#========================================================================================
#Set working directory
setwd("~/Desktop/Data Science/Exploratory Data Analysis")

#Load packages
library(dplyr)

#Read data into R
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                 stringsAsFactors=FALSE, na.strings="?")

#Create a subset of the data, selecting only dates equal to Feb. 1st and 2nd in 2007
dataSubset<-filter(data, Date=="1/2/2007" | Date=="2/2/2007")

#Convert the dates and times to date-time class; select the date-time values
#to use in plot function
DateTime<-strptime(paste(dataSubset$Date, dataSubset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Select the global active power column from the subset to use in the first plot
GAP<-as.numeric(dataSubset$Global_active_power)

#Select voltage column form the subset to use in the second plot
voltage<-as.numeric(dataSubset$Voltage)

#Select the three sub metering columns from the subset to use in the third plot
sm1<-as.numeric(dataSubset$Sub_metering_1)
sm2<-as.numeric(dataSubset$Sub_metering_2)
sm3<-as.numeric(dataSubset$Sub_metering_3)

#Select global reactive power from the subset to use for the fourth plot
GRP<-as.numeric(dataSubset$Global_reactive_power)

#Create a png file with the four plots in one frame
png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))

plot(DateTime, GAP, xlab="", ylab="Global Active Power", type="l")

plot(DateTime, voltage, xlab="datetime", ylab="Voltage", type="l")

plot(DateTime, sm1, xlab="", ylab="Energy sub metering", type="l", col="black")
lines(DateTime, sm2, type="l", col="red")
lines(DateTime, sm3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty="solid", bty="n")


plot(DateTime, GRP, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()