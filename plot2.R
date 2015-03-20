## plot2.R - Question 2 
## Have total emissions from PM2.5 decreased in the Baltimore City, 
## Maryland (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.

## Upload a PNG file containing your plot addressing this question.

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Baltimore-Maryland DataSet
NEIBaltimore <- NEI[NEI$fips=="24510",]

## Collect aggregate and place into new dataset
combineddata<-with(NEIBaltimore, aggregate(Emissions, by=list(year), sum))

## Start plotting using base plot
png("plot2.png")
plot(combineddata, 
  type="l",
  xlab="Year", 
  ylab="Total PM2.5 emissions in maryland-Baltimore",
  main="Total Maryland-Baltimore Emissions by Year"
)
dev.off()