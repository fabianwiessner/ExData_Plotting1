
#read data
data <- read.csv2("household_power_consumption.txt", na.strings="?", nrows=2880, skip=66637, header=FALSE, col.names = c("Date",	"Time", "Global_active_power",	"Global_reactive_power",	"Voltage",	"Global_intensity",	"Sub_metering_1",	"Sub_metering_2",	"Sub_metering_3"
))

#convert time and date
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Time<-strptime(data$Time, format="%H:%M:%S")
data[1:1440,"Time"]<-format(data[1:1440,"Time"], "2007-02-01 %H:%M:%S")
data[1441:2880,"Time"]<-format(data[1:1440,"Time"], "2007-02-02 %H:%M:%S")

#set layout
par(mfcol = c(2,2))

#create plot 1
plot(data$Time, as.numeric(as.character(data$Global_active_power)),ylab="Global Active Power (kilowatts)", xlab="", type="l")

#create plot 2
plot(data$Time,as.numeric(as.character(data$Sub_metering_1)), type="l", ylab="Energy sub metering", xlab="")
lines(data$Time,as.numeric(as.character(data$Sub_metering_2)), type="l", col="red")
lines(data$Time,as.numeric(as.character(data$Sub_metering_3)), type="l", col="blue")
legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#create plot 3
plot(data$Time,as.numeric(as.character(data$Voltage)), type="l", ylab="Voltage", xlab="datetime")

#create plot 4
plot(data$Time,as.numeric(as.character(data$Global_reactive_power)), type="l", ylab="Global Reactive Power", xlab="datetime")

dev.copy(png, file="plot4.png")
dev.off()
