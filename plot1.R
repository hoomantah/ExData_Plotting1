# This is the course project for the Exploratory Data Analysis,
# Week 1;
# We're going to reproduce the plots for the project.
# This is plot number 1, the code creatres: plot1.png


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

# now, create a PNG device, save the histogram into it and
# close the device
png("plot1.png", width=480, height=480)
    hist(data$Global_active_power, main = "Global Active Power", col = "red", xlab= "Global Active Power (kilowatts)")
dev.off()


