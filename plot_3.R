
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


## PLOT 3
## Creating empty plot
plot(df_hpc_final$DateTime, df_hpc_final$Sub_metering_1,
     xlab="",
     ylab="Energy sub metering",
     type="n")
## Plotting sub metering 1
lines(df_hpc_final$DateTime, df_hpc_final$Sub_metering_1)
## Plotting sub metering 2
lines(df_hpc_final$DateTime, df_hpc_final$Sub_metering_2, col="red")
## Plotting sub metering 3
lines(df_hpc_final$DateTime, df_hpc_final$Sub_metering_3, col="blue")
## adding legend
legend("topright",
       lty=1,
       col=c("black","red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
)

## copying PLOT 3 to png
dev.copy(png, file ="plot_3.png")
dev.off()