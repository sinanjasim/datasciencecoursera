##Read the File 
file <- "C:\\Users\\Sinan Jasim Hadi\\Desktop\\R Prgramming\\main\\household_power_consumption.txt"
rowdata <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?" )

##Convert the Date
rowdata$Date <- as.Date(rowdata$Date, format="%d/%m/%Y")

##Filter the Row data to choose between the specified dates
tidydata<-filter(rowdata, rowdata$Date>="2007-02-01"& rowdata$Date <= "2007-02-02" )

##Plot the Hitogram of Global active power
hist(tidydata$Global_active_power, col="red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")
## Create the PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()