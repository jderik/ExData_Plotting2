## plot6.R - Question 6
## Compare emissions from motor vehicle sources in Baltimore City with emissions from 
## motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?

## This function returns the title for facet grids (Ref http://www.cookbook-r.com/Graphs/Facets_(ggplot2)/)
mf_labeller <- function(var, value){
  value <- as.character(value)
  if (var=="fips") { 
    value[value=="24510"] <- "Baltimore"
    value[value=="06037"]   <- "LA County"
  }
  return(value)
}

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Use ggplot
library(ggplot2)

## Baltimore-Maryland DataSet
NEIBaltimore <- NEI[NEI$fips=="24510",]

## California Dataset
NEICalif <- NEI[NEI$fips=="06037",]

## Pick vehicle data
## I used 
## grep("vehicle", levels(SCC$SCC.Level.Four), ignore.case=TRUE)
## To find the word vehicle :(
vehicledatalocation<- grepl("vehicle", levels(SCC$SCC.Level.Two), ignore.case=TRUE)
## Generate SCC Subset
vehicledata<-SCC[vehicledatalocation,]

## merge the two data sets (NEI and Baltimore) on the identifier code SCC$SCC for vehicular data
mergedatabaltimore<-merge(NEIBaltimore,vehicledata, by="SCC")
## merge the two data sets (NEI and LA County) on the identifier code SCC$SCC for vehicular data
mergedatacalifornia<-merge(NEICalif,vehicledata, by="SCC")

## Make a full merge of the two data sets above for baltimore and california
mergedata<-merge(mergedatabaltimore,mergedatacalifornia,all=TRUE)


##Plotting using geom_bar
png("plot6.png", width=800, height=800)
g<- ggplot(mergedata, aes( factor(year), Emissions))
p<-g+ geom_bar(stat="identity")+ xlab("Year")+ 
  ylab("Vehicle PM2.5 emissions") + 
  ggtitle("Total Vehicle Emissions Baltimore City vs LA County over the years") +
  facet_grid(.~fips, labeller=mf_labeller)

print(p)


dev.off()


