library(plyr)
library(data.table)

myTable <- read.table("Assignment6Dataset.txt", header = TRUE, sep = ",")
#I kept getting errors when trying to use the code provided on the assignment page, so I decided to list the comma as a separator to fix the data.
#There are a lot of spelling errors and capitilization problems in the assignment page, so I can't tell if the functions are also typed
#incorrectly or not.

StudentAverage = ddply(myTable,"Sex",summarize,Grade.Average=mean(Grade))
#Using summarize instead of transform makes it a simple 1x2 table instead of a clone of the first table with the average
#tacked on to each student.

write.table(StudentAverage, "Students_Gendered_Mean.tsv")

i_students <- subset(as.data.frame(myTable), grepl("i", Name, ignore.case=T))

write.csv(i_students, "I_Students.csv")