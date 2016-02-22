##Read the File 
file <- "C:\\Users\\Sinan Jasim Hadi\\Desktop\\R Prgramming\\main\\household_power_consumption.txt"
rowdata <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?" )

##Convert the Date
rowdata$Date <- as.Date(rowdata$Date, format="%d/%m/%Y")

##Filter the Row data to choose observations between the specified dates
tidydata<-filter(rowdata, rowdata$Date>="2007-02-01"& rowdata$Date <= "2007-02-02" )

## Converting and gathering dates

tidydata$Datetime <- as.POSIXct(paste(tidydata$Date, tidydata$Time))

##Divide the Panel to 4 parts 2 rows by 2 columns
par(mfrow = c(2, 2), mar=c(4,4,1,1), oma=c(0,0,0.5,0.5)) 

##Plot 4 plots
plot(tidydata$Datetime, tidydata$Global_active_power, 
     type ="l",xlab = "", ylab="Global Active Power (kilowatts)")
plot(tidydata$Datetime, tidydata$Voltage, 
     type ="l",xlab = "", ylab="Voltage")
plot(tidydata$Datetime, tidydata$Sub_metering_1, 
     type ="l",xlab = "", ylab="Energy Sub metering")
lines(tidydata$Datetime, tidydata$Sub_metering_2, type="l", col="red")
lines(tidydata$Datetime, tidydata$Sub_metering_3, type="l", col="blue")
##adding legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(tidydata$Datetime, tidydata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
## Create the PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()