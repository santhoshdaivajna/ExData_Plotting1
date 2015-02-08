plottest3 <- function(){
  
  input <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                      colClasses=c(rep("character",2),rep("numeric",7)))
  #head(input) 
  # create a additional column timestamp from existing date and time columns
  input$Timestamp <- strptime(paste(input$Date,input$Time), format="%d/%m/%Y %H:%M:%S")
  
  # only use data from the dates 2007-02-01 and 2007-02-02
  data = subset(input,as.Date(input$Timestamp) >= "2007-02-01" 
                & as.Date(input$Timestamp) < "2007-02-03")
  
  #head(data$Time,100) 
  #tail(data)
  
  # open the png device
  png(filename = "plot3.png", width = 480, height = 480)
  
  # plot a first graph (timestamp, Sub_metering_1)
  plot(data$Timestamp, data$Sub_metering_1, xlab="", 
       ylab="Energy sub metering", type="l")
  
  # plot a second line graph (timestamp, Sub_metering_2)
  lines(data$Timestamp, data$Sub_metering_2,  type="l",
       col="red")
  
  # plot a third line graph (timestamp, Sub_metering_3)
  lines(data$Timestamp, data$Sub_metering_3, type="l",
       col="blue")
  
  #legend for the graph at topright.
  legend(x="topright", 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col=c("black", "red", "blue"),
         lwd=1
         )
  
  # save the graph and remove the references to the file.
  dev.off()
}