# Load necessary package for reading Excel files
library(readxl)

# Load the data
data <- read_excel("C:/Users/HP/Downloads/Cancer (1).xlsx")

# Fit the linear regression model
model <- lm(incidenceRate ~ medIncome + PovertyEst, data = data)

# View the summary of the model to check R-squared and Adjusted R-squared
summary_output <- summary(model)
print(summary_output$r.squared)  # R-squared
print(summary_output$adj.r.squared)  # Adjusted R-squared

# Plotting the diagnostic plots
par(mfrow = c(2, 2))  # Setup the graphics panel to show 4 plots
plot(model)  # Plot diagnostic plots

# Checking for homoscedasticity
# Plot residuals vs fitted values
plot(model$fitted.values, resid(model),
     xlab = "Fitted Values",
     ylab = "Residuals",
     main = "Residuals vs Fitted")
abline(h = 0, col = "red")

# Checking for normality
# QQ-plot of residuals
qqnorm(resid(model))
qqline(resid(model), col = "red")
