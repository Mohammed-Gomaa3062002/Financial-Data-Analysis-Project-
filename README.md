# Financial Data Analysis Project

This project focuses on analyzing financial data using **SQL** and **MySQL**. It involves creating a database, loading financial data from a CSV file, and performing various analytical queries to extract insights such as yearly disbursements, average profit/loss rates, debt-to-income trends, and more.

## Features

- **Database Creation**: SQL scripts to create a MySQL database and table for financial data.
- **Data Loading**: Load financial data from a CSV file into the database.
- **Analytical Queries**: Perform complex SQL queries to analyze trends, calculate metrics, and identify key insights.
- **Key Metrics**:
  - Total disbursement and paid amounts per year.
  - Average profit and loss rates.
  - Debt-to-income ratio trends.
  - Monthly average disbursement.
  - Correlation between profit and loss rates.
  - Top years with the highest total paid amounts.

## Technologies Used

- **MySQL**: Relational database management system for storing and querying financial data.
- **SQL**: For database creation, data loading, and analytical queries.
- **CSV**: Data source for financial records.

## Installation

1. **Set Up MySQL**:
   - Install MySQL from [here](https://dev.mysql.com/downloads/installer/).
   - Start the MySQL server and log in:
     ```bash
     mysql -u root -p
     ```

2. **Clone the Repository**:
   ```bash
   git clone https://github.com/Mohammed-Gomaa3062002/Financial-Data-Analysis.git
   cd Financial-Data-Analysis
   ```

3. **Create the Database and Load Data**:
   - Run the `create_DB.sql` script to create the database and table:
     ```bash
     mysql -u root -p < create_DB.sql
     ```
   - Ensure the `project_data.csv` file is in the correct path and load it into the database.

4. **Run Analytical Queries**:
   - Execute the queries in `Financial_Analysis_Queries.sql` to analyze the data:
     ```bash
     mysql -u root -p data_financial < Financial_Analysis_Queries.sql
     ```

## Example Queries

1. **Total Disbursement and Paid Amount per Year**:
   ```sql
   SELECT 
       Year, 
       SUM(TotalDisbursement) AS TotalDisbursement, 
       SUM(TotalPaid) AS TotalPaid 
   FROM 
       financial_data 
   GROUP BY 
       Year;
   ```

2. **Average Profit and Loss Rate per Year**:
   ```sql
   SELECT 
       Year, 
       AVG(AverageProfit) AS AverageProfit, 
       AVG(AverageLossRate) AS AverageLossRate 
   FROM 
       financial_data 
   GROUP BY 
       Year;
   ```

3. **Debt-to-Income Ratio Trend**:
   ```sql
   SELECT 
       Year, 
       AVG(debtincome) AS AverageDebtIncome 
   FROM 
       financial_data 
   GROUP BY 
       Year;
   ```

4. **Top 3 Years with Highest Total Paid Amount**:
   ```sql
   SELECT 
       Year, 
       TotalPaid, 
       AverageDebtIncome 
   FROM 
       (SELECT 
            Year, 
            SUM(TotalPaid) AS TotalPaid, 
            AVG(debtincome) AS AverageDebtIncome 
        FROM 
            financial_data 
        GROUP BY 
            Year 
        ORDER BY 
            TotalPaid DESC 
        LIMIT 3) AS TopYears;
   ```

## Project Structure

```
Financial-Data-Analysis/
├── create_DB.sql               # Script to create database and load data
├── Financial_Analysis_Queries.sql  # Analytical SQL queries
├── project_data.csv            # Financial dataset (CSV)
├── README.md                   # Project documentation
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

---

**GitHub Repository**: [Financial Data Analysis](https://github.com/Mohammed-Gomaa3062002/Financial-Data-Analysis)  
**Author**: Mohamed Gomaa
**Contact**: mogommaa2002@gmail.com

--- 
