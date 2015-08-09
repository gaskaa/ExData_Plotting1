#Coursera Data Science
#Exploratory Data Analysis
#Course Project 1, plot 3
#Last Modified: 8/8/15
#========================================================================================
#This script produces the third required plot for the first course project. It reads in
#an “Individual household electric power consumption Data Set” from the UCI Machine 
#Learning Repository 
#(https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption). 
#The output is a png plot of energy sub metering in three areas of the home over a time 
#frame of 2 days from Feb. 1st to Feb. 2nd, 2007.
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

#Select the three sub metering columns from data set to use in the plot function
sm1<-as.numeric(dataSubset$Sub_metering_1)
sm2<-as.numeric(dataSubset$Sub_metering_2)
sm3<-as.numeric(dataSubset$Sub_metering_3)

#Plot the DateTime vs. Submetering values and save to a png file
png("plot3.png", width=480, height=480, units="px")
plot(DateTime, sm1, xlab="", ylab="Energy sub metering", type="l", col="black")
lines(DateTime, sm2, type="l", col="red")
lines(DateTime, sm3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2",
                                                           "Sub_metering_3"), lty="solid")
dev.off()