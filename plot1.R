library(data.table)
data <- fread("household_power_consumption.txt")
## Setup classes
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
class(data$Date)

# Subset time range
data_subset <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02"]
data_subset <- data.frame(data_subset)

# set columns to numeric
for(i in c(3:9)) {data_subset[,i] <- as.numeric(as.character(data_subset[,i]))}
data_subset$Date_Time <- paste(data_subset$Date, data_subset$Time)
# Convert Date_Time to right format
data_subset$Date_Time <- strptime(data_subset$Date_Time, format="%Y-%m-%d %H:%M:%S")
class(data_subset$Date_Time)

## Plot1
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
par(mar = c(6, 6, 5, 4))
hist(data_subset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()