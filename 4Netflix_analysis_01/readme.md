

# 📊 Netflix Movies & TV Shows Data Analysis — SQL Project

This project dives deep into Netflix’s catalog using pure SQL. The goal was straightforward: extract insights, solve real business questions, and showcase analytical thinking that aligns with actual data analyst job expectations.



## 🚀 What This Project Demonstrates

* Strong SQL querying skills
* Real dataset handling
* Business problem translation → SQL solutions
* Data cleaning, exploration, and insight generation
* Ability to communicate results clearly

---

## 📁 Dataset

Kaggle Public Dataset:
🔗 **Netflix Movies & TV Shows Dataset**
[https://www.kaggle.com/datasets/shivamb/netflix-shows](https://www.kaggle.com/datasets/shivamb/netflix-shows)

---

## 🧱 Table Schema

```sql
DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix (
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);
```

---

# 🔍 Business Problems & SQL Solutions (Showcase)

### **1️⃣ Movie vs TV Show Count**

```sql
SELECT type, COUNT(*) 
FROM netflix
GROUP BY type;
```

### **2️⃣ Most Common Rating by Content Type**

```sql
WITH t AS (
    SELECT type, rating, COUNT(*) c
    FROM netflix
    GROUP BY type, rating
)
SELECT type, rating
FROM (
    SELECT *, RANK() OVER (PARTITION BY type ORDER BY c DESC) r
    FROM t
) q
WHERE r = 1;
```

### **3️⃣ Movies Released in 2020**

```sql
SELECT *
FROM netflix
WHERE release_year = 2020;
```

### **4️⃣ Top 5 Countries With the Most Content**

```sql
SELECT country, COUNT(*) AS total_content
FROM (
    SELECT UNNEST(STRING_TO_ARRAY(country, ',')) AS country
    FROM netflix
) t
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_content DESC
LIMIT 5;
```

### **5️⃣ Longest Movie**

```sql
SELECT *
FROM netflix
WHERE type='Movie'
ORDER BY SPLIT_PART(duration, ' ', 1)::INT DESC;
```

### **6️⃣ Content Added in Last 5 Years**

```sql
SELECT *
FROM netflix
WHERE TO_DATE(date_added,'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years';
```

### **7️⃣ All Content by Director: Rajiv Chilaka**

```sql
SELECT *
FROM (
    SELECT *, UNNEST(STRING_TO_ARRAY(director, ',')) AS d
    FROM netflix
) t
WHERE d = 'Rajiv Chilaka';
```

### **8️⃣ TV Shows With More Than 5 Seasons**

```sql
SELECT *
FROM netflix
WHERE type='TV Show'
AND SPLIT_PART(duration,' ',1)::INT > 5;
```

### **9️⃣ Genre-wise Content Count**

```sql
SELECT UNNEST(STRING_TO_ARRAY(listed_in, ',')) AS genre,
       COUNT(*)
FROM netflix
GROUP BY genre;
```

### **🔟 Top 5 Years With Highest Avg Releases (India)**

```sql
SELECT release_year,
       COUNT(*) AS total_release
FROM netflix
WHERE country='India'
GROUP BY release_year
ORDER BY total_release DESC
LIMIT 5;
```

### **1️⃣1️⃣ Documentaries**

```sql
SELECT *
FROM netflix
WHERE listed_in LIKE '%Documentaries%';
```

### **1️⃣2️⃣ Content With No Director**

```sql
SELECT *
FROM netflix
WHERE director IS NULL;
```

### **1️⃣3️⃣ Salman Khan Movies in Last 10 Years**

```sql
SELECT *
FROM netflix
WHERE casts LIKE '%Salman Khan%'
  AND release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10;
```

### **1️⃣4️⃣ Top 10 Actors in Indian Content**

```sql
SELECT UNNEST(STRING_TO_ARRAY(casts, ',')) AS actor,
       COUNT(*) AS total
FROM netflix
WHERE country='India'
GROUP BY actor
ORDER BY total DESC
LIMIT 10;
```

### **1️⃣5️⃣ Categorizing Content by Violence Keywords**

```sql
SELECT category, COUNT(*)
FROM (
    SELECT CASE
             WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad'
             ELSE 'Good'
           END AS category
    FROM netflix
) q
GROUP BY category;
```

---

# 📌 Key Insights

* Netflix leans heavily toward movie-heavy content vs TV shows.
* Ratings like **TV-MA** and **TV-14** dominate the platform.
* The US and India consistently top content production counts.
* Keyword-based classification uncovers notable patterns in themes.
* Genre distribution shows strong dominance of dramas, comedies, and international titles.

---

# 🎯 Why This Project Stands Out

Here are improvements that make it portfolio-friendly and recruiter-ready:

### ✔ Clear business questions

### ✔ Real dataset

### ✔ Clean SQL solutions

### ✔ Practical insights

### ✔ Strong problem-solving clarity

### ✔ Good README structure

---

# 🔗 Important Project Add-Ons (Boost Portfolio Strength)

Use these links in your GitHub repo or LinkedIn post:

### **Source Code Repo**

✓ GitHub Repository → 
👉 (https://github.com/BodkeSachin7979/SQL_DATA_ANALYSIS/new/master/4Netflix_analysis_01)

### **Dataset Source**

Kaggle: (https://www.kaggle.com/datasets/shivamb/netflix-shows)

### **Project Presentation Deck (Optional but Powerful)**

### **SQL Notebook / .sql File (Recommended)**

👉 Add link: `sql/netflix_analysis.sql`


---

# 👤 Author: **Sachin Bodke**

If you're hiring for SQL/Data Analyst roles or interested in collaboration, feel free to connect.

🔗 **LinkedIn:** [https://www.linkedin.com/in/**your-username](https://www.linkedin.com/in/**your-username)**
🔗 **GitHub:** [https://github.com/**your-username](https://github.com/**your-username)**

---

