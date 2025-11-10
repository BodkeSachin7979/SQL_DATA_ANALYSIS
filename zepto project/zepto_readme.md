<h1 align="center">🛒 Zepto E-Commerce SQL Data Analyst Project</h1>

<p align="center">
  <b>Real-world SQL portfolio project analyzing e-commerce inventory data from Zepto</b><br>
  📊 Data Cleaning • 📈 Exploratory Analysis • 💡 Business Insights
</p>

<p align="center">
  <a href="https://www.postgresql.org/"><img src="https://img.shields.io/badge/Database-PostgreSQL-blue?logo=postgresql"></a>
  <a href="https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset"><img src="https://img.shields.io/badge/Dataset-Kaggle-teal?logo=kaggle"></a>
  <img src="https://img.shields.io/badge/Language-SQL-orange?logo=sqlite">
  <img src="https://img.shields.io/badge/Tool-pgAdmin-blueviolet?logo=postgresql">
  <a href="https://github.com/BodkeSachin7979"><img src="https://img.shields.io/badge/Author-Sachin%20Bodke-black?logo=github"></a>
</p>

---

## 📘 Project Overview

This project replicates how **real data analysts** in e-commerce use SQL to transform messy raw data into business-ready insights.  
It’s based on inventory data scraped from [Zepto](https://www.zeptonow.com/), a major player in India’s quick-commerce space.  

Through this project, you’ll learn to:
- 🧩 Build and query a **relational database**
- 🧹 Clean and structure messy, real-world datasets
- 🔍 Perform **Exploratory Data Analysis (EDA)**
- 💼 Derive **business insights** from transactional data

---

## 🎯 Objectives

The main goals of this project are to:

✅ Create a structured SQL database for Zepto’s inventory  
✅ Perform detailed **data cleaning and transformation**  
✅ Run **exploratory and business-driven analytical queries**  
✅ Simulate real-world e-commerce decision-making using SQL  

---

## 🧾 Dataset Overview

📦 **Source:** [Kaggle - Zepto Inventory Dataset](https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset/data?select=zepto_v2.csv)  
🛍️ **Context:** Scraped from Zepto’s product listings, representing a typical e-commerce inventory system.

Each record = 1 SKU (Stock Keeping Unit).  
Duplicates exist because the same product may appear in different sizes, weights, or packages — just like real online catalogs.

### 🧮 Columns Description

| Column | Description |
|:--|:--|
| `sku_id` | Unique product identifier |
| `name` | Product name |
| `category` | Product category (e.g., Fruits, Snacks, Beverages) |
| `mrp` | Maximum Retail Price (in ₹) |
| `discountPercent` | Discount applied (%) |
| `discountedSellingPrice` | Final price after discount |
| `availableQuantity` | Stock available |
| `weightInGms` | Weight in grams |
| `outOfStock` | Boolean flag for availability |
| `quantity` | Quantity per package |

> 💡 **Note:** Dataset originally in paise — converted to ₹ for analysis clarity.

---

## ⚙️ Project Workflow

### 🧱 1. Database & Table Creation

```sql
CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);
```

### 🔍 3. Data Exploration (EDA)

Key queries and checks performed:

* Total number of records
* Sample inspection of rows
* Null value analysis across all columns
* Distinct product categories
* Out-of-stock vs in-stock counts
* Duplicate detection on product names

---

### 🧹 4. Data Cleaning

Steps taken to improve data quality:

✅ Removed invalid rows (e.g., MRP or price = 0)
✅ Converted prices from **paise → rupees**
✅ Handled missing & inconsistent values
✅ Verified boolean and numeric data integrity

---

### 💼 5. Business Insights & Analytical Queries

Some of the major analytical tasks:

| Analysis                                 | Description                           |
| :--------------------------------------- | :------------------------------------ |
| 🏷️ Top 10 Best Discounted Products      | Highest discount percentages          |
| 🚫 High-MRP Out-of-Stock Items           | Expensive items currently unavailable |
| 💰 Potential Revenue Estimation          | Category-wise revenue calculation     |
| 💎 Expensive Products with Low Discounts | MRP > ₹500 and <10% discount          |
| 🏆 Highest Discounted Categories         | Ranked by average discount            |
| ⚖️ Price per Gram Analysis               | Identify best value-for-money items   |
| 📦 Weight Segmentation                   | Grouped products as Low, Medium, Bulk |
| 🧮 Inventory Weight                      | Total stock weight by category        |

---

## 🛠️ How to Use This Project

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/BodkeSachin7979/SQL_DATA_ANALYSIS.git
cd SQL_DATA_ANALYSIS/zepto project
```

### 2️⃣ Open SQL File

Run **`zepto_SQL_data_analysis.sql`** inside **pgAdmin** or any PostgreSQL IDE.
It includes:

* Table creation
* Data import
* Cleaning queries
* Analytical insights

### 3️⃣ Load the Dataset

Import the CSV (UTF-8 format) into your PostgreSQL database.

---

## 📈 Key Learnings

✔️ Writing real-world SQL queries for analysis
✔️ Data cleaning & transformation with SQL
✔️ Using aggregate functions, filtering & CASE logic
✔️ Extracting actionable insights for e-commerce analytics
✔️ Translating business problems into SQL-driven decisions

---

## 🧰 Tech Stack

| Tool                 | Purpose                            |
| :------------------- | :--------------------------------- |
| **PostgreSQL / SQL** | Data storage & querying            |
| **pgAdmin**          | SQL execution & data visualization |
| **Kaggle Dataset**   | Real-world inventory data          |
| **VS Code / GitHub** | Documentation & version control    |

---

## 🌟 Showcase

📸 **Example Visualizations (Optional in Extensions):**

* Category-wise Revenue Distribution
* Stock Availability Comparison
* Discount vs Selling Price Correlation

*(You can visualize results in Power BI or Tableau if you extend this project.)*

---

## 🤝 Connect & Support

If you find this project helpful —
⭐ **Star this repository** and share it with other learners!

📬 **Connect with me:** <a href="https://www.linkedin.com/in/sachin-bodke/"><img src="https://img.shields.io/badge/LinkedIn-Sachin%20Bodke-blue?logo=linkedin"></a> <a href="https://github.com/BodkeSachin7979"><img src="https://img.shields.io/badge/GitHub-BodkeSachin7979-black?logo=github"></a>

---

<p align="center">Built with ❤️ by <b>Sachin Bodke</b> | SQL • PostgreSQL • Data Analytics</p>

