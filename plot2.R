## 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
##    (fips == "24510") from 1999 to 2008? 
##    Use the base plotting system to make a plot answering this question.

## subsetting Baltimore City, Maryland data
NEI_baltimore <- subset(NEI, fips == 24510)

png(file="plot2.png", width = 480, height = 480)
par(mar=c(5,5,2,2))
barplot(tapply(NEI_baltimore$Emissions, NEI_baltimore$year, sum), ylim=c(0, 4000),
        main = expression("Total " * PM[2.5] * " Emissions by Years in Baltimore City, Maryland"), 
        xlab="Years", ylab=expression("Total " * PM[2.5] * " Emissions in Tons"), 
        col = c("lightblue", "mistyrose", "lavender", "cornsilk")
)
dev.off()