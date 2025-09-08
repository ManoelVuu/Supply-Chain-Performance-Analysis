# 📦 Supply-Chain-Performance-Analysis
The objective is to evaluate sales &amp; profitability, inventory alignment, supplier performance, shipping efficiency, and quality control — and translate findings into clear, actionable recommendations for decision-makers.

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
- **Source:** [Add dataset source or "Provided for competition/practice"]  
- **Size:** ~[Add number of rows/columns]  
- **Main Features:**  
  - Product details (type, SKU, price, stock levels, defect rates)  
  - Supplier information (lead times, performance)  
  - Shipping carriers, routes, and costs  
  - Sales & profitability metrics  
  - Location and customer data  

---

## 🎯 Business Questions
1. **Sales & Profitability** → Which product types and SKUs drive the most revenue and profit?  
2. **Inventory** → Are stock levels aligned with sales? Which SKUs face risk of stockouts?  
3. **Suppliers** → Who has the longest lead times? How does this affect stockouts?  
4. **Shipping & Logistics** → Which carriers/routes are most efficient and cost-effective?  
5. **Quality Control** → What are the defect rates by product, supplier, and route?  

---

## 🔍 Data Preparation & EDA
- Minimal cleaning required (validated nulls, duplicates, and data types).  
- Exploratory Data Analysis (EDA) uncovered patterns in sales, supplier performance, and logistics.  

**Key Findings:**
- Skincare dominates revenue & profit.  
- Cosmetics has highest average revenue per SKU but lower margins.  
- Haircare products show higher defect rates.  
- Mumbai & Kolkata perform best in sales; Delhi lags behind.  
- Supplier 3 & 5 drive delays and defects.  
- Route B is slowest and most costly.  

---

## 📊 Insights by Business Area

### 🛍 Sales & Profitability
- Skincare leads in both revenue ($242K) and profit margin (40%).  
- Top SKUs by revenue → SKU51, SKU38, SKU31.  
- Top SKUs by quantity → SKU10, SKU94, SKU9.  

### 📦 Inventory
- 44% of SKUs are fast-moving, but 38% are understocked and 7% critically short.  
- High-risk SKUs: SKU78 & SKU47 (low stock + long lead times).  

### 🤝 Suppliers
- Supplier 3 → longest lead time (20.13 days) and highest understock rate (53%).  
- Supplier 1 → shortest lead time (14.78 days) and lowest defect rate (1.80).  

### 🚚 Shipping & Logistics
- Carrier A → fastest; Carrier B → most cost-efficient.  
- Route A → best balance; Route B → worst (high cost + slowest).  
- Location trade-offs: Mumbai (fastest but costly), Chennai (cheapest but slowest).  

### 🔧 Quality Control
- Highest defects → Haircare (2.48).  
- Supplier 5 records the most defects (2.67).  
- Routes A & B show higher defect rates than Route C.  

---

## 📌 Executive Summary
1. **Sales & Profitability** → Skincare drives revenue & profit; Cosmetics requires margin optimization.  
2. **Inventory** → Misaligned stock levels; understock & long lead times increase stockout risk.  
3. **Suppliers** → Long lead times directly linked to understock issues.  
4. **Logistics** → Trade-offs between cost and speed across carriers/routes.  
5. **Quality Control** → Supplier 5 and Routes A & B drive most defects.  

---

## 🚀 Recommendations
- **Revenue & Profitability:** Prioritize Skincare; revisit Cosmetics strategy.  
- **Inventory:** Implement demand-driven replenishment; set reorder points.  
- **Suppliers:** Diversify away from Supplier 3 & 5; negotiate SLAs.  
- **Logistics:** Favor Carrier B/Route A; investigate inefficiencies in Route B & Chennai.  
- **Quality:** Audit Supplier 5; tighten inspections on Haircare & key logistics routes.  

---

## 🛠 Tools & Technologies
- **SQL** → Data extraction, querying, and aggregation.  
- **Power BI** → Dashboards, visuals, and storytelling.  

---

## 📷 Project Deliverables
- 📊 Power BI Dashboard → [Add link or screenshots here]  
- 📜 SQL Queries → [Add repo folder or file link]  
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

