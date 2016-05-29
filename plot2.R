# Set as working directory
setwd("~/Dropbox/Coursera/Data Science/04 Exploratory Data Analysis/Assignments/Week 1/Assignment_Course Project 1")

# Load and subset the dataset
data_full <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", 
                      nrows = 2075259, check.names = FALSE, stringsAsFactors = FALSE, comment.char = "", quote = '\"')
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")
data <- subset(data_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(data$Date), data$Time)
datetime <- as.POSIXct(datetime)

# plot 2
png("plot2.png", width = 480, height = 480)
plot(data$Global_active_power~datetime, type = "l", xlab = NA, ylab="Global Active Power (kilowatts)")
dev.off()