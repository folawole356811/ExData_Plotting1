subset_data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
subset_data$Date <- as.Date(subset_data$Date, format="%d/%m/%Y")
subset_data$DateTime <- strptime(paste(subset_data$Date, subset_data$Time), format="%Y-%m-%d %H:%M:%S")
subset_data <- subset_data[subset_data$Date == "2007-02-01" | subset_data$Date == "2007-02-02", ]
png("plot1.png", width = 480, height = 480)
plot(subset_data$DateTime, subset_data$Global_active_power, type="l", 
     xlab="DateTime", ylab="Global Active Power (kilowatts)", 
     main="Global Active Power over Time")
dev.off()