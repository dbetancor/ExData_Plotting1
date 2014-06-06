#Get the Data

hel <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F)

#New column with date
strptime(sprintf("%s %s", hel$Date, hel$Time), "%d/%m/%Y %H:%M:%S") -> hel$Fecha


#mon 0 to 11 cookboook p.174
#We take only those 2 days
hel[(hel$Fecha$year + 1900) == 2007 & hel$Fecha$mon == 1 & (hel$Fecha$mday == 1 | hel$Fecha$mday == 2),] -> hel2007

#print                                                                                                                             
par(bg = "white")                                                                                                                  
with(hel2007, plot(Fecha, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
                                                                                                                                   
#to png                                                                                                                            
dev.copy(png, file = "plot2.png")                                                                                                  
dev.off()                                                                                                                          


