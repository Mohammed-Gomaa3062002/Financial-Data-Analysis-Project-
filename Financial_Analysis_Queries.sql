-- Active: 1720119298920@@127.0.0.1@3306@data_financial

--using database :) 
use data_financial;

--1. total disbursement and total paid amount for each year
SELECT 
    Year, 
    SUM(TotalDisbursement) AS TotalDisbursement, 
    SUM(TotalPaid) AS TotalPaid 
FROM 
    financial_data 
GROUP BY 
    Year;

--2. Average profit and average loss rate for each year
SELECT 
    Year, 
    AVG(AverageProfit) AS AverageProfit, 
    AVG(AverageLossRate) AS AverageLossRate 
FROM 
    financial_data 
GROUP BY 
    Year;

--3. Trend of the debt to income ratio over the years
SELECT 
    Year, 
    AVG(debtincome) AS AverageDebtIncome 
FROM 
    financial_data 
GROUP BY 
    Year;

--4. Monthly average disbursement for each year
SELECT 
    Year, 
    AVG(TotalDisbursement) AS AverageMonthlyDisbursement 
FROM 
    financial_data 
GROUP BY 
    Year;

--5. Month with the highest total disbursement
SELECT 
    Month, 
    TotalDisbursement 
FROM 
    financial_data 
ORDER BY 
    TotalDisbursement DESC 
LIMIT 1;

--6. Calculate the percentage increase or decrease in total disbursement from one year to the next
SELECT 
    Year, 
    TotalDisbursement,
    LAG(TotalDisbursement) OVER (ORDER BY Year) AS PreviousYearDisbursement,
    ROUND(((TotalDisbursement - LAG(TotalDisbursement) OVER (ORDER BY Year)) / LAG(TotalDisbursement) OVER (ORDER BY Year)) * 100, 2) AS PercentageChange
FROM 
    (SELECT Year, SUM(TotalDisbursement) AS TotalDisbursement FROM financial_data GROUP BY Year) AS YearlyDisbursement;

--7. Determine the correlation between average profit rate and average loss rate
SELECT
    (AVG(AverageProfit * AverageLossRate) - AVG(AverageProfit) * AVG(AverageLossRate)) / 
    (STDDEV(AverageProfit) * STDDEV(AverageLossRate)) AS Correlation
FROM 
    financial_data;

-- 8.Identify the top 3 years with the highest total paid amount and the corresponding average debt to income ratio for those years
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
