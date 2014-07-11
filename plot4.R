plot4<-function(){
	
	skip<-66637
	finish<-69517
	names<-scan("household_power_consumption.txt",nlines=1,what="character",sep=";")
	Data<-read.table("household_power_consumption.txt",header=F,sep=";",col.names=names,na.strings="?",nrows=finish-skip,skip=skip)
	Data[["Date"]]<-as.Date(Data[["Date"]],"%d/%m/%Y")
	datetime<-strptime(paste(Data[["Date"]],Data[["Time"]]),"%Y-%m-%d %H:%M:%S")
	row.names(Data)<-datetime
	
	
	
	p1<-function() plot(strptime(rownames(Data),"%Y-%m-%d %H:%M:%S"),Data[[3]],type="l",main=NULL,ylab="Global Active Power (kilowatts)",xlab="")
	p2<-function() with(Data,plot(strptime(rownames(Data),"%Y-%m-%d %H:%M:%S"),Voltage,type="l",xlab="date/time"))
	p3<-function(){
		with(Data,plot(strptime(rownames(Data),"%Y-%m-%d %H:%M:%S"),Sub_metering_1,"l",xlab="",ylab="Energy sub metering"))
 		with(Data,points(strptime(rownames(Data),"%Y-%m-%d %H:%M:%S"),Sub_metering_3,"l",col="blue"))
 		with(Data,points(strptime(rownames(Data),"%Y-%m-%d %H:%M:%S"),Sub_metering_2,"l",col="red"))
		legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)
 	}
	p4<-function() with(Data,plot(strptime(rownames(Data),"%Y-%m-%d %H:%M:%S"),Global_reactive_power,type="l",xlab="date/time"))
	
	
	png("plot4.png")
	par(mfrow=c(2,2))
	p1()
	p2()
	p3()
	p4()
	dev.off()
}








	with(Data,plot(strptime(rownames(Data),"%Y-%m-%d %H:%M:%S"),Voltage,type="l",xlab="date/time"))
with(Data,plot(strptime(rownames(Data),"%Y-%m-%d %H:%M:%S"),Global_reactive_power,type="l",xlab="date/time"))