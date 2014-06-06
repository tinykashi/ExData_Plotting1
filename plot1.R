# plot1.R
# This program takes the global active power and plots a histogram

# read data from text file
dat <- read.table("household_power_consumption.txt", header = TRUE,sep = ";",
                  nrows=400000,stringsAsFactors=FALSE)

# convert the date column to date type
dat[,"Date"] <- as.Date(dat[,"Date"],format = "%d/%m/%Y")
# keep only relevant dates
dat <- dat[dat[,"Date"] >= "2007-02-01" & dat[,"Date"] <= "2007-02-02",]
# convert the global active power data to numeric values
dat[,"Global_active_power"] <- as.numeric(dat[,"Global_active_power"])

# set up the png file
png(filename = "plot1.png", width = 480, height = 480)

# generate the histogram and save to a .png file
hist(dat[,"Global_active_power"],xlab=NULL,ylab=NULL,main=NULL,col="red")
title(main="Global Active Power",xlab = "Global Active Power (kilowatts)",
      ylab="Frequency")

# close the png file
dev.off()
