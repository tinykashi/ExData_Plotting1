# plot2.R
# This program takes the global active power and plots it vs days of the week

# read data from text file
dat <- read.table("household_power_consumption.txt", header = TRUE,sep = ";",
                  nrows=400000,stringsAsFactors=FALSE)

# convert the date column to date class
dat[,"Date"] <- as.Date(dat[,"Date"],format = "%d/%m/%Y")

# keep only relevant dates
dat <- dat[dat[,"Date"] >= "2007-02-01" & dat[,"Date"] <= "2007-02-02",]

# convert global active power to numeric type
dat[,"Global_active_power"] <- as.numeric(dat[,"Global_active_power"])

# convert the time to time class
datetime <- paste(dat[,1],dat[,2])
x <- strptime(datetime, "%Y-%m-%d %H:%M:%S")

# set up the png file
png(filename = "plot2.png", width = 480, height = 480)

# create the plot
plot(x,dat[,"Global_active_power"],type="l",ylab="",xlab="")
title(ylab = "Global Active Power (kilowatts)")

# close the png file 
dev.off()
