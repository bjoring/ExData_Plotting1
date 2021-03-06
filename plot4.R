power <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
february <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
power$Time <- strptime(power$Time, "%H:%M:%S")
x <- paste(february$Date,february$Time)
february$Date <- strptime(x, "%d/%m/%Y %H:%M:%S")
february$Global_active_power <- as.numeric(as.character(february$Global_active_power))
february$Global_reactive_power <- as.numeric(as.character(february$Global_reactive_power))
february$Voltage <- as.numeric(as.character(february$Voltage))
february$Sub_metering_1 <- as.numeric(as.character(february$Sub_metering_1))
february$Sub_metering_2 <- as.numeric(as.character(february$Sub_metering_2))
february$Sub_metering_3 <- as.numeric(as.character(february$Sub_metering_3))
february <- subset(february, select=-c(Time))
png("plot4.png", width=480px, height=480px)
par(mfrow=c(2,2))
plot(february$Date,february$Global_active_power,type="n",xlab="",ylab="Global Active Power")
lines(february$Date,february$Global_active_power)
plot(february$Date,february$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(february$Date,february$Voltage)
plot(february$Date,february$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(february$Date,february$Sub_metering_1)
lines(february$Date,february$Sub_metering_2,col="red")
lines(february$Date,february$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
plot(february$Date,february$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(february$Date,february$Global_reactive_power)
dev.off()