## plot4.R - Question 4 
## Across the United States, how have emissions from coal combustion-related sources 
## changed from 1999–2008?


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Use ggplot
library(ggplot2)

## merge the two data sets on the identifier code SCC$SCC
mergedata<-merge(NEI,SCC, by="SCC")

## Find pattern that matches *coal*. Return vector of booleans for matches and non matches
coaldatamatches <- grepl("coal", mergedata$Short.Name, ignore.case=TRUE)

## Retrieve Coal Data
coaldata<-mergedata[coaldatamatches,]

##Plotting using geom_bar
  png("plot4.png", width=800, height=800)
g<- ggplot(coaldata, aes( year, Emissions))
p<-g+ geom_bar(stat="identity")+ xlab("Year")+ ylab("Coal Emissions") + ggtitle("Total Coal Emissions in US over years")

print(p)


dev.off()