Sys.setlocale("LC_ALL", "English")

# reading data
tmp <- read.csv("../household_power_consumption.txt",
                       sep = ";",
                       stringsAsFactors = FALSE)

#filtering the 1at and the 2nd of Feb, 2007
cproj1 <- subset(tmp, Date == "1/2/2007" | Date == "2/2/2007")

tmr <- strptime(paste(cproj1$Date, cproj1$Time),
                "%d/%m/%Y %H:%M:%S", tz="GMT")
cproj1 <- data.frame(DateTime = tmr, cproj1)

# plotting to PNG
png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfcol = c(2, 2))

# plot from plot2 (topleft)
plot(cproj1$Global_active_power ~ cproj1$DateTime,
     lty=1,
     col="black",
     type="n",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     main = "")
lines(cproj1$Global_active_power ~ cproj1$DateTime)

#plot from plot3 (bottomleft)
plot(cproj1$Sub_metering_3 ~ cproj1$DateTime,
     lty=1,
     col="black",
     type="n",
     xlab = "",
     ylab = "Energy sub metering",
     main = "",
     ylim = c(0, 38))
lines(cproj1$Sub_metering_1 ~ cproj1$DateTime)
lines(cproj1$Sub_metering_2 ~ cproj1$DateTime, col = "red")
lines(cproj1$Sub_metering_3 ~ cproj1$DateTime, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       col = c("black", "red", "blue"),
       bty = "n")

# voltage vs datetime (topright)
plot(cproj1$Voltage ~ cproj1$DateTime,
     lty=1,
     col="black",
     type="n",
     xlab = "datetime",
     ylab = "Voltage",
     main = "")
lines(cproj1$Voltage ~ cproj1$DateTime)

# Global reactive power vs datetime (topright)
plot(cproj1$Global_reactive_power ~ cproj1$DateTime,
     lty=1,
     col="black",
     type="n",
     xlab = "datetime",
     ylab = "Global_reactive_power",
     main = "")
lines(cproj1$Global_reactive_power ~ cproj1$DateTime)

# cleaning up
dev.off()
rm(tmp, tmr, cproj1)