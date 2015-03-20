## plot3.R - Question 3 
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
## variable, which of these four sources have seen decreases in emissions from 
## 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Use ggplot
library(ggplot2)

## Baltimore-Maryland DataSet
NEIBaltimore <- NEI[NEI$fips=="24510",]

## Start plotting using geom_point
png("plot3.png", width=800, height=800)
g<- ggplot(NEIBaltimore, aes( year, Emissions))
p<-g+ geom_point()+ facet_grid(.~type)+  xlab("Year")+ ylab("Emissions : Maryland-Baltimore") + ggtitle("Total Emissions by pollutant type")
      
print(p)
dev.off()