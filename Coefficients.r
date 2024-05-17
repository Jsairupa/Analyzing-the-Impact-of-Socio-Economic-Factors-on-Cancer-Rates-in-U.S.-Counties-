# Load necessary package for reading Excel files
library(readxl)

# Load the data
data <- read_excel("C:/Users/HP/Downloads/Cancer (1).xlsx")

# Fit the linear regression model
model <- lm(incidenceRate ~ medIncome + PovertyEst, data = data)

# View the summary of the model
summary_output <- summary(model)

# Print the summary of the model to view detailed information
print(summary_output)

# Interpretation of coefficients
coefficients <- summary_output$coefficients

# Median Income Coefficient
coef_medIncome <- coefficients["medIncome", "Estimate"]
p_value_medIncome <- coefficients["medIncome", "Pr(>|t|)"]

# Poverty Estimates Coefficient
coef_PovertyEst <- coefficients["PovertyEst", "Estimate"]
p_value_PovertyEst <- coefficients["PovertyEst", "Pr(>|t|)"]

# Interpretation
cat("Coefficient for Median Income: ", coef_medIncome, "\n")
cat("P-value for Median Income: ", p_value_medIncome, "\n")
cat("Implication: A one unit increase in median income leads to a decrease in cancer incidence rate by ", coef_medIncome, "units, but this effect is not statistically significant (p-value = ", p_value_medIncome, ").\n\n")

cat("Coefficient for Poverty Estimates: ", coef_PovertyEst, "\n")
cat("P-value for Poverty Estimates: ", p_value_PovertyEst, "\n")
cat("Implication: A one unit increase in poverty estimates leads to an increase in cancer incidence rate by ", coef_PovertyEst, "units, but this effect is also not statistically significant (p-value = ", p_value_PovertyEst, ").\n")
