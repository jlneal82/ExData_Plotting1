## Creating the plot 
 png(filename="plot4.png", width=480, height=480) 
 
 
 # Setting the canvas for 4 plots 
 par(mfcol=c(2,2)) 
 
 
 # First plot 
 plot(unzip$timestamp, unzip$Global_active_power,  xlab="", 
      ylab="Global Active Power") 
 
 
 # Second plot 
 plot(unzip$timestamp, unzip$Sub_metering_1, type="l", xlab="", 
      ylab="Energy sub metering") 
 lines(unzip$timestamp, unzip$Sub_metering_2, col="red") 
 lines(unzip$timestamp, unzip$Sub_metering_3, col="blue") 
 legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        col=c("black", "red", "blue"), lwd=par("lwd"), bty="n") 
 

 # Third Plot 
 plot(unzip$timestamp, unzip$Voltage, type="1", 
      xlab="datetime", ylab="Voltage") 
 
 
# Fourth plot 
 plot(unzip$timestamp, unzip$Global_reactive_power,  
      xlab="datetime", ylab="Global_reactive_power") 
 
 

