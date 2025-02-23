subset_data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
subset_data$Date <- as.Date(subset_data$Date, format="%d/%m/%Y")
subset_data$DateTime <- strptime(paste(subset_data$Date, subset_data$Time), format="%Y-%m-%d %H:%M:%S")
subset_data <- subset_data[subset_data$Date == "2007-02-01" | subset_data$Date == "2007-02-02", ]
png("plot2.png", width = 480, height = 480)
hist(subset_data$Global_active_power, main="Histogram of Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red", border="black")
dev.off()