
## Reading the data
# setting wd
setwd("./R/EDA_Project_1")

# loading file
df_hpc_raw <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                         colClasses=rep("character",9)
)
# subsetting selected dates
df_hpc_sub <- df_hpc_raw[df_hpc_raw$Date=="2/2/2007"|df_hpc_raw$Date=="1/2/2007",]

# creating final data frame with proper column classes
df_hpc_final <- data.frame(DateTime=strptime(paste(df_hpc_sub$Date, df_hpc_sub$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"),
                           Global_active_power=as.numeric(df_hpc_sub$Global_active_power),
                           Global_reactive_power=as.numeric(df_hpc_sub$Global_reactive_power),
                           Voltage=as.numeric(df_hpc_sub$Voltage),
                           Global_intensity=as.numeric(df_hpc_sub$Global_intensity),
                           Sub_metering_1=as.numeric(df_hpc_sub$Sub_metering_1),
                           Sub_metering_2=as.numeric(df_hpc_sub$Sub_metering_2),
                           Sub_metering_3=as.numeric(df_hpc_sub$Sub_metering_3)
)


## PLOT 2
## Creating plot
plot(df_hpc_final$DateTime, df_hpc_final$Global_active_power,
     xlab="",
     ylab="Global Active Power (kilowatts)",
     type="l")

## copying PLOT 2 to png
dev.copy(png, file ="plot_2.png")
dev.off()
