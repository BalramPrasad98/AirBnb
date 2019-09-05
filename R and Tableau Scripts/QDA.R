

data <- read.csv("airbnb_clean.csv")
data1 <- data[,-c(1:5,8,11,17)]

#CV
# Allocate 80% of the data to a training set and 20% to a test set
N <- nrow(data1)
target <- round(.80*N)
gp <- runif(N)
training <- data1[gp < .80,]
test <- data1[gp >=.80,]

# note that we have fairly even number of obs for each group

#======= QDA
library(MASS)
qda1 <- qda(price_range ~accommodates + bathrooms+neighbourhood_group_cleansed+room_type, data=training)
pred_qda <- predict(qda1, newdata = test)
# result
result <- table(True = test$price_range, Predicted = pred_qda$class)
result

# accuracy (TP+TN)/(P+N)
(803+537+2101+1542)/sum(result)

#======= 0 - 69
# sensitivity
803/sum(result[1,])
# specificity
(537+2101+1542)/(sum(result[2:4,]))

#======= 69 - 106
# sensitivity TP/(TP+FN) 
1542/sum(result[4,])
# specificity TN/(TN+FP)
(537+2101+803)/(sum(result[1:3,]))

#======= 106 - 175
# sensitivity TP/(TP+FN) 
537/sum(result[2,])
# specificity TN/(TN+FP)
(1542+2101+803)/(sum(result[c(1,3,4),]))

#======= 175 +
# sensitivity TP/(TP+FN) 
2101/sum(result[3,])
# specificity TN/(TN+FP)
(1542+537+803)/(sum(result[c(1,2,4),]))

# roc
# library(pROC)
# numeric_actual <- ifelse(test$price_range == "$0 - $69", 1, ifelse(test$price_range == "$106 - $175.0", 3, ifelse(test$price_range == "$69 - $106", 2, 4)))
# numeric_qda <- ifelse(pred_qda$class == "$0 - $69", 1, ifelse(pred_qda$class == "$106 - $175.0", 3, ifelse(pred_qda$class == "$69 - $106", 2, 4)))
# 
# 
# roc2 <- roc(numeric_actual, numeric_qda)
# 
# ROCdata2 <- data.frame(Sensitivity = roc2$sensitivities, 
#                        OneMinusSpecificity = 1-roc2$specificities)

#======= LDA
# check assumptions: similar correlation matrix
library(GGally)
ggcorr(data1[data1$price_range == "$0 - $69", -1], label=TRUE)
ggcorr(data1[data1$price_range == "$106 - $175.0", -1], label=TRUE)
ggcorr(data1[data1$price_range == "$69 - $106", -1], label=TRUE)
ggcorr(data1[data1$price_range == "$175.0+", -1], label=TRUE)

# QDA
lda1 <- lda(price_range ~., data=training)
pred_lda <- predict(lda1, newdata = test)
# result
table(True = test$price_range, Predicted = pred_lda$class)

# roc
# numeric_lda <- ifelse(pred_lda$class == "$0 - $69", 1, ifelse(pred_lda$class == "$106 - $175.0", 3, ifelse(pred_lda$class == "$69 - $106", 2, 4)))
# roc1 <- roc(numeric_actual, numeric_lda)
# auc(roc1)
# auc(roc2) 


