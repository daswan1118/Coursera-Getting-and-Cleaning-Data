##### Problem 1 ##### 

if(!file.exists("agriculture.csv")){
  fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  download.file(fileurl, destfile = "./agriculture.csv", method = "curl")
}
agriculture <- read.csv("./agriculture.csv")
agricultureLogical <- agriculture$ACR == 3 & agriculture$AGS == 6
which(agricultureLogical == TRUE)


##### Problem 2 ##### 

library(jpeg)

if(!file.exists("jeff.jpg")){
  fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
  download.file(fileurl, destfile = "./jeff.jpg", method = "curl")
}
imag <- readJPEG("./jeff.jpg", native=  TRUE)
quantile(imag, probs = .30, na.rm = TRUE)
quantile(imag, probs = .80, na.rm = TRUE)


##### Problem 3,4,5 ##### 

if(!file.exists("GDP.csv")){
  fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  download.file(fileurl, destfile = "./GDP.csv", method = "curl")
}
GDP <- read.csv("./GDP.csv")

if(!file.exists("edu.csv")){
  fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
  download.file(fileurl, destfile = "./edu.csv", method = "curl")
}
EDU <- read.csv("./edu.csv")

#3
GDP_clean <- GDP[grep("^[1-9]",GDP$Gross.domestic.product.2012),]
merge <- merge(GDP_clean, EDU, by.x = "X", by.y = "CountryCode")
merge$Gross.domestic.product.2012 <- as.numeric(as.character(merge$Gross.domestic.product.2012))
merge_sort <- merge[order(merge$Gross.domestic.product.2012, decreasing = TRUE),]
merge_sort$X.2[13]

#4
mean(merge$Gross.domestic.product.2012[as.character(merge$Income.Group) == "High income: OECD"])
mean(merge$Gross.domestic.product.2012[as.character(merge$Income.Group) == "High income: nonOECD"])

#5
breaks=c(quantile(merge$Gross.domestic.product.2012, probs = seq(0, 1, by = 0.20)))
merge$rank_break <- cut(merge$Gross.domestic.product.2012, breaks=breaks)
table(merge$rank_break, merge$Income.Group)
                        