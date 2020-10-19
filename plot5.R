## 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(dplyr)
library(ggplot2)

## filter vehicle
SCC_vehicle <- SCC[grep("[Vv][Ee][Hh][Ii][Cc][Ll][Ee]", SCC$EI.Sector), "SCC"]
NEI_baltimore_vehicle <- NEI %>% filter(SCC %in% SCC_vehicle & fips == 24510) %>%
  group_by(year) %>%
  summarise(Emissions=sum(Emissions))



png(file="plot5.png", width = 600, height = 480)

g <- ggplot(NEI_baltimore_vehicle, aes(as.character(year), Emissions, fill=year, color=year))
g + geom_col() + labs(x="Year", y=expression(PM[2.5] * " Emissions in Tons"), 
                      title=expression(PM[2.5] * " Emissions from Motor Vehicle Sources in Baltimore City"))

dev.off()
