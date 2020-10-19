## 4. Across the United States, 
##    how have emissions from coal combustion-related sources changed from 1999–2008?

library(dplyr)
library(ggplot2)

## find SCC codes for coal combustion-related sources
SCC_coal <- SCC[grep("[Cc][Oo][Aa][Ll]", SCC$EI.Sector), "SCC"]
## filter NEI data by coal combustion-related sources
NEI_coal <- NEI %>% filter(SCC %in% SCC_coal) %>%
  group_by(year) %>%
  summarise(Emissions=sum(Emissions))

## plot
png(file="plot4.png", width = 600, height = 480)

g <- ggplot(NEI_coal, aes(as.character(year), Emissions/1000, fill=year, color=year))
g + geom_col() + labs(x="Year", y=expression(PM[2.5] * " Emissions in Kilotons"), 
                                             title=expression(PM[2.5] * " Emissions by Years from Coal Combustion-Related Sources"))

dev.off()
