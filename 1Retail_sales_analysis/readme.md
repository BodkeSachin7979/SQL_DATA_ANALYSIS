# 🛍️ Retail Sales Analysis SQL Project

[![SQL](https://img.shields.io/badge/SQL-PostgreSQL-blue.svg)](https://www.postgresql.org/)
[![Data Analysis](https://img.shields.io/badge/Data-Analysis-brightgreen.svg)](https://github.com/topics/data-analysis)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A comprehensive SQL data analysis project exploring retail sales data to uncover business insights, customer behavior patterns, and sales performance metrics.

## 📊 Project Overview

**Project Title**: Retail Sales Analysis  
**Database**: `retail_db`  
**Domain**: E-commerce & Retail Analytics

This project demonstrates essential SQL skills and techniques used by data analysts to explore, clean, and analyze retail sales data. Through a series of targeted SQL queries, we transform raw sales data into actionable business intelligence.

### 🎯 Key Objectives

- ✅ **Database Setup**: Create and populate a retail sales database
- ✅ **Data Quality Assurance**: Identify and handle missing values
- ✅ **Exploratory Data Analysis**: Understand dataset characteristics and distributions
- ✅ **Business Intelligence**: Answer critical business questions through SQL queries
- ✅ **Performance Insights**: Identify sales trends and customer behavior patterns

## 🗃️ Database Schema

```sql
CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,    
    sale_time TIME,
    customer_id INT,    
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,    
    cogs FLOAT,
    total_sale FLOAT
);
```

## 🔍 Data Exploration & Cleaning

### Initial Data Assessment
```sql
-- Total records in dataset
SELECT COUNT(*) FROM retail_sales; -- 📈 10,000+ transactions

-- Unique customer base analysis
SELECT COUNT(DISTINCT customer_id) FROM retail_sales; -- 👥 1,500+ unique customers

-- Product category distribution
SELECT DISTINCT category FROM retail_sales; -- 🏷️ Multiple categories including Clothing, Beauty, Electronics
```

### Data Quality Checks
```sql
-- Identifying missing values across all columns
SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

-- Cleaning: Removing incomplete records
DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```

## 📈 Business Intelligence Queries

### 1. 🗓️ Daily Sales Analysis
**Objective**: Retrieve all sales transactions for a specific date
```sql
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';
```

### 2. 👗 Category Performance - Clothing
**Objective**: Identify high-quantity clothing sales in November 2022
```sql
SELECT *
FROM retail_sales
WHERE 
    category = 'Clothing'
    AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
    AND quantity >= 4;
```

### 3. 💰 Revenue by Category
**Objective**: Calculate total sales and order count per product category
```sql
SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY category;
```

### 4. 💄 Customer Demographics - Beauty Category
**Objective**: Determine average age of beauty product customers
```sql
SELECT
    ROUND(AVG(age), 2) as avg_age
FROM retail_sales
WHERE category = 'Beauty';
```

### 5. 🏆 High-Value Transactions
**Objective**: Identify premium purchases exceeding $1000
```sql
SELECT * FROM retail_sales
WHERE total_sale > 1000;
```

### 6. 👥 Gender-Based Shopping Patterns
**Objective**: Analyze transaction distribution by gender across categories
```sql
SELECT 
    category,
    gender,
    COUNT(*) as total_trans
FROM retail_sales
GROUP BY category, gender
ORDER BY category;
```

### 7. 📅 Monthly Sales Performance
**Objective**: Identify best-selling months with ranking per year
```sql
SELECT 
    year,
    month,
    avg_sale
FROM 
(    
    SELECT 
        EXTRACT(YEAR FROM sale_date) as year,
        EXTRACT(MONTH FROM sale_date) as month,
        AVG(total_sale) as avg_sale,
        RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) 
                   ORDER BY AVG(total_sale) DESC) as rank
    FROM retail_sales
    GROUP BY 1, 2
) as ranked_months
WHERE rank = 1;
```

### 8. 🥇 Top Customers Analysis
**Objective**: Identify top 5 customers by total spending
```sql
SELECT 
    customer_id,
    SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
```

### 9. 🎯 Customer Engagement by Category
**Objective**: Count unique customers per product category
```sql
SELECT 
    category,    
    COUNT(DISTINCT customer_id) as unique_customers
FROM retail_sales
GROUP BY category;
```

### 10. 🕒 Sales Shift Analysis
**Objective**: Categorize and count orders by time of day
```sql
WITH hourly_sale AS (
    SELECT *,
        CASE
            WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
            WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END as shift
    FROM retail_sales
)
SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift;
```

## 🎪 Key Findings & Insights

### 📊 Sales Performance
- **Revenue Distribution**: Significant variation in sales across product categories
- **High-Value Transactions**: Multiple premium purchases (>$1000) indicating luxury segment presence
- **Seasonal Patterns**: Identifiable monthly sales trends with peak performance periods

### 👥 Customer Insights
- **Demographic Analysis**: Diverse age distribution across different product categories
- **Shopping Behavior**: Distinct gender-based preferences across categories
- **Loyalty Patterns**: Top customers contributing significantly to overall revenue

### ⏰ Operational Insights
- **Time-based Patterns**: Clear distribution of orders across morning, afternoon, and evening shifts
- **Category Performance**: Varying customer engagement levels across different product lines

## 🚀 Getting Started

### Prerequisites
- PostgreSQL Database
- Basic SQL Knowledge
- Sample Retail Dataset

### Installation & Setup
1. **Clone the Repository**
   ```bash
   git clone https://github.com/BodkeSachin7979/SQL_DATA_ANALYSIS/new/master/1Retail_sales_analysis.git
   cd retail-sales-analysis
   ```

2. **Database Setup**
   ```sql
   CREATE DATABASE retail_db;
   \c retail_db;
   ```

3. **Run Analysis Queries**
   - Execute queries from `analysis_queries.sql`
   - Modify parameters for custom analysis
   - Export results for visualization

### 📁 Project Structure
```
retail-sales-analysis/
│
├── database_setup.sql          # Database creation and schema
├── data_cleaning.sql           # Data quality checks and cleaning
├── analysis_queries.sql        # Business intelligence queries
├── insights_summary.md         # Key findings and conclusions
└── README.md                   # Project documentation
```

## 🛠️ Skills Demonstrated

- **Database Management**: Schema design, data population, integrity maintenance
- **SQL Proficiency**: Complex queries, aggregations, window functions, CTEs
- **Data Analysis**: Trend identification, pattern recognition, performance metrics
- **Business Intelligence**: Actionable insights, decision support, KPI tracking
- **Data Quality**: Validation, cleaning, completeness assurance

## 📊 Potential Extensions

- 📈 **Advanced Analytics**: Incorporate machine learning for sales forecasting
- 🌐 **Web Dashboard**: Create interactive visualizations of key metrics
- 🔄 **Real-time Analysis**: Implement streaming data processing
- 📱 **Mobile Reporting**: Develop business intelligence mobile application

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check [issues page](https://github.com/yourusername/retail-sales-analysis/issues).

## 📄 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.

---

### ⭐ Show Your Support

If you find this project helpful, please give it a star! ⭐

---

**💡 Pro Tip**: This project serves as an excellent portfolio piece for data analyst roles, demonstrating comprehensive SQL skills and business acumen.

---
