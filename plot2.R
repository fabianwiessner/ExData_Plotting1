

#read data
data <- read.csv2("household_power_consumption.txt", na.strings="?", nrows=2880, skip=66637, header=FALSE, col.names = c("Date",	"Time", "Global_active_power",	"Global_reactive_power",	"Voltage",	"Global_intensity",	"Sub_metering_1",	"Sub_metering_2",	"Sub_metering_3"
))

#convert time and date
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Time<-strptime(data$Time, format="%H:%M:%S")
data[1:1440,"Time"]<-format(data[1:1440,"Time"], "2007-02-01 %H:%M:%S")
data[1441:2880,"Time"]<-format(data[1:1440,"Time"], "2007-02-02 %H:%M:%S")

#create plot
plot(data$Time, as.numeric(as.character(data$Global_active_power)),ylab="Global Active Power (kilowatts)", xlab="", type="l")

dev.copy(png, file="plot2.png")
dev.off()