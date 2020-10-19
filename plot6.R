
## 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from 
##    motor vehicle sources in Los Angeles County, California 
##    (fips == "06037"). 
##    Which city has seen greater changes over time in motor vehicle emissions?



library(dplyr)
library(ggplot2)

## filter vehicle
SCC_vehicle <- SCC[grep("[Vv][Ee][Hh][Ii][Cc][Ll][Ee]", SCC$EI.Sector), "SCC"]

## filter vehicle & county
NEI_BC_LA_vehicle <- NEI %>% 
  filter(SCC %in% SCC_vehicle & (fips == "24510" | fips == "06037")) %>% 
  group_by(year, fips) %>%
  summarise(Emissions=sum(Emissions))

## create county name mapping
county_map <- data.frame(fips=c("24510", "06037"), county=c("Baltimore City", "Los Angeles County"))

NEI_BC_LA_vehicle <- merge(NEI_BC_LA_vehicle, county_map, by="fips")

## plot
png(file="plot6.png", width = 800, height = 480)

g <- ggplot(NEI_BC_LA_vehicle, aes(as.character(year), Emissions, fill=county, color=county, label=round(Emissions,0)))
g + geom_col() + facet_wrap(. ~ county, scales="free") + 
  geom_label(aes(fill=county), colour="white", fontface="bold") +
  labs(x="Year", y=expression(PM[2.5] * " Emissions in Tons"), 
  title=expression(PM[2.5] * " Emissions from Motor Vehicle Sources in Baltimore City vs. Los Angeles County"))

dev.off()