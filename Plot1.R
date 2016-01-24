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


#taking the date to pring
to_print=as.numeric(sub.data$Global_active_power)

#constracting histogramm
hist(to_print, col='red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

