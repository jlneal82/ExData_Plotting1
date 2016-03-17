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

##Creating the plot
hist(unzip$Global_active_power, main = "Global Active Power",
xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 
######################################################################################
######################################################################################
