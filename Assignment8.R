# --------------------------------------------------------------------
# SECTION 1: COURSE AND ASSIGNMENT DETAILS
# --------------------------------------------------------------------
# Course      : LIS 4370 - R
# Assignment  : Assignment 8 - Data Analysis with R
# URL         : [Insert Course URL Here]
# Filename    : Assignment8.R
# Purpose     : Analyze a student dataset by calculating mean grades and ages by sex and filtering names with 'i'
# Author      : Steven Barden
# Email       : StevenBarden@usf.edu
# Created     : 2025-03-10-0100 (EST)
# Updated     : 2025-03-10-1020 (EST)
# License     : UltraFree
# Description : This script imports a student dataset, computes mean grades and ages by sex using plyr,
#               filters names containing 'i', and exports results to CSV files. It is designed to be
#               compiled into an HTML document for blog posting with detailed commentary.

# --------------------------------------------------------------------
# SECTION 2: ENVIRONMENT SETUP
# --------------------------------------------------------------------

# Set the working directory to the project folder
# This ensures all file operations (e.g., reading DataSet.txt) occur in the correct location
# Note: Replace with your actual path if different
setwd("C:/Users/Steve/OneDrive/College/_____DESKTOP ICONS/2025-USF-Spring/4370/Module08")

# Install and load the plyr package for data manipulation
# plyr is used for splitting and applying functions to subsets of data
# The if statement checks if plyr is installed to avoid reinstallation errors
if (!requireNamespace("plyr", quietly = TRUE)) {
  install.packages("plyr", dependencies = TRUE, update = FALSE)  # Install if not present
}
library(plyr)  # Load plyr for use

# --------------------------------------------------------------------
# SECTION 3: DATA PROCESSING AND ANALYSIS
# --------------------------------------------------------------------

# Load the student dataset from a text file
# DataSet.txt is expected to have a header row and comma-separated values
# Error handling is implicit here; ensure the file exists to avoid runtime issues
Student <- read.table("DataSet.txt", header = TRUE, sep = ",")
cat("Dataset loaded with", nrow(Student), "rows and", ncol(Student), "columns.\n")

# Calculate the mean grade by sex using ddply
# ddply splits the data by 'Sex', applies mean(Grade) to each group, and transforms the result
# This creates a new column 'Grade.Average' for each row within the same sex group
StudentGradeAverage <- ddply(Student, "Sex", transform, Grade.Average = mean(Grade))

# Calculate the mean age by sex using ddply
# Similar to above, but for the 'Age' column, adding 'Age.Average' to the dataset
StudentAgeAverage <- ddply(Student, "Sex", transform, Age.Average = mean(Age))

# Display mean grades by sex
# Extracts the unique mean for each sex by averaging the 'Grade.Average' column
# Uses logical indexing to separate Female and Male groups
cat("Mean grades - Female:", mean(StudentGradeAverage$Grade.Average[StudentGradeAverage$Sex == "Female"]),
    "Male:", mean(StudentGradeAverage$Grade.Average[StudentGradeAverage$Sex == "Male"]), "\n")

# Display mean ages by sex
# Similar to grade output, but for 'Age.Average'
cat("Mean ages - Female:", mean(StudentAgeAverage$Age.Average[StudentAgeAverage$Sex == "Female"]),
    "Male:", mean(StudentAgeAverage$Age.Average[StudentAgeAverage$Sex == "Male"]), "\n")

# Export the grade averages to a CSV file
# row.names = FALSE prevents adding row numbers; col.names = TRUE keeps the header
write.table(StudentGradeAverage, "Grade_Average_by_Sex.csv", sep = ",", row.names = FALSE, col.names = TRUE)
cat("Results exported to Grade_Average_by_Sex.csv.\n")

# Export the age averages to a CSV file
write.table(StudentAgeAverage, "Age_Average_by_Sex.csv", sep = ",", row.names = FALSE, col.names = TRUE)
cat("Results exported to Age_Average_by_Sex.csv.\n")

# Filter students whose names contain 'i' or 'I' (case-insensitive)
# grepl() searches for the pattern 'i' in the 'Name' column
i_students <- subset(Student, grepl("i", Name, ignore.case = TRUE))
cat("Filtered", nrow(i_students), "names containing 'i' or 'I'.\n")

# Export the filtered dataset to a CSV file
# quote = FALSE prevents quoting of strings, keeping output clean
write.table(i_students, "i_students.csv", sep = ",", row.names = FALSE, quote = FALSE)
cat("Filtered data exported to i_students.csv.\n")

# --------------------------------------------------------------------
# SECTION 4: METADATA AND OUTPUT
# --------------------------------------------------------------------

# Generate live date-time stamp for reproducibility
# Formats the current time as '2025-mm-dd-hhmm-ss'
format(Sys.time(), "2025-%m-%d-%H%M-%S")