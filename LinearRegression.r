# Load the necessary libraries
library(dplyr)
library(readxl)

# Load the data from an Excel file
data <- read_excel("C:/Users/HP/Downloads/Cancer (1).xlsx")

# Remove rows with any NA values to ensure a clean dataset
cancer_data <- na.omit(cancer_data)

# Fit a linear model to the data
linear_model <- lm(incidenceRate ~ medIncome + PovertyEst, data = cancer_data)

# Summarize the linear model
summary(linear_model)

# Diagnostic plots
# Option 1: If you're running this in an interactive R session, try resizing your plotting window first.
# Option 2: If the window resizing doesn't work, or if you're running this as a script, you can create a new window or adjust margins.

# Approach 1: Create a larger plotting window
dev.new(width = 7, height = 7)
par(mfrow = c(2, 2))
plot(linear_model)

# Approach 2: Adjust the margins
# par(mar = rep(2, 4))
# par(mfrow = c(2, 2
# After plotting, you can reset the plotting parameters to their default
par(mfrow = c(1, 1))
