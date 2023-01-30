library(ggplot2)
library(reshape2)
#Step 1
air <- data.frame(airquality)
air
#Step 2
air <- na.omit(air)
air
#Step 3
hist(air$Ozone)
hist(air$Solar.R)
hist(air$Wind)
hist(air$Temp)

air$ScaleWind <- round(air$Wind)
boxplot(ScaleWind~Ozone, data=air)
#Step 4
air$Date <- as.Date(paste(1973,air$Month,air$Day, sep= "-"))
ozoneGraph <- ggplot(data=air, aes(x=Date, y=Ozone)) +
  geom_line(color="red")
ozoneGraph
solarGraph <- ggplot(data=air, aes(x=Date, y=Solar.R)) +
  geom_line(color="cyan")
solarGraph
scaleWindGraph <- ggplot(data=air, aes(x=Date, y=ScaleWind)) +
  geom_line(color="green")
scaleWindGraph
tempGraph <- ggplot(data=air, aes(x=Date, y=Temp)) +
  geom_line(color="red")
tempGraph

air$ScaleWind <- air$ScaleWind*10
meltAir <- melt(air, value.name = "value", id = c("Month","Day","Date","Wind"))

allGraph <- ggplot(data=meltAir, aes(x=Date, y=value, group=variable)) +
  geom_line(aes(color=variable))
allGraph
#Step 5
meltAir
heatmap <- ggplot(meltAir, aes(x=Date, y=variable)) + geom_tile(aes(fill=value), colour = "white") +
  scale_fill_gradient(low = "white", high = "blue")
heatmap
#Step 6
plot(air$Wind,air$Temp,pch=16,col = air$Solar.R,cex=air$Ozone/50)
#Step 7
#Do you see any patterns after exploring the data?
#Wind, Ozone, and Solar.R spike and dip at around the same times.
#What was the most useful visualization?
#The colored line graph was the easiest to follow, the scatterplot was the worst. I'm likely to blame for the scatterplot being so hard to read though.