##Script to plot the graphic 'plot4.png'

#Data importing seperated into it's own script as it will be used for all plots.
source("dataread.R")

#Set par to a 2 x 2 matrix of graphics
par(mfrow=c(2,2))

#Create a timeseries plot of the Global Active Power column of the dataset
plot(date_time,raw_data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")

#Create a timeseries plot of the Voltage column of the dataset
plot(date_time,raw_data$Voltage, type="l", ylab = "Voltage", xlab="datetime")

#Create a timeseries plot of the Sub Metering dataset
plot(date_time,raw_data$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="", col="black")
lines(date_time,raw_data$Sub_metering_2, col="red")
lines(date_time,raw_data$Sub_metering_3, col="blue")

#Create the legend for the graphic
colset <- c("black","red","blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty ="n", cex = 0.8, lty = 1, col = colset)

#Create a timeseries plot of the Global Reactive Power column of the dataset
plot(date_time,raw_data$Global_reactive_power, type="l", ylab = "Global Reactive Power", xlab="datetime")

#Set par back to single row & single column so that it doesn't split further graphs
par(mfrow=c(1,1))

#Setting the graphic device size to 480 x 480 px
dev.copy(png,"plot4.png", width = 480, height = 480)

#Shut down the graphics device
dev.off()
