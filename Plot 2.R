### Calling required packages for data manipulation
library(tidyverse)
### Setting working directory
setwd("/users/paulighofose/Desktop/Data.Sets")

### Tidying Data:
Power <- read.table("household_power_consumption.txt",header=T,sep=";")
Date <- as.Date(Power$Date, "%d/%m/%Y")

Consumption <- Power %>% select(Time:Sub_metering_3)
Power_Consumption <- cbind(Date, Consumption)
d1 <- Power_Consumption %>% filter(Date == "2007-02-01" )
d2 <- Power_Consumption %>% filter(Date == "2007-02-02")
power <- rbind(d1,d2)
tibble(power)

DateTime <- power %>% unite(DateTime, Date, Time, sep = " ")
tibble(DateTime)

###Converting character vectors to numeric vectors:
Global_active_power <-as.numeric(DateTime$Global_active_power)
Global_reactive_power <-as.numeric(DateTime$Global_reactive_power)
Voltage <-as.numeric(DateTime$Voltage)
Global_intensity <-as.numeric(DateTime$Global_intensity)
Sub_metering_1 <-as.numeric(DateTime$Sub_metering_1)
Sub_metering_2 <-as.numeric(DateTime$Sub_metering_2)
Sub_metering_3 <-as.numeric(DateTime$Sub_metering_3)

merge <-
cbind(Global_active_power,Global_reactive_power,Voltage,Global_intensity,Sub_metering_1,Sub_metering_2,Sub_metering_3)
tibble(merge)

like <- DateTime %>% select(DateTime)
tibble(like)

try <- cbind(like,merge)
tibble(try)

Powered <- try
tibble(Powered)

###Converting DateTime variable from character vector to POSIXlt vector:
DateTime <-as.POSIXlt(Powered$DateTime)
Power  <- cbind(DateTime,Powered %>% select(-DateTime))
tibble(Power)

###Plot 2.R:
plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
Active_power <- plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")