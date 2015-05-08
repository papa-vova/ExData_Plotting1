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
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(cproj1$Global_active_power ~ cproj1$DateTime,
     lty=1,
     col="black",
     type="n",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     main = "")
lines(cproj1$Global_active_power ~ cproj1$DateTime)

# cleaning up
dev.off()
rm(tmp, tmr, cproj1)