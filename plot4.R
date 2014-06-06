#Get the Data

hel <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F)

#New column with date
strptime(sprintf("%s %s", hel$Date, hel$Time), "%d/%m/%Y %H:%M:%S") -> hel$Fecha


#mon 0 to 11 cookboook p.174
#We take only those 2 days
hel[(hel$Fecha$year + 1900) == 2007 & hel$Fecha$mon == 1 & (hel$Fecha$mday == 1 | hel$Fecha$mday == 2),] -> hel2007


#print
par(bg = "white") #background

par(mfrow = c(2, 2)) # muliple plots


#1
with(hel2007, plot(Fecha, Global_active_power, type="l", ylab="Global Active Power", xlab=""))

#2
with(hel2007, plot(Fecha, Voltage, type="l", ylab="Voltage", xlab="datetime"))



#3
with(hel2007,{
   plot(Fecha, Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="", col = "black")
   lines(Fecha, Sub_metering_2, col = "red")
   lines(Fecha, Sub_metering_3, col = "blue")
})
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4
with(hel2007, plot(Fecha, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime"))


#to png
dev.copy(png, file = "plot4.png")
dev.off()
