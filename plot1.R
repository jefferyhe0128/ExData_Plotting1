# Load and subset the dataset
data_full <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", 
                      nrows = 2075259, check.names = FALSE, stringsAsFactors = FALSE, comment.char = "", quote = '\"')
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")
data <- subset(data_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(data$Date), data$Time)
datetime <- as.POSIXct(datetime)

# plot 1
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "Red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
