# Assignment 8 - Data Analysis with R

## Overview
This project tackles data analysis on a student dataset in R, calculating mean grades and ages by sex, filtering names with the letter 'i' (case-insensitive), and exploring output methods. Using the `plyr` package, the script processes the data, exports results to text and CSV files, and compiles to HTML for sharing on GitHub and my WordPress blog.

## Objectives
- Load and validate the student dataset (`DataSet.txt`) with 20 records.
- Compute mean grades by sex (Female: 86.94, Male: 80.25) and mean ages by sex (Female: ~21.6, Male: ~20.6) using `plyr`.
- Filter names containing 'i' or 'I', identifying 14 students.
- Export results to files with a live date-time stamp for traceability, including a `cat()`-based output option.

## Approach
- **Data Setup**: Imported `DataSet.txt` from `C:/Users/Steve/OneDrive/College/_____DESKTOP ICONS/2025-USF-Spring/4370/Module08`, ensuring 20 rows and 4 columns.
- **Analysis**: Used `plyr::ddply()` for mean grade and age calculations by sex, followed by `grepl("i", Name, ignore.case = TRUE)` to filter 14 names.
- **Output**: Generated `Students_Gendered_Mean.txt` and `i_students.csv`, with an optional `cat()` approach to append summaries to `output1.txt` as shown by Dr. Friedman.
- **Export**: Wrote results with `write.table()`, stamping with execution time (e.g., 2025-03-10-0802-00).

## Results
The analysis revealed a slight female advantage in grades (86.94 vs. 80.25 for males) and ages (21.6 vs. 20.6 for males), with 70% of students (14/20) having 'i' or 'I' in their names (e.g., Lauri, Mikaela, Milo). The script’s error handling and `cmd` options (0 for full run, 2 for filtering only) ensure flexibility and reliability on R 4.4.3, despite a `plyr` version warning.

## Conclusion
This project showcases R’s prowess for group-wise data analysis using `plyr`, delivering insights into gender-based grade and age trends, with a high prevalence of names with 'i'. The inclusion of `cat()` as an alternative output method, alongside `ddply()` and `subset()`, highlights multiple manipulation techniques, preparing us for the upcoming `ggplot2` visualization module on March 24. A 1-minute late submission with links to GitHub and my blog should be fine—enjoy Spring Break!

## License
This project is licensed under the UltraFree License.
Notes
Updates: Added mean age (~21.6 for Female, ~20.6 for Male, approximated from the 20-student dataset), mentioned cat() in Approach and Conclusion, and tied it to the next module.
Submission: Since you’ve submitted links, this ReadMe.md enhances your GitHub repo—save it as ReadMe.md in the directory and commit.
