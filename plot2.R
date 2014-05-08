# read the data
col_name <- colnames(read.table("household_power_consumption.txt", nrow = 1,header = TRUE, sep=";"))
hpc <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";", col.names = col_name)

# resharp data
# combind the date and time and format it to Datetime
sub_data <- data.frame(DateTime=strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S"), Global_active_power=hpc$Global_active_power)

# plot
png("plot2.png")
plot(sub_data, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()