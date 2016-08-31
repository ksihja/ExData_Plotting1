plot4 <- function(){

  filteredPowerConsumption <- filter_consumption_data()

  curr_locale <- Sys.getlocale("LC_TIME")
  
  # Setting Locale so that weekdays are printed correctly
  Sys.setlocale("LC_TIME", "C")
  
  png("plot4.png")

  par(mar=c(4,4,3,1))
  par(mfrow=c(2,2))
  
  # Plot 1
  
  plot(filteredPowerConsumption$fullTime, filteredPowerConsumption$Global_active_power, type = "l", main = NULL, sub = NULL,
       ylab = "Global Active Power", xlab = "")
  
  # Plot 2
  
  scaledVoltage <- as.numeric(filteredPowerConsumption$Voltage)/1000
  
  plot(filteredPowerConsumption$fullTime, scaledVoltage, type = "l", main = "", sub = "",
       ylab = "Voltage" , xlab = "datetime")
  
  # plot3
  
  plot(filteredPowerConsumption$fullTime, filteredPowerConsumption$Sub_metering_1, type = "l", col = "black",
                                            main = NULL, sub = NULL,ylab = "Energy submetering", xlab = "")
  
  lines(filteredPowerConsumption$fullTime, filteredPowerConsumption$Sub_metering_2, col = "red")
  
  lines(filteredPowerConsumption$fullTime, filteredPowerConsumption$Sub_metering_3, col = "blue")
  
  legend("toprigh", bty = "n" , lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2",
                                                                         "Sub_metering_3"))
  
  # plot 4
  
  for(i in 1:nrow(filteredPowerConsumption)){
    
    filteredPowerConsumption[,4][i,1] <- as.numeric(filteredPowerConsumption[,4][i,1])
  }
  
  plot(filteredPowerConsumption$fullTime, filteredPowerConsumption$Global_reactive_power, type = "l", main = NULL, sub = NULL,
       ylab = "Global_reactive_power", xlab = "datetime")
  
  dev.off()

  Sys.setlocale("LC_TIME", curr_locale)
}