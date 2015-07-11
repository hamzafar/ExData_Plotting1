library(lubridate)
file <- "E:\\Hamza\\Coursera\\Exploratory Data Analysis\\project1\\ExData_Plotting1\\plot2.png"
dest <- "E:\\Hamza\\Coursera\\Exploratory Data Analysis\\project1\\household_power_consumption.txt"
data <- read.table(dest, header = TRUE, sep = ";", stringsAsFactors=FALSE)

##data is converted to lubridate##
data <- cbind(new_date=0, data)

data$new_date <- dmy(data$Date) + hms(data$Time)

#only first and second day of february 2007 extracted her
reqData <- (data[year(data$new_date) == 2007 & month(data$new_date) == 2 
                 & day(data$new_date) <= 2,])

#open png file for plotting
png(file,width = 480, height = 480, bg= "white")

###########plot 2###############
x <- wday(reqData$new_date )
y <- (as.numeric(reqData$Global_active_power))

plot(y, type = 'n',xaxt = "n",
     xlab = "", ylab = "Global Active Power (kilowatts)")
xMax <- 60*24*2     
axis(1, at=c(0,xMax/2,xMax+1), c("Thu","Fri","Sat"))
lines(y)

dev.off()