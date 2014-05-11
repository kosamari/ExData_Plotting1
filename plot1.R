# Load file as dataset 
# this program assumes you have downloaded and added file under dataset dir.
dataset <- read.table('dataset/household_power_consumption.txt', sep=';', header=TRUE,colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'),na.strings='?')

#change Date column as Date object
dataset$Date<-as.Date(dataset$Date,"%d/%m/%Y")

# subset only data from 1/2/2007 - 2/2/2007
subset <- dataset[dataset$Date>="2007-02-01" & dataset$Date<="2007-02-02",]

# create histgram 
hist(subset$Global_active_power, col = "red", main = "Global Active Power", xlab= "Global Acrive Power (kilowatts)")

#save file
dev.copy(png, filename = "plot1.png")
dev.off()