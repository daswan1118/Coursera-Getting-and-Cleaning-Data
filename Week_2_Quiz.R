##### Problem 1 ##### 
# Source:  https://github.com/r-lib/httr/blob/master/demo/oauth2-github.r

library(httr)
library(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Get Application 
myapp <- oauth_app("github",
                   key = "fc65c30e41c8374f5b0f",
                   secret = "9b8cf4050cd7d75e35f6540c848c6ed003548235"
)

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp, cache=FALSE)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

# 5. json
reposJSON <- content(req, "text", "fromJSON")
reposDF <- fromJSON(reposJSON)
colnames(reposDF)
reposDF$name
reposDF$created_at[reposDF$name == "datasharing"]


##### Problem 2 & 3 ##### 

library(sqldf)

# 2 
acs <- read.csv("~\\acs.csv")
sqldf("select pwgtp1 from acs where AGEP< 50")

# 3
unique(acs$AGEP)
sqldf("select distinct AGEP from acs")


##### Problem 4 ##### 

library(XML)

con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])


##### Problem 5 ##### 

x <- read.fwf(
  file=url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"),
         skip=4,
         widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))
         
head(x)
sum(x[,4])
