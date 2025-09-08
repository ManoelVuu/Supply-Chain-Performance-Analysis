# 📦 Supply-Chain-Performance-Analysis
The objective is to evaluate sales &amp; profitability, inventory alignment, supplier performance, shipping efficiency, and quality control — and translate findings into clear, actionable recommendations for decision-makers.

---

## 📌 Executive Summary

1. **Sales & Profitability** → Skincare drives revenue & profit; Cosmetics requires margin optimization.  
2. **Inventory Management** → Misaligned stock levels; understock & long lead time increase stockout risk.  
3. **Supplier Performance** → Long lead time directly linked to understock issues.  
4. **Shipping & Logistics** → Trade-offs between cost and speed across carriers/routes.  
5. **Quality Control** → Supplier 5 and Routes A & B drive most defects.  

---

## 🚀 Recommendations

- **Revenue & Profitability:** Prioritize Skincare; revisit Cosmetics strategy.  
- **Inventory Management:** Implement demand-driven replenishment; set reorder points.  
- **Supplier Performance:** Diversify away from Supplier 3 & 5; negotiate SLAs.  
- **Shipping & Logistics:** Favor Carrier B/Route A; investigate inefficiencies in Route B & Chennai.  
- **Quality Control:** Audit Supplier 5; tighten inspections on Haircare & key logistics routes.  

---

## 📌 Project Overview
This project analyzes **supply chain performance** using **SQL** for querying and aggregation, and **Power BI** for visualization and storytelling.  

The goal is to evaluate:
- Sales & profitability  
- Inventory alignment  
- Supplier performance  
- Shipping efficiency  
- Quality control  

and provide clear, actionable recommendations for decision-makers.  

---

## 📂 Dataset
- **Source:** Provided for competition/practice by Onyx Data  
- **Size:** ~100 rows  
- **Main Features:**  
  - Product details (type, SKU, price, stock levels, defect rates)  
  - Supplier information (lead times, performance)  
  - Shipping carriers, routes, and costs  
  - Sales & profitability metrics  
  - Location and customer data  

---

## 🎯 Business Questions

1. **Sales & Profitability**
- Which product types generate the most revenue?
- Which SKUs are bestsellers by quantity and revenue?
  
2. **Inventory Management**
- Are stock levels aligned with sales?
- Which products are at risk due to low stock and long lead times?

3. **Supplier Performance**
- Which suppliers have the longest lead times?
- What is the relationship between supplier lead time and stockouts?
  
4. **Shipping & Logistics**
- Which shipping carriers are cost-efficient and fast?
- Are there specific routes or locations that increase cost or time?
  
9. **Quality Control**
- What are the defect rates per product or production line?
- Which suppliers or routes lead to higher defect rates?

---

## 🔍 Data Preparation & EDA

- Minimal cleaning required (validated nulls, duplicates, and data types).  
- The exploratory data analysis (EDA) focused on uncovering patterns, trends, and bottlenecks in supply chain performance.  

**Key Findings:**

- Skincare dominates revenue & profit.  
- Cosmetics has highest average revenue per SKU but lower margins.  
- Haircare products show higher defect rates.  
- Mumbai & Kolkata perform best in sales; Delhi lags behind.  
- Supplier 3 & 5 drive delays and defects respectively.
- Route B is slowest and Route C is most costly.  

---

## 📊 Insights by Business Area

### 💰 Sales & Profitability
- Revenue: Skincare leads with $242K, followed by Haircare ($174K) and Cosmetics ($162K).
- Profit Margins: Skincare (40%), Haircare (34%), Cosmetics (26%).
- Bestsellers:
  - By quantity → SKU10, SKU94, SKU9.
  - By revenue → SKU51, SKU38, SKU31.
    
➡️ Implication: Skincare drives both revenue and profit. Cosmetics requires pricing, cost, or marketing review.
  

### 📦 Inventory Management
- Only 10% of products have balanced stock levels.
- 44% are fast-moving, 38% understocked, 7% critically short.
- High-risk SKUs: SKU78 and SKU47 (low stock + lead times >7 days).
  
➡️ Implication: Misaligned stock levels increase risk of stockouts and excess holding costs.


### 🤝 Supplier Performance
- Longest Lead Time: Supplier 3 (20 days).
- Correlation: Longer lead times link to higher understock rates.
  - Supplier 3 → 53% understock.
  - Supplier 2 → 54% understock.
  - Supplier 4 → shorter lead time (15 days) with lowest understock rate (27.8%).
    
➡️ Implication: Suppliers with high lead times drive stockouts.


### 🚚 Shipping & Logistics
- Carriers: Carrier A is fastest; Carrier B is most cost-efficient.
- Routes: Route A is balanced; Route B is slowest while Route C most costly.
- Locations:
  - Mumbai → fastest (14 days) but most expensive ($6.25).
  - Chennai → cheapest ($4.69) but longest delays (17 days).
    
➡️ Implication: Trade-offs exist between cost and speed; optimization is needed by carrier and route.
 

### ✅ Quality Control
- Defect Rates by Product: Haircare (2.48) > Skincare (2.33) > Cosmetics (1.92).
- Defect Rates by Supplier:
  - Highest → Supplier 5 (2.67).
  - Lowest → Supplier 1 (1.80).
- Defect Rates by Route: Route A (2.34) and Route B (2.32) > Route C (2.05).
  
➡️ Implication: Supplier 5 and certain logistics channels (Routes A & B) drive quality issues.
 
---

## 🛠 Tools & Technologies
- **SQL** → Data extraction, querying, and aggregation.  
- **Power BI** → Dashboards, visuals, and storytelling.  

---

## 📷 Project Deliverables
- 📊 Power BI Dashboard → [(https://github.com/ManoelVuu/Supply-Chain-Performance-Analysis/blob/main/projects-files/Supply%20Chain%20Report%20Page.pbix)] 
- 📜 SQL Queries →   
- 📑 Documentation → This README  

---

## 📌 Next Steps
- Automate refresh with Power BI Service.  
- Expand analysis with predictive modeling (future demand & supplier risk).  
- Integrate additional logistics KPIs for deeper optimization.  

---

## 👤 Author
**Manoel Vuu**  
📧 [manoelvuu@gmail.com] | 🌐 [Portfolio/LinkedIn/GitHub link]  

