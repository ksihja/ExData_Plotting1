filter_consumption_data <- function(){
  
  library(readr)
  library(dplyr)
  
  # Data needs to be downloaded in R's working directory
  
  powerConsumption <-  read_csv2("household_power_consumption.txt", na = "?", col_type ="cc???????")
  
  # Filter only requested days
  
  filteredIndex <- grep("^(1/2/2007|2/2/2007)", powerConsumption[,1]$Date)
  
  powerConsumption <- powerConsumption[filteredIndex,]
  
  # NA tsekki 
  
  if( any(is.na(powerConsumption[,1:9]))){
    
    print("NA values found from filtered power consumption data")
  }
  

  # Create new datetime field from Date and Time fields
  
  convertedDates <-  mapply( funkkari <- function(d,t){
    as.POSIXlt(paste(d, t), format="%d/%m/%Y %H:%M:%S") 
  },
  powerConsumption[,1],
  powerConsumption[,2])
  
  powerConsumption$fullTime <- convertedDates$Date
  
  # Convert colums 3:9 as numeric

  for(i in 1:nrow(powerConsumption)){
    
    powerConsumption[,3][i,1] <- as.numeric(powerConsumption[,3][i,1])
  }
  
#  write.table(powerConsumption, "filtered_power_consumption.txt")  

  powerConsumption

#  filteredIndex
  
#  convertedDates
}