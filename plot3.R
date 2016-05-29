# Load and subset the dataset
data_full <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", 
                      nrows = 2075259, check.names = FALSE, stringsAsFactors = FALSE, comment.char = "", quote = '\"')
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")
data <- subset(data_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(data$Date), data$Time)
datetime <- as.POSIXct(datetime)

# plot 3
png("plot3.png", width = 480, height = 480)
plot(data$Sub_metering_1~datetime, type = "l", xlab = NA, ylab = "Energy sub metering")
lines(data$Sub_metering_2~datetime, col = 'Red')
lines(data$Sub_metering_3~datetime, col = 'Blue')
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
