# reading data
tmp <- read.csv("../household_power_consumption.txt",
                       sep = ";",
                       stringsAsFactors = FALSE)

#filtering the 1at and the 2nd of Feb, 2007
cproj1 <- subset(tmp, Date == "1/2/2007" | Date == "2/2/2007")

# plotting to PNG
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(cproj1$Global_active_power),
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power")

# cleaning up
dev.off()
rm(tmp, cproj1)