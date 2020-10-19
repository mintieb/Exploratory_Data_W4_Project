## 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##    Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
##    for each of the years 1999, 2002, 2005, and 2008.


## download file
fileurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileurl, destfile="./PM25_Emissions.zip", method="curl")
## unzip file
if(file.exists("./PM25_Emissions.zip")) {unzip("./PM25_Emissions.zip", exdir = ".")}

library(dplyr)

## load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## plot
png(file="plot1.png", width = 480, height = 480)
par(mar=c(5,5,2,2))
barplot(tapply(NEI$Emissions, NEI$year, sum)/1000, ylim=c(0, 8000),
        main = expression("Total " * PM[2.5] * " Emissions by Years"), 
        xlab="Years", ylab=expression("Total " * PM[2.5] * " Emissions in Kilotons"), 
        col = c("lightblue", "mistyrose", "lavender", "cornsilk")
)
dev.off()
