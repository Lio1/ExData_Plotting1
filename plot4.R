## Coursera Data Science Specialization | Exploratory Data Analysis | Course Project #1
## This R script constructs plot #4 of the Course Project

# Downloading and unzipping
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "electric_power_consumption.zip")
dateDownloaded <- date()
print(dateDownloaded)
unzip("electric_power_consumption.zip")

# Reading data for 2007-02-01 and 2007-02-01
head_data <- read.table("household_power_consumption.txt", sep=";", header=T, nrow=1)
colnames <- names(head_data)
data <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=T, skip=66637, nrow=2880, col.names=colnames)

# Coercing dates and times format
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$Time<-paste(data$Date,data$Time,sep=" ")
data$Time<-strptime(data$Time,"%Y-%m-%d %H:%M:%S")

# Building the graph into the PNG device
png("plot4.png", width=480, height=480,units="px") # This is to avoid display issues with the legend with plotting to PNG

# Displaying 4 graphs at the same time
par(mfrow=c(2,2)) 

# Topleft graph
with(data,plot(Time,Global_active_power,type="l", xlab="", ylab="Global Active Power"))

# Topright graph
with(data,plot(Time,Voltage,type="l", xlab="datetime", ylab="Voltage"))

# Bottomright graph
with(data,plot(Time,Sub_metering_1,type="l", ylab="Energy sub metering", xlab=""))
with(data,points(Time,Sub_metering_2,type="l",col="red"))
with(data,points(Time,Sub_metering_3,type="l",col="blue"))
legend("topright", lty=1, bty="n", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) #This is the legend

# Bottomleft graph
with(data,plot(Time,Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power"))

# Closing the PNG device
dev.off()