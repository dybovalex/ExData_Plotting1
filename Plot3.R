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
Sub_met1 <- as.numeric(as.character(sub.data$Sub_metering_1))
Sub_met2 <- as.numeric(as.character(sub.data$Sub_metering_2))
Sub_met3 <- as.numeric(as.character(sub.data$Sub_metering_3))

par(mfcol=c(1,1))
plot(Time, Sub_met1, type = "l", xlab ="", ylab = "Energy sub metering")
lines(Time, Sub_met2, type="l", col="red")
lines(Time, Sub_met3,  col="blue")
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), 
       legend = c("Sub_metering1", "Sub_metering2", "Sub_metering3"))

