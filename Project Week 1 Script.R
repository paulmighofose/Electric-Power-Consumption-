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

###Plot 1.R:
### Creation of plot #1
hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Avtive Power (kilowatts)")

###Plot 2.R:
plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")


###Plot 3.R:
plot(DateTime, Sub_metering_1, ylab = "Energy sub_metering") 
plot(DateTime, Sub_metering_1, ylab = "Energy sub_metering", type = "l") 
lines(DateTime, Sub_metering_2, col = "red") 
lines(DateTime, Sub_metering_3, col = "Blue")
legend("topright",pch = "-", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3" ))

####Plot 4.R:
par(mfrow = c(2,2))
###plot 4.1:
hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Avtive Power (kilowatts)")

###4.2:
plot(DateTime, Voltage, type = "l")

###4.3:
plot(DateTime, Sub_metering_1, ylab = "Energy sub_metering", type = "l") +
lines(DateTime, Sub_metering_2, col = "red") +
lines(DateTime, Sub_metering_3, col = "Blue")+
legend("topright",pch = "-", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3" ))
###4.4:
plot(DateTime,Global_reactive_power, type = "l")

### Saving Plot 1
setwd("/Users/paulighofose/Desktop/Week 1 Project")
png(filename="plot1.png", width = 480, height = 480)
plot1 <- hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

### Saving Plot 2
setwd("/Users/paulighofose/Desktop/Week 1 Project")
png(filename="plot2.png", width = 480, height = 480)
plot2 <- plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()

### Saving Plot 3
setwd("/Users/paulighofose/Desktop/Week 1 Project")
png(filename="plot3.png", width = 480, height = 480)
plot3 <- plot(DateTime, Sub_metering_1, ylab = "Energy sub_metering") 
plot(DateTime, Sub_metering_1, ylab = "Energy sub_metering", type = "l") 
lines(DateTime, Sub_metering_2, col = "red") 
lines(DateTime, Sub_metering_3, col = "Blue")
legend("topright",pch = "-", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3" ))
dev.off()

### Saving Plot 4
setwd("/Users/paulighofose/Desktop/Week 1 Project")
png(filename="plot4.png", width = 480, height = 480)
plot4 <- par(mfrow = c(2,2))
###plot 4.1:
hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Avtive Power (kilowatts)")

###4.2:
plot(DateTime, Voltage, type = "l")

###4.3:
plot(DateTime, Sub_metering_1, ylab = "Energy sub_metering", type = "l") +
lines(DateTime, Sub_metering_2, col = "red") +
lines(DateTime, Sub_metering_3, col = "Blue")+
legend("topright",pch = "-", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3" ))
###4.4:
plot(DateTime,Global_reactive_power, type = "l") 

)
dev.off()



