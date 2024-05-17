# Load the necessary library
library(readxl)

# Read the data from the Excel file
data <- read_excel("C:/Users/HP/Downloads/Cancer (1).xlsx")

# Subset the relevant columns
data_subset <- data[c("PovertyEst", "medIncome","popEst2015", "incidenceRate", "deathRate")]

# Calculate the correlation matrix
correlation_matrix <- cor(data_subset, use = "complete.obs", method = "pearson")

# Print the correlation matrix
print(correlation_matrix)
