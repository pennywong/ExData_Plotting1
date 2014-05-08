# read the data
col_name <- colnames(read.table("household_power_consumption.txt", nrow = 1,header = TRUE, sep=";"))
hpc <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";", col.names = col_name)

# resharp the data
sub_data <- data.frame(DateTime=strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1=hpc$Sub_metering_1, Sub_metering_2=hpc$Sub_metering_2, Sub_metering_3=hpc$Sub_metering_3)

# plot 3 lines
png("plot3.png")

with(sub_data, {
	plot(DateTime, Sub_metering_1, main = "", type="l", xlab="", ylab="Energy sub metering")
	lines(DateTime, Sub_metering_2, col = "red")
	lines(DateTime, Sub_metering_3, col = "blue")
	legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

dev.off()