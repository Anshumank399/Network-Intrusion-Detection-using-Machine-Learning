library(randomForest)
#install.packages("caret")
library(caret)
library(e1071)
data <- read.csv (file="C:\\Users\\ANSHUMAN\\Desktop\\Semester 6\\Cyber Security\\Project\\corrected\\Book2.csv",header=T)
#data1 <- data[,c("SrcBytes", "DstBytes",  "DstHostSameSrvRate", "Count", "DstHostDiffSrvRate","Attack" )]
data1 <- data[,c("SameSrvRate", "LoggedIn",  "DstHostSameSrvRate", "DstHostSrvCount","Flag","Attack" )]
inTrain <- createDataPartition(y=data1$Attack,p=0.1, list=FALSE)
str (data)
training <- data1[inTrain,]
testing <- data1[-inTrain,]
dim <-nrow (training)
dim(training)
#data2 <- data.frame(SrvRerrorRate=0,RerrorRate=0,Flag="SF",DstHostRerrorRate=0,LoggedIn=0,ProtocolType="udp")
output.forest <- randomForest(Attack ~ ., data = training)
print(output.forest)
plot (output.forest)
pred <- predict(output.forest,testing) 
pred
str (data)