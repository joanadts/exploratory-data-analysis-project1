#Load data
hpower_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?", stringsAsFactors=FALSE)

#Subset for only 2 days
hpower <- subset(hpower_full, hpower_full$Date %in% c("1/2/2007","2/2/2007"))
rm(hpower_full)

#make histogram
png("plot1.png", width=480, height=480)
hist(hpower$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()