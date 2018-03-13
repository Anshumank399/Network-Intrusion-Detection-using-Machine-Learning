#install.packages("randomForest")
library(randomForest)
#set.seed(101)
data <- read.csv (file="C:\\Users\\ANSHUMAN\\Desktop\\Semester 6\\Cyber Security\\Project\\corrected\\Book2.csv",header=T)
#train=sample(1:nrow(data),300)
SameSrvRate <- data$SameSrvRate #29
Flag <- data$Flag #4
LoggedIn <- data$LoggedIn #12
RerrorRate <- data$RerrorRate
DstHostSrvRerrorRate <- data$DstHostSrvRerrorRate
SrvRerrorRate <- data$SrvRerrorRate
attack <-data$Attack
duration <-data$Duration
numberfailedlogin <-data$NumFailedLogin
#service <- data$Service
srcbyte <- data$SrcBytes
dstbyte <- data$DstBytes
output.forest <- randomForest(attack ~ srcbyte+dstbyte+numberfailedlogin + duration + SameSrvRate + Flag + LoggedIn + RerrorRate + DstHostSrvRerrorRate + SrvRerrorRate, 
                              data = data)
print(output.forest)
testData =data.frame(srcbyte=105, dstbyte=146, numberfailedlogin=0,duration=0, SameSrvRate=1, Flag="SF", LoggedIn = 0, RerrorRate=0, DstHostSrvRerrorRate=0, SrvRerrorRate=0)
predict(output.forest,testData)
