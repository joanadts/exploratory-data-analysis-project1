#Load data
hpower_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?", stringsAsFactors=FALSE)

#Subset for only 2 days
hpower <- subset(hpower_full, hpower_full$Date %in% c("1/2/2007","2/2/2007"))
rm(hpower_full)

#Convert Date and Time from character into Date and Time formats
datetime <- strptime(paste(hpower$Date, hpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Make plot
png("plot2.png", width=480, height=480)
plot(datetime, hpower$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()