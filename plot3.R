plot3<-function(){
  #Read data and then remove all lines that are not required
  hpc<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
  hpc$Date<-as.Date(strptime(hpc$Date,"%d/%m/%Y"))
  hpc<-hpc[hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02",]
  
  #Reset graphics device
  graphics.off()
  #change font size
  par(cex=0.75)
  #Plot on screen
  plot(strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S"),hpc$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
  #Add the other lines
  lines(strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S"),hpc$Sub_metering_2,col="red")
  lines(strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S"),hpc$Sub_metering_3,col="blue")
  #Add legend
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","blue","red"),lty=1)
  #Save as png
  dev.copy(png, file = "plot3.png",width=480,height=480)
  dev.off()
}