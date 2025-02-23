subset_data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
subset_data$Date <- as.Date(subset_data$Date, format="%d/%m/%Y")
subset_data$DateTime <- strptime(paste(subset_data$Date, subset_data$Time), format="%Y-%m-%d %H:%M:%S")
subset_data <- subset_data[subset_data$Date == "2007-02-01" | subset_data$Date == "2007-02-02", ]
png("plot3.png", width = 480, height = 480)
plot(subset_data$DateTime, subset_data$Sub_metering_1, type="l", col="black", 
     xlab="DateTime", ylab="Energy Sub Metering")
lines(subset_data$DateTime, subset_data$Sub_metering_2, col="red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)
dev.off()
