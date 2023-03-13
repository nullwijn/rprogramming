library(ggplot2)
library(lattice)

df <- read.csv("InfantMortality2010.csv")

xyplot(Mortality ~ Year, data = df, type = "b", main = "Global Infant Mortality Rate by the Decade")

ggplot(df, aes(x = Year, y = Mortality)) +
  ggtitle("Global Infant Mortality Rate by the Decade") +
  geom_line(color = "blue") +
  geom_point(color = "red") +
  geom_text(aes(label = Mortality), nudge_y = 3)

bp <- barplot(df$Mortality, names.arg = df$Year, col = "blue", main = "Global Infant Mortality Rate by the Decade")