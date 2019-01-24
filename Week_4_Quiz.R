
##### Problem 1 ##### 

if(!file.exists("idaho.csv")){
  fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  download.file(fileurl, destfile = "./idaho.csv", method = "curl")
}
idaho <- read.csv("./idaho.csv")
strsplit(colnames(idaho), "wgtp")[123]


##### Problem 2-4 ##### 

if(!file.exists("GDP.csv")){
  fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  download.file(fileurl, destfile = "./GDP.csv", method = "curl")
}
GDP <- read.csv("./GDP.csv")
GDP_clean <- GDP[grep("^[1-9]",GDP$Gross.domestic.product.2012),]

if(!file.exists("edu.csv")){
  fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
  download.file(fileurl, destfile = "./edu.csv", method = "curl")
}
EDU <- read.csv("./edu.csv")

#2
GDP_clean$GDP <- gsub(",","",GDP_clean$X.3)
mean(as.numeric(GDP_clean$GDP))

#3
grep("United",GDP_clean$X.2, value = TRUE)

#4 
merge <- merge(GDP_clean, EDU, by.x = "X", by.y = "CountryCode")
merge$Gross.domestic.product.2012 <- as.numeric(as.character(merge$Gross.domestic.product.2012))
length(grep("fiscal\\syear\\send\\:\\sjune",tolower(merge$Special.Notes), value = TRUE))


##### Problem 5 #####

library(quantmod)
library(lubridate)

amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
year2012 <- sampleTimes[year(sampleTimes) == 2012]
length(year2012)
length(year2012[weekdays(year2012) == "Monday"])
