
library(readxl)
# Read the data from Excel file (make sure this path is correct)
data <- read_excel("C:/Users/HP/Downloads/Cancer (1).xlsx")

# Assuming 'cancer_data' is your dataframe and 'incidenceRate' and 'medIncome' are the columns of interest
cancer_rate_quantiles <- quantile(cancer_data$incidenceRate, probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)
income_quantiles <- quantile(cancer_data$medIncome, probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)

cancer_data$CancerRateQuantile <- cut(cancer_data$incidenceRate, breaks = cancer_rate_quantiles, include.lowest = TRUE, labels = FALSE)
cancer_data$IncomeQuantile <- cut(cancer_data$medIncome, breaks = income_quantiles, include.lowest = TRUE, labels = FALSE)

# Table for cancer rate quantiles
cancer_rate_summary <- table(cancer_data$CancerRateQuantile)

# Table for median income quantiles
income_summary <- table(cancer_data$IncomeQuantile)

# Combine both for a comprehensive summary
combined_summary <- data.frame(
  CancerRateQuantile = cancer_rate_summary,
  IncomeQuantile = income_summary
)


# You might want to calculate some cross-tabulations to explore relationships between the two quantiles.
cross_tab <- xtabs(~ CancerRateQuantile + IncomeQuantile, data = cancer_data)

knitr::kable(combined_summary, caption = "Summary of Counties by Cancer Rate and Median Income Quantiles")
