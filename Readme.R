rawCece <- read.table("HABP_1RD_20020101_20211231_36703.csv", head = TRUE, sep = ";", skip = 5)
CeceDate <- as.Date(as.character(rawCece$Time), format = "%Y%m%d")
library(xts)
CeceRain <- xts(rawCece$r, CeceDate)

apply.monthly(CeceRain, sum)
apply.yearly(CeceRain, sum)
