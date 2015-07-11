library(lubridate)
file <- "E:\\Hamza\\Coursera\\Exploratory Data Analysis\\project1\\ExData_Plotting1\\plot4.png"
dest <- "E:\\Hamza\\Coursera\\Exploratory Data Analysis\\project1\\household_power_consumption.txt"
data <- read.table(dest, header = TRUE, sep = ";",stringsAsFactors=FALSE)

##data is converted to lubridate##
data <- cbind(new_date=0, data)

data$new_date <- dmy(data$Date) + hms(data$Time)

#only first and second day of february 2007 extracted her
reqData <- (data[year(data$new_date) == 2007 & month(data$new_date) == 2 
                 & day(data$new_date) <= 2,])

#open png file for plotting
png(file,width = 480, height = 480,bg=  "white")

################## Plot 4 ##############################
par(mfrow = c(2,2))
y <- (as.numeric(reqData$Global_active_power))

plot(y, type = 'n',xaxt = "n", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
xMax <- 60*24*2     
axis(1, at=c(0,xMax/2,xMax+1), c("Thu","Fri","Sat"))
lines(y)


y <- (as.numeric(reqData$Voltage))

plot(y, type = 'n',
     xlab = "datetime", ylab = "Voltage")

lines(y)


met1 <- as.numeric(reqData$Sub_metering_1)
met2 <- as.numeric(reqData$Sub_metering_2)
met3 <- as.numeric(reqData$Sub_metering_3)

plot(met1, type = 'n',xaxt = "n", 
     xlab = "", ylab = "Energy sub metering")
xMax <- 60*24*2     
axis(1, at=c(0,xMax/2,xMax+1), c("Thu","Fri","Sat"))

lines(met1)
lines(met2, col = "red")
lines(met3, col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        xjust = 1, lty=c(1,1,1), col=c("black","red", "blue"), bty = "n")


y <- (as.numeric(reqData$Global_reactive_power))

plot(y, type = 'n',xaxt = "n", 
     xlab = "datetime", ylab = "Global_reactive_power")
xMax <- 60*24*2     
axis(1, at=c(0,xMax/2,xMax+1), c("Thu","Fri","Sat"))
lines(y)

dev.off()

