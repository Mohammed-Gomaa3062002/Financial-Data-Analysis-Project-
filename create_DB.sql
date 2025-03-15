-- Active: 1720119298920@@127.0.0.1@3306

--Create database 
CREATE DATABASE data_financial
    DEFAULT CHARACTER SET = 'utf8mb4';

-- use data_financial DB
use data_financial; ALTER

--Create Table 
CREATE TABLE financial_data (
    Month DATE,
    Year INT,
    TotalDisbursement DECIMAL(15, 2),
    TotalPaid DECIMAL(15, 2),
    AverageProfit DECIMAL(5, 2),
    AverageLossRate DECIMAL(5, 2),
    debtincome DECIMAL(5, 2)
);

--Load csv file into financial_data 
LOAD DATA INFILE 'E:/Financial-Data-Analysis-main/Financial-Data-Analysis-main/project_data.csv'
INTO TABLE financial_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
