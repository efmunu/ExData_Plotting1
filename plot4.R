plot4<-function(){
  #Read data and then remove all lines that are not required
  hpc<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
  hpc$Date<-as.Date(strptime(hpc$Date,"%d/%m/%Y"))
  hpc<-hpc[hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02",]
  
  #Reset graphics device
  graphics.off()
  #Create a 2 by 2 matrix for four plots and use 0.75 times the default font size
  par(mfrow=c(2,2),cex=0.75)
  {
    #The following plots are pretty much plot 1-3 and one additional one
    plot(strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S"),hpc$Global_active_power,type="l",ylab="Global Active Power",xlab="")
    
    plot(strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S"),hpc$Voltage,type="l",ylab="Voltage",xlab="datetime")
    
    plot(strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S"),hpc$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
    lines(strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S"),hpc$Sub_metering_2,col="red")
    lines(strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S"),hpc$Sub_metering_3,col="blue")
    legend(bty="n","topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","blue","red"),lty=1)
    
    plot(strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S"),hpc$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
  }
  #Save as png
  dev.copy(png, file = "plot4.png",width=480,height=480)
  dev.off()
}