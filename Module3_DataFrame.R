Name <- c("Jeb","Donald","Ted","Marco","Carly","Hillary","Bernie")
ABC <- c(4,62,51,21,2,14,15)
CBS <- c(12,75,43,19,1,21,19)

#Creating a data frame using vectors is simple, you just list them together as if you're making a vector out of them
election <- data.frame(Name, ABC, CBS)
election

#You can calculate the mean in multiple ways with multiple methods.
#I'm going to calculate the mean of each candidate's polling to get more accurate standings.
#Getting the overall mean of all the ABC results or CBS results is pretty useless, but I'll do it anyway as proof of concept.

#I made a for loop to calculate the mean, it iterates based on the amount of rows in the dataframe.
#Then, it concatenates with the name of the politician for a cleaner result.
for(x in 1:nrow(election)){
  cat(election$Name[x], ": ", (election$ABC[x]+election$CBS[x])/2, "\n", sep="")
}

mean(election$ABC)
mean(election$CBS)