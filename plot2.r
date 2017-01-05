##Script to plot the graphic 'plot2.png'

#Data importing seperated into it's own script as it will be used for all plots.
source("dataread.R")

#Create a timeseries plot of the Global Active Power column of the dataset
plot(date_time,raw_data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")

#Setting the picture size to 480 x 480 px
dev.copy(png,"plot2.png", width = 480, height = 480)

#Shut down the graphics device
dev.off()
