## plot5.R - Question 5 
## How have emissions from motor vehicle sources 
## changed from 1999–2008 in Baltimore City?

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Use ggplot
library(ggplot2)

## Baltimore-Maryland DataSet
NEIBaltimore <- NEI[NEI$fips=="24510",]

## Pick vehicle data
## I used 
## grep("vehicle", levels(SCC$SCC.Level.Four), ignore.case=TRUE)
## To find the word vehicle :(
vehicledatalocation<- grepl("vehicle", levels(SCC$SCC.Level.Two), ignore.case=TRUE)
## Generate SCC Subset
vehicledata<-SCC[vehicledatalocation,]

## merge the two data sets on the identifier code SCC$SCC
mergedata<-merge(NEIBaltimore,vehicledata, by="SCC")

##Plotting using geom_bar
png("plot5.png", width=800, height=800)
g<- ggplot(mergedata, aes( factor(year), Emissions))
p<-g+ geom_bar(stat="identity")+ xlab("Year")+ ylab("PM2.5 Vehicle emissions in maryland-Baltimore") + ggtitle("Total Vehicle Emissions in Baltimore over years")

print(p)

dev.off()