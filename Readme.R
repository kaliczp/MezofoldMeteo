stationids <- read.table("stationids.txt")
filenames <- paste0("HABP_1RD_", stationids[,1], "_20020101_20211231_hist.zip")
urlhist <- "https://odp.met.hu/climate/observations_hungary/daily_rain/historical/"
temp <- tempfile()
download.file(paste0(urlhist, filenames[2]), temp)
rawCece <- read.table(unzip(temp), head = TRUE, sep = ";", skip = 5)
unlink(temp)

CeceDate <- as.Date(as.character(rawCece$Time), format = "%Y%m%d")
library(xts)
CeceRain <- xts(rawCece$r, CeceDate)

write.zoo(apply.monthly(CeceRain, sum), "HaviCece.csv", sep = ";", dec = ",")
write.zoo(apply.yearly(CeceRain, sum), "ÉvesCece.csv", sep = ";", dec = ",")
