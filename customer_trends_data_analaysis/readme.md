# 👨🏻‍💻Customer Behavior Data Analyst Portfolio Project
Here is the **README.md in pure code format** — clean Markdown, no explanation outside the code block.
Just copy–paste directly into GitHub.

---

# 📊 Customer Shopping Behavior Analysis  
_End-to-End Data Analytics Project (Python • SQL • Power BI)_

---

## 1. 📌 Project Overview  
This end-to-end analytics project examines **3,900 retail transactions** to uncover customer purchasing behavior, product trends, and revenue drivers.  
The analysis supports data-driven decisions across marketing, pricing, and customer retention.

---

## 2. 📁 Dataset Summary  

| Item | Details |
|------|---------|
| **Rows** | 3,900 |
| **Columns** | 18 |
| **Missing Values** | 37 missing in `review_rating` |
| **Categories** | Clothing, Accessories, Footwear, Electronics, etc. |

**Key Features:**
- Age, Gender  
- Item Purchased, Category  
- Purchase Amount, Season, Color, Size  
- Discount Applied, Shipping Type  
- Subscription Status  
- Review Rating  
- Previous Purchases  

---

## 3. 🐍 Exploratory Data Analysis (Python)

### ✔ Completed Steps  
- Loaded data & generated summary statistics  
- Standardized column names to `snake_case`  
- Imputed missing review ratings using category-wise medians  
- Engineered new features:  
  - `age_group` (age buckets)  
  - `purchase_frequency_days`  
- Verified redundancy in discount fields → removed `promo_code_used`  
- Loaded cleaned dataset into **PostgreSQL** for SQL analysis  

**Python Libraries:** `pandas`, `numpy`, `matplotlib`, `seaborn`, `sqlalchemy`

---

## 4. 🗄️ SQL Business Analysis (PostgreSQL)

Key business questions answered using SQL:

1. **Revenue by Gender**  
2. **High-Spending Discount Users**  
3. **Top 5 Products by Average Rating**  
4. **Standard vs Express Shipping Spend Comparison**  
5. **Subscribers vs Non-Subscribers Revenue**  
6. **Products with Highest Discount Dependency**  
7. **Customer Segmentation**  
   - New, Returning, Loyal  
8. **Top 3 Products per Category**  
9. **Subscription Likelihood for Repeat Buyers (>5 purchases)**  
10. **Revenue Contribution by Age Group**

---

## 5. 📈 Power BI Dashboard

Interactive dashboard includes:

- Total Revenue Trends  
- Top Categories & Products  
- Demographic Insights  
- Shipping Preference Analysis  
- Discount vs No-Discount Contribution  
- Review Rating Distribution  
- Customer Segments (New • Returning • Loyal)  

Dashboard provides clear, actionable insights for business decisions.

---

## 6. 💡 Business Recommendations

### 1️⃣ Boost Subscription Conversions  
Highlight exclusive benefits such as free shipping and special discounts.

### 2️⃣ Strengthen Loyalty Programs  
Reward frequent buyers to push them into the “Loyal” segment.

### 3️⃣ Optimize Discount Strategy  
Identify products heavily dependent on discounts and adjust pricing.

### 4️⃣ Promote Top-Rated Products  
Prioritize high-rated items in campaigns to improve conversions.

### 5️⃣ Target High-Revenue Age Groups  
Launch focused marketing on the most profitable demographics.

---

## 7. 🗂️ Project Structure  
```

customer_trends_data_analysis/
│── data/
│   └── customer_shopping_data.csv
│
│── notebook/
│   └── Customer_Shopping_Behavior_Analysis.ipynb
│
│── sql/
│   └── analysis_queries.sql
│
│── powerbi/
│   └── customer_behavior_dashboard.pbix
│
│── README.md
│── requirements.txt

```

---

## 8. 🚀 Tech Stack  
- **Python** → Data Cleaning + EDA  
- **PostgreSQL** → Business SQL Analysis  
- **Power BI** → Interactive Dashboard  
- **Git/GitHub** → Version Control  

---

## 9. ⭐ Final Outcome  
A complete, professional, end-to-end analytics pipeline demonstrating practical skills in:

- Data Cleaning  
- EDA  
- SQL Analysis  
- Feature Engineering  
- Dashboarding  
- Business Recommendations  

Suitable for resumes, interviews, and real-world business analytics use cases.

---


---





