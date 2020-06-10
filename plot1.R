#importing dataset

data_consumption <-read.table("household_power_consumption.txt",sep = ";", skip=1, header =FALSE,col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#extracting required data

requred_data<-subset(data_consumption,Date=="1/2/2007"|Date=="2/2/2007")

#plotting graph in png format

png(file="plot1.png",width = 480,height = 480)

hist(as.numeric(requred_data$Global_active_power),main = "Global Active Power",col = "red",xlab = "Global_active_power(Kilowatt)",ylab = "Frequency")

dev.off()
