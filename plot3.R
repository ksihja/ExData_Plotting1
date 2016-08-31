plot3 <- function(){

  filteredPowerConsumption <- filter_consumption_data()

  curr_locale <- Sys.getlocale("LC_TIME")
  
  # Setting Locale so that weekdays are printed correctly
  Sys.setlocale("LC_TIME", "C")
  
  png("plot3.png")

  par(mar=c(3,4,3,1))
  plot(filteredPowerConsumption$fullTime, filteredPowerConsumption$Sub_metering_1, type = "l", col = "black",
                                            main = NULL, sub = NULL,ylab = "Energy submetering", xlab = NULL)
  
  lines(filteredPowerConsumption$fullTime, filteredPowerConsumption$Sub_metering_2, col = "red")
  
  lines(filteredPowerConsumption$fullTime, filteredPowerConsumption$Sub_metering_3, col = "blue")
  
  legend("toprigh", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2",
                                                                         "Sub_metering_3"))
  
  dev.off()

  Sys.setlocale("LC_TIME", curr_locale)
}