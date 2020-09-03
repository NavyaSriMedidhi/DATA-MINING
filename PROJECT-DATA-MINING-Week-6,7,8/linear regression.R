data_Train = read.csv(file.choose(),header=T)
data_Test = read.csv(file.choose(),header=T)
library(dplyr)
data_Train <-  data_Train %>% mutate (Item_Weight=replace(Item_Weight,Item_Weight=='',median(data_Train$Item_Weight)))
data_Train <-  data_Train %>% mutate (Outlet_Size=replace(Outlet_Size,Outlet_Size=='',NA))
data_Test <-  data_Test %>% mutate (Item_Weight=replace(Item_Weight,Item_Weight=='',median(data_Test$Item_Weight)))
data_Test <-  data_Test %>% mutate (Outlet_Size=replace(Outlet_Size,Outlet_Size=='',NA))

scatter.smooth(x=data_Train$Item_Type,y=data_Train$Item_Outlet_Sales,main=" item wise sales in outlets ")

model1 <- lm(Item_Outlet_Sales ~ Item_Identifier+Outlet_Identifier,data = data_Train)
summary(model1)
plot(model1)
prediction <- predict(model1,data_Test,interval = 'confidence')

prediction1 <- predict(model1,data.frame(Item_Identifier='FDZ02',Outlet_Identifier='OUT010'))
prediction

setwd("C:/Users/Venkaesh Neerukonda/Desktop/srimukha/data mining/project")
write.csv(prediction,"predictionresult.csv")

