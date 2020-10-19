## 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
##    which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
##    Which have seen increases in emissions from 1999–2008? 
##    Use the ggplot2 plotting system to make a plot answer this question.

library(dplyr)
library(ggplot2)

## filter by Baltimore City, Maryland data
## group by year and type
## sum emissions of year & type
NEI_baltimore_by_year <- NEI %>%
    filter(fips == 24510) %>%
    group_by(year, type) %>%
    summarise(Emissions=sum(Emissions))


png(file="plot3.png", width = 800, height = 480)

g <- ggplot(NEI_baltimore_by_year, aes(as.character(year), Emissions, fill = type, color=type))
g + geom_col() + facet_grid(. ~ type) + labs(x="Year", y=expression(PM[2.5] * " Emissions in Tons"), 
       title=expression(PM[2.5] * " Emissions by Years by Type in Baltimore City, Maryland"))

dev.off()

ggplot(NEI_baltimore, aes(factor(year), Emissions, fill=type)) + geom_bar(stat="identity") +facet_grid(.~type)
