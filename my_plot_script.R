household_power_consumption <- read.csv("~/Downloads/Coursera_R/ExData_Plotting1/household_power_consumption.txt", sep=";", na.strings = "?")
household_power_consumption$Date<-as.Date(household_power_consumption$Date,"%d/%m/%Y")
data_required <- subset(household_power_consumption,Date == "2007-02-01" | Date == "2007-02-02")
rm(household_power_consumption)
data_required $DateTime <- as.POSIXct(paste(data_required$Date, data_required$Time), format="%Y-%m-%d %H:%M:%S")

png("plot1.png",width = 480, height = 480)
hist(data_required$Global_active_power, xlab = "Global Active Power (kilowatts)",ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()

png("plot2.png",width = 480, height = 480)
plot(data_required$DateTime, data_required$Global_active_power,xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()


png("plot3.png",width = 480, height = 480)
plot(data_required$DateTime, data_required$Sub_metering_1,xlab = "", ylab = "Energy sub metering", type = "l")
points(data_required$DateTime, data_required$Sub_metering_2,xlab = "", col = "red", type = "l")
points(data_required$DateTime, data_required$Sub_metering_3,xlab = "", col = "blue", type = "l")
legend("topright",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.off()

png("plot4.png",width = 480, height = 480)
par(mfrow = c(2, 2))
with(airquality, {
  plot(data_required$DateTime, data_required$Global_active_power,xlab = "", ylab = "Global Active Power", type = "l")
  plot(data_required$DateTime, data_required$Voltage,xlab = "", ylab = "Voltage", type = "l")
  plot(data_required$DateTime, data_required$Sub_metering_1,xlab = "", ylab = "Energy sub metering", type = "l")
  points(data_required$DateTime, data_required$Sub_metering_2,xlab = "", col = "red", type = "l")
  points(data_required$DateTime, data_required$Sub_metering_3,xlab = "", col = "blue", type = "l")
  legend("topright",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
  plot(data_required$DateTime, data_required$Global_reactive_power,xlab = "datetime", ylab = "Global_reactive_power", type = "l")
})
dev.off()