dataset <- read.csv("household_power_consumption.txt", sep=";")
print("dataset has been loaded")
print("Process the plot 2 : Global Active Power by Days")
dateDataset <- as.character(dataset$Date)
dateDatasetWanted <- dateDataset == "1/2/2007" | dateDataset == "2/2/2007"
globalActivePower <- dataset$Global_active_power[dateDatasetWanted]
globalActivePower <- as.numeric(as.character(globalActivePower))
dates <- dataset$Date[dateDatasetWanted]
times <- dataset$Time[dateDatasetWanted]
dt <- paste(dates, times)
dt <- as.POSIXct(strptime(dt, "%d/%m/%Y %H:%M:%S"))
print("Get the date between: 2007-02-01 and 2007-02-02")
par(mfrow=c(1, 1))
plot(dt, globalActivePower, xlab="", ylab="Global Active Power (kilowatts)", pch=-2)
lines(dt, globalActivePower)
print("Plot the graph")
dev.copy(png, file="plot2.png")
dev.off()
print("Save the graph in the plot2.png")