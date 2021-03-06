# Using data from the UC Irvine Machine Learning Repository, make a line graph
# of the global active power

# Getting the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest = "consumption.zip", method="curl")
unzip("consumption.zip")
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")

# Grab global active power for the first two days in February 2007
x <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",3])

# Write the plot as a PNG
png("plot2.png",width=480,height=480)
plot(x,type="l",axes=FALSE,ylab="Global Active Power (kilowatts)",xlab="")
axis(2, at=seq(0,8,by=2))
axis(1, at=seq(0,2880,1440),labels=c("Thurs","Fri","Sat"))
box()
dev.off()
