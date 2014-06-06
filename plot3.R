#Get the Data

hel <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F)

#New column with date
strptime(sprintf("%s %s", hel$Date, hel$Time), "%d/%m/%Y %H:%M:%S") -> hel$Fecha


#mon 0 to 11 cookboook p.174
#We take only those 2 days
hel[(hel$Fecha$year + 1900) == 2007 & hel$Fecha$mon == 1 & (hel$Fecha$mday == 1 | hel$Fecha$mday == 2),] -> hel2007

#print
par(bg = "white")

with(hel2007,{
   plot(Fecha, Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="", col = "black")
   lines(Fecha, Sub_metering_2, col = "red")
   lines(Fecha, Sub_metering_3, col = "blue")
})

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#to png
dev.copy(png, file = "plot3.png")
dev.off()


