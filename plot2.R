#data set in tabular format

data_consumption <-read.table("household_power_consumption.txt",sep = ";", skip=1, header =FALSE,col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#required data to form graph

requred_data<-subset(data_consumption,Date=="1/2/2007"|Date=="2/2/2007")


globalActivePower <- as.numeric(requred_data$Global_active_power)

#merging date and time together
datetime <- strptime(paste(requred_data$Date, requred_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()