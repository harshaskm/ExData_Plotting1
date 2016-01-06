
setwd("/home/ruser/coursera_courses/exploratory_data_analysis/proj_assign_week_1/ExData_Plotting1")
filewithdata <- file("household_power_consumption.txt")
plotdata <- read.table(text = grep("^[1,2]/2/2007", readLines(filewithdata), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
hist(plotdata$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
dev.print(png, 'plot1.png', width = 480, height = 480)
