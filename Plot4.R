#reading the data from txt file
data <- read.table("household_power_consumption.txt", header = T, sep = ";")

#converting the time column to date format
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
head(data$Time)
#converting the date column to date format
data$Date <- strptime(data$Date, "%d/%m/%Y")
head(data$Date)
class(data$Date)


#converting the Time column to Date format
sub.data <- subset(data, Date >= "2007-02-01 " & Date <= "2007-02-02")

#translting the weekdays to english
Sys.setlocale("LC_TIME", "C")




#taking data to pring
Time <- sub.data$Time
Glob_power <- as.numeric(sub.data$Global_active_power)

Sub_met1 <- as.numeric(as.character(sub.data$Sub_metering_1))
Sub_met2 <- as.numeric(as.character(sub.data$Sub_metering_2))
Sub_met3 <- as.numeric(as.character(sub.data$Sub_metering_3))
Voltage <- as.numeric(as.character(sub.data$Voltage))
Glob_react <- as.numeric(as.character(sub.data$Global_reactive_power))


#plotting
par(mfcol=c(2,2))
#plot1
plot(Time, Glob_power, type = "l", lty=1, xlab = "", ylab = "Global Active Power (kilowatts)")
#plot2
plot(Time, Sub_met1, type = "l", xlab ="", ylab = "Energy sub metering")
lines(Time, Sub_met2, type="l", col="red")
lines(Time, Sub_met3,  col="blue")
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), bty="n",
       legend = c("Sub_metering1", "Sub_metering2", "Sub_metering3"))
#plot3
plot(Time, Voltage, type="l", xlab = "datetime", ylab = "Voltage")

#plot4
plot(Time, Glob_react, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


