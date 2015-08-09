#Coursera Data Science
#Exploratory Data Analysis
#Course Project 1, plot 2
#Last Modified: 8/8/15
#========================================================================================
#This script produces the second required plot for the first course project. It reads in
#an “Individual household electric power consumption Data Set” from the UCI Machine 
#Learning Repository 
#(https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption). 
#The output is a png plot of global active power, which is household global 
#minute-averaged active power (in kilowatts), over the date and time from Feb. 1st to 
#Feb. 2nd 2007.
#========================================================================================
#Set working directory
setwd("~/Desktop/Data Science/Exploratory Data Analysis")

#Load packages
library(dplyr)

#Read data into R
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   stringsAsFactors=FALSE, na.strings="?")

#Create a subset of the data, selecting only dates equal to Feb. 1st and 2nd in 2007
dataSubset<-filter(data, Date=="1/2/2007" | Date=="2/2/2007")

#Convert the dates and times to date-time class; select the date-time values
#to use in plot function
DateTime<-strptime(paste(dataSubset$Date, dataSubset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Select the global active power column from the subset to use in the plot function
GAP<-as.numeric(dataSubset$Global_active_power)

#Plot the date and time vs. the global active power, save to a png file
png("plot2.png", width=480, height=480, units="px")
plot(DateTime, GAP, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()
