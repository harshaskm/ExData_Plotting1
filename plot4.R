
setwd("/home/ruser/coursera_courses/exploratory_data_analysis/proj_assign_week_1/ExData_Plotting1")
filewithdata <- file("household_power_consumption.txt")
fulldata <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", stringsAsFactors = F)
fulldata$Date <- strptime(fulldata$Date, "%d/%m/%Y")
fulldata_v1 <- subset(fulldata, fulldata$Date >= "2007-02-01" & fulldata$Date <= "2007-02-02")
fulldata_v1$Date <- paste(as.Date(fulldata_v1$Date), fulldata_v1$Time)
fulldata_v1$Date <- as.POSIXct(fulldata_v1$Date)

plot(fulldata_v1$Global_active_power ~ fulldata_v1$Date, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(fulldata_v1$Voltage ~ fulldata_v1$Date, type = "l", xlab = "datetime", ylab = "")

with(fulldata_v1, {
                    plot(Sub_metering_1 ~ Date, type = "l", 
                          ylab = "Global Active Power (kilowatts)", xlab = ""
                        )
                    lines(Sub_metering_2 ~ Date, col = 'Red')
                    lines(Sub_metering_3 ~ Date, col = 'Blue')
                  }
    )
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
      )

plot(fulldata_v1$Global_reactive_power ~ fulldata_v1$Date, type = "l", ylab = "Global reactive Power", xlab = "")

dev.print(png, 'plot4.png', width = 480, height = 480)



