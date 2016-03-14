##Downloading zip file from URL and placing it in current directory
 
filename = "exdata_plotting1.zip"
if(!file.exists(filename)){
joke = download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
	destfile = filename)
}

##Unzipping file and reading the contents of unzip file

unzip = read.csv(unz(filename, "household_power_consumption.txt"), header = T,
	sep= ";" , stringsAsFactors=F, na.strings="?",
	colClasses = c("character", "character", "numeric",
			   "numeric", "numeric", "numeric",
			   "numeric", "numeric", "numeric"))

##Formatting Data, only use data from 2007-02-01 and 2007-02-02

unzip$Date = as.Date(unzip$Date, format= "%d/%m/%Y")
startDate = as.Date("01/02/2007", format= "%d/%m/%Y")
endDate = as.Date("02/02/2007", format= "%d/%m/%Y")
unzip = unzip[unzip$Date >= startDate & unzip$Date <= endDate,]

##Plot2
png(filename ="plot2.png", width=480, height=480)
plot(unzip$timestamp, unzip$Global_active_power, xlab="",
	ylab="Global Active Power (kilowatts)")


png(filename="plot3.png", width=480, height=480)
plot(unzip$timestamp, unzip$Sub_metering_1, , xlab="", 
      ylab="Energy sub metering") 
 lines(unzip$timestamp, unzip$Sub_metering_2, col="red") 
 lines(unzip$timestamp, unzip$Sub_metering_3, col="blue") 
 legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        col=c("black", "red", "blue"), lwd=par("lwd")) 
dev.off()