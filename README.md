# Analysis-of-the-2000-U.S.-Presidential-Election-Results-in-Florida

# Overview
This project investigates the unusual voting patterns in Palm Beach County, Florida, during the 2000 U.S. Presidential Election. The analysis focuses on identifying outliers using simple linear regression to determine if the unexpected votes for Buchanan, a conservative candidate, in a non-conservative county were accidental or deliberate. This study has potential implications for understanding the impact of the voting ballot design on election results.

# Data
The data used in this analysis includes:

elections-2.txt: Contains election results by county in Florida, including the number of votes for Buchanan and Bush.
buch: Number of votes for Buchanan.
bush: Number of votes for Bush.

# Objectives
Analyze the relationship between votes for Bush and Buchanan across Florida counties.

Identify any counties where the voting pattern deviates significantly from the norm.

Determine if Palm Beach County is an outlier using regression analysis.

Understand the potential implications of the Palm Beach outlier on the 2000 U.S. Presidential Election outcome.

# Methodology

# 1. Data Preparation
Extract the number of votes for Buchanan and Bush.
# 2. Exploratory Data Analysis
Visualize the relationship between the number of votes for Bush and Buchanan using scatter plots.
Calculate the correlation between votes for Bush and Buchanan to assess linearity.
# 3. Regression Analysis
Fit a simple linear regression model to understand the relationship between votes for Buchanan and Bush.
Apply log transformation to both variables to improve linearity and increase correlation from 0.625 to 0.922.
Fit the transformed model and obtain the estimated coefficients.
Interpret the coefficient: A 1% increase in votes for Bush is associated with a 0.756% increase in votes for Buchanan.
# 4. Residual Analysis
Perform residual analysis to check the validity of linear regression assumptions:
Linearity: Confirmed by scatter plot of residuals.
Normality of Errors: Analyzed using Q-Q plot and histogram.
Homoscedasticity: Checked using residuals versus fitted values plot.
Identify Palm Beach County as a potential outlier.
# 5. Outlier Analysis
Remove Palm Beach County from the dataset and fit a reduced model.
Compare coefficients, intercepts, and residuals of the reduced model with the original model.
Predict the expected vote count for Buchanan in Palm Beach County based on the reduced model and compute the difference between observed and predicted values.
# 6. Prediction Analysis
Calculate the confidence interval for the predicted vote count in Palm Beach County.
Evaluate whether the observed vote count falls within the prediction interval.

# Findings

Outlier Identification: Palm Beach County is identified as an outlier due to a significant deviation from the expected voting pattern.
Regression Analysis: The difference between predicted and observed vote counts in Palm Beach County was 2,809 votes, much higher than the upper bound of the prediction confidence interval (1,412).
Election Impact: This discrepancy, although small in absolute terms, was significant in the context of the 2000 election, where George W. Bush won Florida by just 537 votes.
# Requirements
R
Required libraries: None specified
# How to Run
Load the data file elections-2.txt into your R environment.
Run the provided R script to perform the exploratory analysis, regression, and residual analysis.
Review the outputs to interpret the findings.

# Conclusion
The analysis indicates that Palm Beach County likely represents a different voting pattern due to its ballot design, potentially affecting the 2000 U.S. Presidential Election results.

# License
This project is licensed under the MIT License.

