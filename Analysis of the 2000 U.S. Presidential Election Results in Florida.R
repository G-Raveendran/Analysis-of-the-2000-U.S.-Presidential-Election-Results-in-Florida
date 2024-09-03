

############Analysis of the 2000 U.S. Presidential Election Results in Florida

#In 2000 Bush and Gore were the main candidates for President in the U.S. Buchanan, a strongly conservative candidate, was also on the ballot. In the state of Florida, Bush and Gore essentially tied, hence the counts were examined carefully county by county. 

#Palm Beach County exhibited strange results. Even though the people in this county are not conservative, many votes were cast for Buchanan. Examination of the voting ballot revealed that it was easy to mistakenly vote for Buchanan (a conservative candidate) when intending to vote for Gore. We will thus predict whether those who voted for Buchanan were indeed going for a conservative candidate.
#Review the 2000 election results in Florida, focusing on the application of identifying outliers in simple linear regression and its implications

#Read data with read.table R command which is used for reading Ascii files
elections = read.table("elections-2.txt",header = TRUE)
#check the data content
elections[1:4,]
#The data file includes many other variables characterizing the counties. We will focus only on the number of votes in this analysis.

#Extract the no of votes for each candidates
buch <- elections$buch
bush <- elections$bush

#Visualize the relationship between no of votes between buchanan and Bush
plot(bush,buch, xlab = "No of votes for Bush",ylab="No of votes for Buchanan",main = "Number of votes by county in Florida")

# Generally, the votes for bush increase as votes for Buchanan increase.
# It appears to be fairly linear, but with slight curviture.
# There are a couple of outliers.

cor(buch,bush)
# I would say that the line appears to be curvilinear and therefore
# simple linear regressions would not capture the non-linearities.
# However there does appear to be a linear relationship, positive, that
# is supported by the correlation and visual inspection of the
# scatter plot.

#Linearity Assumption:
#The scatterplot shows a strong positive relationship between the number of votes for the two candidates except for two outliers, one corresponding to the Palm Beach county. The correlation is high also (0.625).
#Curvature in the relationship – consider transformations

#linearity using Transformation 
### Transform both variables using the log-transformation
plot(log(bush),log(buch),xlab="Log of no of votes for bush",ylab = "log of no of votes for buch"
     ,main = "no of votes by county in florida")
cor(log(bush),log(buch))

#The linear relationship has improved with the transformations
#The correlation has increased from 0.625 to 0.922
#We will perform the regression analysis using the transformed data

#Fit a model
model <- lm(log(buch)~log(bush),data = elections)
summary(model)
##### model interpretation
## obtain estimated coefficient
betas = coef(model)
betas
# Interpretation
# as number of votes for bush increase by 1% the expected % increase
# of votes for buch is 0.756, and the standard error is .03934

## Confidence intervals for the coefficients
confint(model)

#residual analysis

par(mfrow=c(2,2))
plot(log(bush),resid(model),main="Predictor vs Residuals")
abline(0,0)

plot(fitted(model),resid(model),main = "Fitted vs Residuals",xlab = "fitted values")
abline(0,0)

qqnorm(resid(model),main = "QQ-plot of residuals")
qqline(resid(model))
hist(resid(model),main = "Histogram of Residuals")


## Validity of linear assumption, by plot 1, validated.
# Looks like maybe one outlier, 2,3,4.
# Normality of Errors plot 3,4 looks like there is a negative outlier by QQ and hist
# Hetero sekdasticity. Plot 2. Appears fairly constant, excepting a couple negative outliers

#Is palm beach an outlier?

## omit palm beach
model.red = lm(log(buch[-50])~log(bush[-50]))
summary(model.red)
# The slope and intercept term both change.
# In the model dropping PB the intercept is higher.
# Hoever the confidence intervals overlap => no real change in slope.
# Residuals are similar. QQ plot slightly better. The large negative resid is gone
# removing some of the skew in the distribution.

#Obtain the predicted vote count for Palm Beach given the fitted model without
new = data.frame(bush = bush[50])
## The difference between predicted on the original scale and the observed vote count 
buch[50 ]-exp(predict(model.red,new))

#Prediction Confidence Interval for log(vote count) 
predict(model.red,new,interval='prediction',level=.95)
## Prediction Confidence Interval on the original scale 
exp(predict(model.red,new,interval='prediction',level=.95))
#Is the observed vote count in the prediction interval?
buch[50]  

## Therefore, what we can say is that it is likely that Palm Beach is a different community
# That comes from a different model than the rest of the 

####### Interpretation 
#The difference between predicted and observed vote count for Bush in the Palm Beach county is 2809.
#The upper bound of the prediction confidence interval for the vote count is 1412 which is much lower than the observed vote count, 3407.
#While a difference of 2809 votes is not large given the total U.S. votes, this was particularly decisive for the 2000 elections. 
#Recall that George W. Bush won Florida by a margin of 537 votes. 

#############Summary
#Using simple linear regression, demonstrated that one important county in Florida was an outlier in the  2000 presidential election due to its ballot, indicating the potential of this discovery on the election results. 
