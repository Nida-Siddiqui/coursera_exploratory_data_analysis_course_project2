## This first line will likely take a few seconds. Be patient!
setwd("C:/Users/fkalsekar/Documents/R/")
archiveURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
archiveFile <- "./Data/exdata%2Fdata%2FNEI_data.zip"


if(!file.exists(archiveFile)) {
  archiveURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  if(Sys.info()["sysname"] == "Darwin") {
    	download.file(url=archiveURL,destfile=archiveFile,method="curl")
    } else {
    	download.file(url=url,destfile=archiveFile)
    	}
  }
if(!(file.exists("summarySCC_PM25.rds") && 
      	file.exists("Source_Classification_Code.rds"))) { unzip(archiveFile) }
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()
