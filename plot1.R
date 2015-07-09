 ## ===========================##
 ##      Exploratiry Data      ##
 ##        plot1.R             ##
 ##============================##

 ## Read the data from "household_power_consumption.txt"
 ## into tidy - a data frame.
 file <- "household_power_consumption.txt"
 tidy <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") # Note: "tidy" is a data frame

 ## Select/Slice the range of dates in question out of tidy
 tidy <- tidy[tidy$Date %in% c("1/2/2007","2/2/2007") ,]

 ## Correct variable types - From character to numeric 
 ## Except Time and Date - Will do that at a later step.
 tidy$Global_active_power <- as.numeric(tidy$Global_active_power)
 tidy$Global_reactive_power <- as.numeric(tidy$Global_reactive_power)

 tidy$Voltage <- as.numeric(tidy$Voltage)
 tidy$Global_intensity <- as.numeric(tidy$Global_intensity)

 tidy$Sub_metering_1 <- as.numeric(tidy$Sub_metering_1)
 tidy$Sub_metering_2 <- as.numeric(tidy$Sub_metering_2)
 tidy$Sub_metering_3 <- as.numeric(tidy$Sub_metering_3)

 ## Remove NAs
 tidy <- tidy[complete.cases(tidy), ]

 ## Add the Date to the Time column
 tidy$Time <- paste(tidy$Date, tidy$Time)

 ## Convert Time-Date Column to date format
 ## Now the Time column contains the Date as well.
 tidy$Time <- strptime(tidy$Time, format="%d/%m/%Y %H:%M:%S")

 ## Convert the Date variable to Date format.
 tidy$Date <- as.Date(tidy$Date, format="%d/%m/%Y")

 ## Plot 1
 png("plot1.png", width=480, height=480)
 hist(tidy$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
 dev.off()
