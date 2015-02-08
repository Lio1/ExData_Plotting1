## Coursera Data Science Specialization | Exploratory Data Analysis | Course Project #1
## This R script constructs plot #3 of the Course Project

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
png("plot3.png", width=480, height=480,units="px") # This is to avoid display issues with the legend with plotting to PNG

with(data,plot(Time,Sub_metering_1,type="l", ylab="Energy sub metering", xlab=""))
with(data,points(Time,Sub_metering_2,type="l",col="red"))
with(data,points(Time,Sub_metering_3,type="l",col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) #This is the legend

# Closing the PNG device
dev.off()