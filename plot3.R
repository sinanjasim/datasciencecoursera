##Read the File 
file <- "C:\\Users\\Sinan Jasim Hadi\\Desktop\\R Prgramming\\main\\household_power_consumption.txt"
rowdata <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?" )

##Convert the Date
rowdata$Date <- as.Date(rowdata$Date, format="%d/%m/%Y")

##Filter the Row data to choose observations between the specified dates
tidydata<-filter(rowdata, rowdata$Date>="2007-02-01"& rowdata$Date <= "2007-02-02" )

## Converting and gathering dates

tidydata$Datetime <- as.POSIXct(paste(tidydata$Date, tidydata$Time))

##Plot Energy sun Metering
plot(tidydata$Datetime, tidydata$Sub_metering_1, 
     type ="l",xlab = "", ylab="Energy Sub metering")
    lines(tidydata$Datetime, tidydata$Sub_metering_2, type="l", col="red")
    lines(tidydata$Datetime, tidydata$Sub_metering_3, type="l", col="blue")
##adding legend
    legend("topright", lty = 1, lwd = 2.5, col=c("black","red","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## Create the PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()