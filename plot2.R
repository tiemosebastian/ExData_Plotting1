plot2<-function(){
	skip<-66637
	finish<-69517
	names<-scan("household_power_consumption.txt",nlines=1,what="character",sep=";")
	Data<-read.table("household_power_consumption.txt",header=F,sep=";",col.names=names,na.strings="?",nrows=finish-skip,skip=skip)
	Data[["Date"]]<-as.Date(Data[["Date"]],"%d/%m/%Y")
	datetime<-strptime(paste(Data[["Date"]],Data[["Time"]]),"%Y-%m-%d %H:%M:%S")
	row.names(Data)<-datetime
	
	png("plot2.png")
	plot(strptime(rownames(Data),"%Y-%m-%d %H:%M:%S"),Data[[3]],type="l",main=NULL,ylab="Global Active Power (kilowatts)",xlab="")
	dev.off()
}