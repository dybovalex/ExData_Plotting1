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

#taking data to pring
Time <- sub.data$Time
Glob_power <- as.numeric(sub.data$Global_active_power)

#translting the weekdays to english
Sys.setlocale("LC_TIME", "C")

#ploting the data
plot(Time, Glob_power, type = "l", lty=1, xlab = "", ylab = "Global Active Power (kilowatts)")
