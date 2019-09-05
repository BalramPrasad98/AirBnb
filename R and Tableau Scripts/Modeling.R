## Data was imported manually

###modelling
fit1 <- lm(price ~ accommodates + bathrooms + neighbourhood_group_cleansed + room_type, data=data)
fit1
summary(fit1)
fit2 <- lm(price ~ 1, data=data)
summary(fit2)

anova(fit1, fit2)
head(data)
str(data)
# Coefficients
coefficients(fit1)

summary(data)
# Confidence Interval
confint(fit1, level=0.95)
CI <- predict(fit1, new.data=data, interval='confidence')
CI[641,]





#forward selection
null <- lm(price~1, data=data)
full <- lm(price ~ bedrooms + beds + bed_type + accommodates + bathrooms + neighbourhood_group_cleansed + room_type, data=data)
step(null, scope=list(lower=null, upper=full), direction="forward")

#backward selection
step(full, data=df, direction="backward")

#hybrid
step(null, scope=list(upper=full), direction="both")

#checking model assumptions
final <- lm(price ~ accommodates + room_type + neighbourhood_group_cleansed + bathrooms, data=data)
summary(final)

plot(final)

finalmodel <- data.frame(fitted = final$fitted.values,
                         residuals = final$residuals)
res<-rstandard(final)

plot(predict(), res, ylab="residuals", xlab="Price")
abline(0,0)

qqnorm(res)
qqline(res)

plot(predict(final), data$price, xlab="actual values", ylab="predicted values")
abline(a=0, b=1, col="red")


