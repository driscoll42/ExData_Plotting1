## Construct the plot and save it to a PNG file with a width of 480 pixels and
## a height of 480 pixels.

## Name each of the plot files as plot1.png, plot2.png, etc.

## Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the
## corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. 
## Your code file should include code for reading the data so that the plot
## can be fully reproduced. You should also include the code that creates the
## PNG file.

## Add the PNG file and R code file to your git repository

##Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3
##16/12/2006;17:24:00;4.216;0.418;234.840;18.400;0.000;1.000;17.000
##16/12/2006;17:25:00;5.360;0.436;233.630;23.000;0.000;1.000;16.000
##16/12/2006;17:26:00;5.374;0.498;233.290;23.000;0.000;2.000;17.000

##2007-02-01 and 2007-02-02

data <- read.delim("household_power_consumption.txt",sep=";",na.strings="?")
plotdata <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")
DateTime <- strptime(paste(plotdata$Date, plotdata$Time), "%d/%m/%Y %H:%M") 
png(file="plot4.png")
attach(mtcars)
par(mfrow=c(2,2))

with(plotdata,plot(DateTime,plotdata$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))

plot(DateTime, plotdata$Voltage,type="l",ylab = "Voltage")

plot(DateTime, plotdata$Sub_metering_1,type="l",xlab = "", ylab = "Energy sub metering")
par(new=TRUE)
plot(DateTime, plotdata$Sub_metering_2,col="red",type="l",ylim=c(0,38),axes = FALSE, xlab = "", ylab = "")
par(new=TRUE)
plot(DateTime, plotdata$Sub_metering_3,col="blue",type="l",ylim=c(0,38),axes = FALSE, xlab = "", ylab = "")
par(new=TRUE)
legend("topright",col=c("black","blue","red"), bty = "n", cex = 0.95, lty=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(DateTime, plotdata$Global_reactive_power,type="l",ylab = "Global_reactive_power")

dev.off()
