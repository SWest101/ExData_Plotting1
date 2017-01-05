##Script to plot the graphic 'plot3.png'

#Data importing seperated into it's own script as it will be used for all plots.
source("dataread.R")

#Create a timeseries plot of the Sub Metering dataset
plot(date_time,raw_data$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="", col="black")
lines(date_time,raw_data$Sub_metering_2, col="red")
lines(date_time,raw_data$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col = c("black","red","blue"), cex=1)

#Setting the picture size to 480 x 480 px
dev.copy(png,"plot3.png", width = 480, height = 480)

#Shut down the graphics device
dev.off()
