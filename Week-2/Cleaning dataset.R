oldfile<-read.csv("usedcars_noisy.csv",TRUE,",")
oldfile

mean<-mean(oldfile$price, 0, FALSE)
mean

median<-median(oldfile$mileage,FALSE)
median

oldfile$price <- replace(oldfile$price, oldfile$price<=0, mean)
oldfile$mileage <- replace(oldfile$mileage, oldfile$mileage <= 0, median)
oldfile

class(oldfile)
str(oldfile)
df <- data.frame(oldfile)
write.csv(df, file = "C:\\Users\\faniv\\Documents\\usedcars_clean.csv")

