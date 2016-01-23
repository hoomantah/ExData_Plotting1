# This is the course project for the Exploratory Data Analysis,
# Week 1;
# We're going to reproduce the plots for the project.
# This is plot number 3, the code creatres: plot3.png


# Dataset is huge and memory consuming, so we extract the data
# from the given dates 2007-02-01 and 2007-02-02

# open the zip file connection
dsf <- unz("exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.txt")
# read the variable (column) names, because we will need it for
# the next subset extraction
vars <-read.csv(dsf, sep=";", nrows = 1,header = T)
# open the zip file connection again
dsf <- unz("exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.txt")
# read some part of the dataset to find our required records within
data <- read.csv(dsf, sep=";", skip=66000,nrows = 10000,header = F, col.names = names(vars), na.strings = "?")
# find the indeces of the Feb 1 2007 beginning and Feb 2 2007 ending
rng  <- match(c("1/2/2007","3/2/2007"),data[,1])
# subset the data in that range;
data <- data[rng[1]:(rng[2]-1),]

# plotting over the Time variablie will over-draw, so we create a
# temporary continuous timeline by combining date and time
dates <- strptime(paste(data$Date,data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
# now, create a PNG device, save the line plot into it, then
# close the device
png("plot3.png", width=480, height=480)
    plot(dates,data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
    lines(dates, data$Sub_metering_2, type="l", col = "red")
    lines(dates, data$Sub_metering_3, type="l", col = "blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red", "blue"), lty=1)
dev.off()


