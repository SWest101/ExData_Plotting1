##Script to plot the graphic 'plot1.png'

#Data importing seperated into it's own script as it will be used for all plots.
source("dataread.R")

#Create a hisogram of the Global Active Power column of the dataset, with labels and coloured red.
hist(raw_data$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Setting the picture size to 480 x 480 px
dev.copy(png,"plot1.png", width = 480, height = 480)

#Shut down the graphics device
dev.off()
