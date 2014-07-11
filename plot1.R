plot1<-function(){
	skip<-66637
	finish<-69517
	names<-scan("household_power_consumption.txt",nlines=1,what="character",sep=";")
	Data<-read.table("household_power_consumption.txt",header=F,sep=";",col.names=names,na.strings="?",nrows=finish-skip,skip=skip)
	Data[["Date"]]<-as.Date(Data[["Date"]],"%d/%m/%Y")
	datetime<-strptime(paste(Data[["Date"]],Data[["Time"]]),"%Y-%m-%d %H:%M:%S")
	row.names(Data)<-datetime
	
	png("plot1.png")
	hist(Data[[3]],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
	dev.off()
}