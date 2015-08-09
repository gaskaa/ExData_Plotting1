#Coursera Data Science
#Exploratory Data Analysis
#Course Project 1, plot 1
#Last Modified: 8/8/15
#========================================================================================
#This script produces the first required plot for the first course project. It reads in
#an “Individual household electric power consumption Data Set” from the UCI Machine 
#Learning Repository 
#(https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption).
#The output is a png histogram of global active power, which is household global
#minute-averaged active power (in kilowatts), from Feb. 1st to Feb. 2nd 2007.
#========================================================================================
#Set working directory
setwd("~/Desktop/Data Science/Exploratory Data Analysis")

#Load Packages
library(dplyr)

#Read data into R
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   stringsAsFactors=FALSE, na.strings="?")

#Create a subset of the data, selecting only dates equal to Feb. 1st and 2nd in 2007
dataSubset<-filter(data, Date=="2/1/2007" | Date=="2/2/2007")

#Create a histogram of global active power and save to a png file
png("plot1.png", width=480, height=480, units="px")
hist(dataSubset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()