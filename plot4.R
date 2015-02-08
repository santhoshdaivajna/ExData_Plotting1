plottest4 <- function(){
  
  input <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                      colClasses=c(rep("character",2),rep("numeric",7)))
  #head(input) 
  # create a additional column timestamp from existing date and time columns
  input$Timestamp <- strptime(paste(input$Date,input$Time), format="%d/%m/%Y %H:%M:%S")
  
  # only use data from the dates 2007-02-01 and 2007-02-02
  data = subset(input,as.Date(input$Timestamp) >= "2007-02-01" 
                & as.Date(input$Timestamp) < "2007-02-03")
  
  # open the png device
  png(filename = "plot4.png", width = 480, height = 480)
  
  par(mar=c(4,4,2,2))
  par(mfrow=(c(2,2)))
  
  
  
  # 1 - plot a line graph (x=timestamp and y= Global_active_power)
  plot(data$Timestamp, data$Global_active_power, xlab="", ylab="Global Active Power", type="l")
  
  # 2
  plot(data$Timestamp, data$Voltage, xlab="datetime", ylab="Voltage",type="l")
  
  # 3-  plot a first graph (timestamp, Sub_metering_1 /2 /3)
  plot(data$Timestamp, data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
  
  lines(data$Timestamp, data$Sub_metering_2,  type="l",
        col="red")
  
 
  lines(data$Timestamp, data$Sub_metering_3, type="l",
        col="blue")
  
  #legend for the graph at topright.
  legend(x="topright", 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col=c("black", "red", "blue"),
         lwd=1, bty="n"
  )
  
  # 4-  plot a fourth graph (timestamp, Sub_metering_1 /2 /3)
  plot(data$Timestamp, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power",type="l")
  
  # save the graph and clear the references to the file.
  dev.off()
}