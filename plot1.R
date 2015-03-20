## plot1.R - Question 1 
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
## for each of the years 1999, 2002, 2005, and 2008.

## Upload a PNG file containing your plot addressing this question.

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##combineddata <- tapply(NEI$Emissions, NEI$year, sum)

## Collect aggregate and place into new dataset
combineddata<-with(NEI, aggregate(Emissions, by=list(year), sum))

## Start plotting using base plot
png("plot1.png")
plot(##names(combineddata), combineddata, 
      combineddata, 
      type="l",
      xlab="Year", 
      ylab="Total PM2.5 emissions",
      main="Total US Emissions by Year"
    )
dev.off()