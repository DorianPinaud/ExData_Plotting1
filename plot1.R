dataset <- read.csv("household_power_consumption.txt", sep=";")
print("dataset has been loaded")
print("Process the plot 1 : Global Active Power")
dateDataset <- as.character(dataset$Date)
dateDatasetWanted <- dateDataset == "1/2/2007" | dateDataset == "2/2/2007"
globalActivePower <- dataset$Global_active_power[dateDatasetWanted]
globalActivePower <- as.numeric(as.character(globalActivePower))
print("Get the date with date: 2007-02-01 and 2007-02-02")
par(mfrow=c(1, 1))
hist(globalActivePower,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red",
     )
print("Plot the graph")
dev.copy(png, file="plot1.png")
dev.off()
print("Save the graph in the plot1.png")
