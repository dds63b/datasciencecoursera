library(data.table)
data <- fread("household_power_consumption.txt")

# Acquire only subset of dates and load data frame
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data_subset <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02"]
data_subset <- data.frame(data_subset)

for(i in c(3:9)) {data_subset[,i] <- as.numeric(as.character(data_subset[,i]))}
data_subset$Date_Time <- paste(data_subset$Date, data_subset$Time)
data_subset$Date_Time <- strptime(data_subset$Date_Time, format="%Y-%m-%d %H:%M:%S")
class(data_subset$Date_Time)

# Plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")
par(mar = c(7, 6, 5, 4))
plot(data_subset$Date_Time, data_subset$Sub_metering_1, xaxt=NULL, xlab = "", ylab = "Energy sub metering", type="n")
lines(data_subset$Date_Time, data_subset$Sub_metering_1, col = "black", type = "S")
lines(data_subset$Date_Time, data_subset$Sub_metering_2, col = "red", type = "S")
lines(data_subset$Date_Time, data_subset$Sub_metering_3, col = "blue", type = "S")
legend("topright", lty = c(1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()