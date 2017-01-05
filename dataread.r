#Loading the necessary libraries
library(data.table)
library(lubridate)

#Set the working directory
setwd("C:/Coursera/Data Science specialisation/Exploratory data analysis/Project 1/ExData_Plotting1")

#Check to see if the 'data' directory exists. If it doesn't, create the folder,
#Download the data from the external source and unzip it. 
if (!dir.exists("./data/")){
  dir.create("./data/")
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./data/data.zip")
  unzip("./data/data.zip", exdir = "./data")
}

#Using the fread function from the data.table library to quickly read in the large file
raw_data <- fread("./data/household_power_consumption.txt", header = T, sep=";", na.strings = "?")

#Convert the 'Date' column to a date type using the lubridate library.
raw_data[ , ("Date") := lapply(.SD, dmy), .SDcols = "Date"]

#Subsetting the data to the required timeframe as per project specifications
raw_data <- raw_data[Date == ymd("2007-02-01") | Date == ymd("2007-02-02")]

#Join the Date and time and convert it to a standard Date/Time object
date_time <- as.POSIXct(paste(raw_data$Date,raw_data$Time), format="%Y-%m-%d %H:%M:%S" )