plottest <- function(){
  
  input <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                      colClasses=c(rep("character",2),rep("numeric",7)))
  #head(input) 
  
  # create a additional column timestamp from existing date and time columns
  input$Timestamp <- strptime(paste(input$Date,input$Time), format="%d/%m/%Y %H:%M:%S")
  
  # only use data from the dates 2007-02-01 and 2007-02-02
  data = subset(input,as.Date(input$Timestamp) >= "2007-02-01" 
                    & as.Date(input$Timestamp) < "2007-02-03")
  
  # open the png device
  png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
  
  hist(data$Global_active_power,  col="red",  
    xlab="Global Active Power (kilowatts)",
    ylab="Frequency",
    main="Global Active Power")
  
  dev.off()
}