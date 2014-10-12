# Reading data into data frame
HHPowerData<-read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")
HHPowerData$Date<-as.Date(HHPowerData$Date,"%d/%m/%Y")   # Changing date column format
# Getting the needed portion of data
PowerData<-subset(HHPowerData,Date == "2007-02-01" | Date == "2007-02-02") 
# Adding a new column by joining date and time fields
PowerData$DateTime <- strptime(paste(PowerData$Date,PowerData$Time,sep=","),format = "%Y-%m-%d,%H:%M:%S")
# Opening png graphic device
png(filename = "plot4.png", width = 480, height = 480)
par(mar = c(4,4,2,2)) # Setting margins
par(mfcol=c(2,2))     # setting for creating 4 plots
#Creating plot 1
plot(PowerData$DateTime,PowerData$Global_active_power,type ='l',xlab= "", ylab = "Global Active Power")
#Creating plot 2
plot(PowerData$DateTime,PowerData$Sub_metering_1,type ='l',xlab= "", ylab = "Energy sub metering")
points(PowerData$DateTime,PowerData$Sub_metering_2,type = 'l',col="Red" )
points(PowerData$DateTime,PowerData$Sub_metering_3,type = 'l',col="Blue" )
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty= c(1,1,1),col=c("Black","Red","Blue"))
# Creating plot 3
plot(PowerData$DateTime,PowerData$Voltage,type='l',xlab= "datetime",ylab="Voltage")
# Creating plot 4
plot(PowerData$DateTime,PowerData$Global_reactive_power,type='l',xlab= "datetime",ylab="Global_reactive_power")
#Shutting off graphic device
dev.off()