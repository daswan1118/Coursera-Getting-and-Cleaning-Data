##### Problem 1&2 ##### 
data <- read.csv("~\\data.csv")
colnames(data)
noNA <- data[!is.na(data$VAL),]
nrow(noNA[noNA$VAL == 24,])

##### Problem 3 ##### 
library(xlsx)
dat <- read.xlsx("~\\data.xlsx", 
                  sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T)

##### Problem 4 ##### 
library(XML)
doc <- xmlParse("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml")
rootNode <- xmlRoot(doc)
length(xpathSApply(rootNode, "//zipcode", xmlValue)[xpathSApply(rootNode, "//zipcode", xmlValue) == 21231])

##### Problem 5 ##### 
library(data.table)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",
              destfile = "~\\idaho.xlsx")
DT <- fread("~\\idaho.xlsx", sep=",")
system.time(mean(DT[DT$SEX==1,]$pwgtp15) + mean(DT[DT$SEX==2,]$pwgtp15))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT$pwgtp15,by=DT$SEX))
# system.time(rowMeans(DT)[DT$SEX==1])
# systemtime(rowMeans(DT)[DT$SEX==2])
