library(lubridate)
file <- "E:\\Hamza\\Coursera\\Exploratory Data Analysis\\project1\\ExData_Plotting1\\plot1.png"
dest <- "E:\\Hamza\\Coursera\\Exploratory Data Analysis\\project1\\household_power_consumption.txt"
data <- read.table(dest, header = TRUE, sep = ";", stringsAsFactors=FALSE)

##data is converted to lubridate##
data <- cbind(new_date=0, data)

data$new_date <- dmy(data$Date) + hms(data$Time)

#only first and second day of february 2007 extracted her
reqData <- (data[year(data$new_date) == 2007 & month(data$new_date) == 2 
                 & day(data$new_date) <= 2,])

#open png file for plotting
png(file,width = 480, height = 480, bg = "white")

######plot 1 histogram#########
par(mar= c(5,4,6,1))
x <- (as.numeric(reqData$Global_active_power))
hist(x,breaks = 15, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)" )
mtext("Plot 1", side = 3,outer = TRUE)

dev.off()