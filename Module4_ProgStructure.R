Freq <- c(0.6,0.3,0.4,0.4,0.2,0.6,0.3,0.4,0.9,0.2)
bloodp <- c(103,87,32,42,59,109,78,205,135,176)
first <- c(1,1,1,1,0,0,0,0,NA,1)
second <- c(0,0,1,1,0,0,1,1,1,1)
finaldecision <- c(0,1,0,1,0,1,0,1,1,1)

df <- data.frame(Freq,bloodp,first,second,finaldecision)

boxplot(df$Freq ~ df$finaldecision,
        main="Hospital visits relation to blood pressure assessments",
        xlab="Blood Pressure",
        ylab="Frequency",
        names=c("low","high"))
boxplot(df$bloodp ~ df$finaldecision,
        main="Measured blood pressure relation to assessments",
        xlab="Assessment",
        ylab="Blood Pressure",
        names=c("low","high"))
hist(df$bloodp,
     xlab="Blood Pressure")
mean(df$finaldecision)