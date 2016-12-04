#Load data
hpower_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?", stringsAsFactors=FALSE)

#Subset for only 2 days
hpower <- subset(hpower_full, hpower_full$Date %in% c("1/2/2007","2/2/2007"))
rm(hpower_full)

#Convert Date and Time from character into Date and Time formats
datetime <- strptime(paste(hpower$Date, hpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Make plot
png("plot3.png", width=480, height=480)
plot(datetime, hpower$Sub_metering_1, type="l",xlab="", ylab="Energy sub metering")
lines(datetime, hpower$Sub_metering_2, type="l", col="red")
lines(datetime, hpower$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()