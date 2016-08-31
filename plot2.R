plot2 <- function()
{

  filteredPowerConsumption <- filter_consumption_data()
  
  curr_locale <- Sys.getlocale("LC_TIME")
  
  # Setting Locale so that weekdays are printed correctly
  Sys.setlocale("LC_TIME", "C")
  
  png("plot2.png")

  
  par(mar=c(3,4,3,1))
  plot(filteredPowerConsumption$fullTime, filteredPowerConsumption$Global_active_power, type = "l", main = NULL, sub = NULL,
       ylab = "Global Active Power (kilowatts)", xlab = NULL)
  
  dev.off()

  Sys.setlocale("LC_ALL", curr_locale)

}