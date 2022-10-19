rawCece <- read.table("HABP_1RD_20020101_20211231_36703.csv", head = TRUE, sep = ";", skip = 5)
CeceDate <- as.Date(as.character(rawCece$Time), format = "%Y%m%d")
library(xts)
CeceRain <- xts(rawCece$r, CeceDate)

write.zoo(apply.monthly(CeceRain, sum), "HaviCece.csv", sep = ";", dec = ",")
write.zoo(apply.yearly(CeceRain, sum), "ÉvesCece.csv", sep = ";", dec = ",")
