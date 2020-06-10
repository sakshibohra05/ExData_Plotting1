#data set in tabular format

data_consumption <-read.table("household_power_consumption.txt",sep = ";", skip=1, header =FALSE,col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#required data to form graph

requred_data<-subset(data_consumption,Date=="1/2/2007"|Date=="2/2/2007")


globalActivePower <- as.numeric(requred_data$Global_active_power)

#merging date and time together
datetime <- strptime(paste(requred_data$Date, requred_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

voltage <- as.numeric(requred_data$Voltage)
subMetering1 <- as.numeric(requred_data$Sub_metering_1)
subMetering2 <- as.numeric(requred_data$Sub_metering_2)
subMetering3 <- as.numeric(requred_data$Sub_metering_3)
globalReactivePower <- as.numeric(requred_data$Global_reactive_power) 

#plotting graph and line 

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()