# Reading data into data frame
HHPowerData<-read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")
HHPowerData$Date<-as.Date(HHPowerData$Date,"%d/%m/%Y")   # Changing date column format
# Getting the needed portion of data
PowerData<-subset(HHPowerData,Date == "2007-02-01" | Date == "2007-02-02") 
# Adding a new column by joining date and time fields
PowerData$DateTime <- strptime(paste(PowerData$Date,PowerData$Time,sep=","),format = "%Y-%m-%d,%H:%M:%S")
# Opening png graphic device
png(filename = "plot1.png", width = 480, height = 480)
# creating plot
hist(PowerData$Global_active_power,xlab = "Global Active Power (kilowatts)",col="Red", main = "Global Active Power")
# shutting the graphic device
dev.off()