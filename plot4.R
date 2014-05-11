# Given that after using ReadLines on the first 10 lines of the lines 
# We see that the records start on 16th Dec 2006 and are taken every minutes
# taking the sample for the next 50 days means we would need 50*60*24 records 
# Reading on the first 80,000 rows along with the heade
table<-read.table("data_household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE,nrows=72000)
#format the table$Date in Date Format
table$Date<-as.Date(table$Date,"%d/%m/%Y")
#format the table$Time in Time Format
#created a newT variable that combines both Date and Time
table$newT<-paste(table$Date,table$Time,sep= " ")

table$newT<-strptime(table$newT,"%Y-%m-%d %H:%M:%S")

#subset the table based on dates we are interested in 

sub_table<-subset(table,Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02") )

par(mfrow=c(2,2))
# Plot1 
plot(sub_table$newT,sub_table$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
# Plot2 

# Plot3

# plot4 

dev.copy(png,"plot4.png")
dev.off()
