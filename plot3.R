dataset <- read.csv("household_power_consumption.txt", sep=";")
print("dataset has been loaded")
print("Process the plot 3 : Energy sub metering by Days")
dateDataset <- as.character(dataset$Date)
dateDatasetWanted <- dateDataset == "1/2/2007" | dateDataset == "2/2/2007"
SubMetering1 <- dataset$Sub_metering_1[dateDatasetWanted]
SubMetering1 <- as.numeric(as.character(SubMetering1))
SubMetering2 <- dataset$Sub_metering_2[dateDatasetWanted]
SubMetering2 <- as.numeric(as.character(SubMetering2))
SubMetering3 <- dataset$Sub_metering_3[dateDatasetWanted]
SubMetering3 <- as.numeric(as.character(SubMetering3))
dates <- dataset$Date[dateDatasetWanted]
times <- dataset$Time[dateDatasetWanted]
dt <- paste(dates, times)
dt <- as.POSIXct(strptime(dt, "%d/%m/%Y %H:%M:%S"))
print("Get the date between: 2007-02-01 and 2007-02-02")
par(mfrow=c(1, 1))
plot(dt, SubMetering1, xlab="", ylab="Energy sub metering", pch=-2)
lines(dt, SubMetering1, col="black")
lines(dt, SubMetering2, col="red")
lines(dt, SubMetering3, col="blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1, 1, 1),
       col=c("black", "red", "blue")
       )
print("Plot the graph")
dev.copy(png, file="plot3.png")
dev.off()
print("Save the graph in the plot3.png")