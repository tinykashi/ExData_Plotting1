# plot3.R
# This program takes the 3 energy sub-metering and plots them vs days of the week

# read data from text file
dat <- read.table("household_power_consumption.txt", header = TRUE,sep = ";",
                  nrows=400000,stringsAsFactors=FALSE)

# convert the date column to date class
dat[,"Date"] <- as.Date(dat[,"Date"],format = "%d/%m/%Y")

# keep only relevant dates
dat <- dat[dat[,"Date"] >= "2007-02-01" & dat[,"Date"] <= "2007-02-02",]

# convert the time to time class
datetime <- paste(dat[,1],dat[,2])
x <- strptime(datetime, "%Y-%m-%d %H:%M:%S")

# set up the png file
png(filename = "plot3.png", width = 480, height = 480)

# create the plot
plot(x,dat$Sub_metering_1,type="l",ylab="",xlab="",col="black")
ylims = par("usr")[3:4]
par(new=TRUE)
plot(x,dat$Sub_metering_2,type="l",ylab="",xlab="",
     ylim=ylims,col="red",axes=FALSE)
par(new=TRUE)
plot(x,dat$Sub_metering_3,type="l",ylab="",xlab="",
     ylim=ylims,col="blue",axes=FALSE)
title(ylab = "Energy sub metering")
legend("topright",names(dat)[7:9], lty="solid",col=c("black","red","blue"))

# close the .png file 
dev.off()

