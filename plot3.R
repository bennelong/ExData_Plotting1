##############################################################
# Coursera Exploratory Data Analysis
# Project 1
# July 2015
###############################################################

#--------------------------------------------------
# start of common code to load and transform data
#--------------------------------------------------

library(lubridate)

wd <- "C:\\_usr\\coursera\\Exploratory Data Analysis\\Project1"
setwd(wd)
powCon <- read.csv2("household_power_consumption.txt", na.strings="?",stringsAsFactor=FALSE)

# subset records to include only those in the required date range
powCon1 <- powCon[dmy(powCon$Date)==dmy('01/02/2007')|dmy(powCon$Date)==dmy('02/02/2007'),]

# convert columns 3 to 9 to numeric type
powCon1[,3:9] <- lapply(powCon1[,3:9], function(x){as.numeric(as.character(x))})

# create new columns to hold converted Date and Time values as well as their sums for plotting 

powCon1$Date1 <- dmy(powCon1$Date)
powCon1$Time1 <- hms(powCon1$Time)
powCon1$DateTime <- powCon1$Date1+powCon1$Time1

#-------------------
# start of plot 3 
#-------------------

par(mar=c(3, 4.3, 4, 2))
plot(powCon1$DateTime,powCon1$Sub_metering_1,type = "l",ylab = "Energy sub metering")
lines(powCon1$DateTime,powCon1$Sub_metering_2,type = "l",col="red")
lines(powCon1$DateTime,powCon1$Sub_metering_3,type = "l",col="blue")
legend("topright", names(powCon1)[7:9], lty = "solid",col=c('black','red','blue'))

dev.copy(png,'plot3.png')
dev.off()

#-------------------
# end of plot 3 
#-------------------