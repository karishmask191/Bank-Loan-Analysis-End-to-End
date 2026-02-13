# Datasets

This folder contains the datasets used for the Bank_Loan_Analysis_End-to-End project.
The data is organized to clearly show the difference between raw source files and processed (cleaned) data used for analysis and dashboards.

## Folder Structure

### Original_Dataset
Contains the raw source files exactly as received, without any modifications.

- `Finance_1.csv`  
  Raw loan-level attributes (loan amount, grade, term, interest rate, customer details, etc.)

- `Finance_2.xlsx`  
  Additional loan and credit attributes (credit history, revolving balance, delinquencies, etc.)

> These two files together represent the complete raw dataset.  
> They were provided as separate files and combined during data preparation.

---

### Cleaned_Dataset
Contains cleaned and analysis-ready versions of the data.

- `Cleaned_DS.csv`  
  Final combined dataset created by merging Finance_1 and Finance_2 after cleaning.  
  This file is used for KPI calculations and dashboard creation in Excel, Power BI, and Tableau.
  
- `Finance_1_Cleaned.csv`  
  Cleaned version of Finance_1 (standardized formats, handled missing values, corrected data types)

- `Finance_2_Cleaned.csv`  
  Cleaned version of Finance_2 (standardized formats, handled missing values, corrected data types)

---

## Data Cleaning Summary

The following data preparation steps were applied:

- Removed duplicate loan records  
- Standardized date formats  
- Converted percentage fields (interest rate, utilization) to numeric values  
- Handled missing values logically (e.g., filled defaults, retained valid nulls)  
- Standardized categorical values (term, employment length, home ownership)  
- Created derived fields for analysis (loan year, loan type, default flag)

---

## Usage

- **Original_Datasets** are kept for reference and reproducibility.  
- **Cleaned_Datasets** are used for analysis, KPI calculations, and dashboards.  
- The combined cleaned file is the single source of truth for reporting.
