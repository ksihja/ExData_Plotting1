plot1 <- function()
{

  filteredPowerConsumption <- filter_consumption_data()

  png("plot1.png")
   
  with( filteredPowerConsumption,{ hist(as.numeric(Global_active_power), col = "red", main = "Global Active Power"
                                        , xlab = "Global Active Power (kilowatts)")})
  dev.off()
  
}