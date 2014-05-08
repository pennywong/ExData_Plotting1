# read the data
col_name <- colnames(read.table("household_power_consumption.txt", nrow = 1,header = TRUE, sep=";"))
hpc <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";", col.names = col_name)

# hist
png("plot1.png")
hist(hpc$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()