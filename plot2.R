##Read the File 
file <- "C:\\Users\\Sinan Jasim Hadi\\Desktop\\R Prgramming\\main\\household_power_consumption.txt"
rowdata <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?" )

##Convert the Date
rowdata$Date <- as.Date(rowdata$Date, format="%d/%m/%Y")

##Filter the Row data to choose observations between the specified dates
tidydata<-filter(rowdata, rowdata$Date>="2007-02-01"& rowdata$Date <= "2007-02-02" )

## Converting and gathering dates

tidydata$Datetime <- as.POSIXct(paste(tidydata$Date, tidydata$Time))

##Plot the date versus Global active power
plot(tidydata$Datetime, tidydata$Global_active_power, 
     type ="l",xlab = "", ylab="Global Active Power (kilowatts)")

## Create the PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()