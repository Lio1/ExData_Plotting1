## Coursera Data Science Specialization | Exploratory Data Analysis | Course Project #1
## This R script constructs plot #2 of the Course Project

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

# Building the graph into the screen device
with(data,plot(Time,Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)"))

# Creating a 480x480 PNG file of the plot 
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()