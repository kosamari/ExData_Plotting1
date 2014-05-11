# Load file as dataset 
# this program assumes you have downloaded and added file in working dir.
dataset <- read.table('household_power_consumption.txt', sep=';', header=TRUE,colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'),na.strings='?')
#change Date column as Date object
dataset$Date<-as.Date(dataset$Date,"%d/%m/%Y")

# subset only data from 1/2/2007 - 2/2/2007
subset <- dataset[dataset$Date>="2007-02-01" & dataset$Date<="2007-02-02",]

# format Time column
subset$Time<-strptime(paste(subset$Date,subset$Time, sep=" "),format="%Y-%m-%d %H:%M:%S")


# out put graphs
par(mfrow=c(2,2))

  #plot top left
  plot(subset$Time,subset$Global_active_power,type="l",ylab="Global Active Power",xlab="")

  #plot top right
  plot(subset$Time,subset$Voltage,type="l",ylab='Voltage',xlab="datetime")

  #plot bottom left
  plot(subset$Time,subset$Sub_metering_1,type="l",ylab="Engery sub metering",xlab="")
  lines(subset$Time,subset$Sub_metering_2,type="l",col='red')
  lines(subset$Time,subset$Sub_metering_3,type="l",col='blue')
  legend("topright",cex =0.8,bty = 'n',lty = 1,col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  #plot bottom right
  plot(subset$Time,subset$Global_reactive_power,type="l", ylab="Global_reactive_power", xlab="datetime")

#save file
dev.copy(png, filename = "plot4.png")
dev.off()