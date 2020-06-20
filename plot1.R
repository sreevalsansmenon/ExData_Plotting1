household_power_consumption <- read.csv("~/Downloads/Coursera_R/ExData_Plotting1/household_power_consumption.txt", sep=";", na.strings = "?")
household_power_consumption$Date<-as.Date(household_power_consumption$Date,"%d/%m/%Y")
data_required <- subset(household_power_consumption,Date == "2007-02-01" | Date == "2007-02-02")
rm(household_power_consumption)
data_required $DateTime <- as.POSIXct(paste(data_required$Date, data_required$Time), format="%Y-%m-%d %H:%M:%S")

png("plot1.png",width = 480, height = 480)
hist(data_required$Global_active_power, xlab = "Global Active Power (kilowatts)",ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()