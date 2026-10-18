# ☕ Ballerina Cappucina Coffee Shop Database System

![Oracle Database](https://img.shields.io/badge/Database-Oracle%2019c-red?style=for-the-badge&logo=oracle)
![PL/SQL](https://img.shields.io/badge/Language-PL%2FSQL-orange?style=for-the-badge)
![Oracle APEX](https://img.shields.io/badge/Frontend-Oracle%20APEX-000000?style=for-the-badge&logo=oracle)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)

> **A robust relational database management system (RDBMS) and Oracle APEX web application designed to streamline inventory monitoring, sales point-of-sale (POS) operations, staff performance tracking, and customer loyalty management for a local coffee shop.**

---

## 📌 1. Overview

**Ballerina Cappucina** is a local coffee shop serving a diverse selection of handcrafted beverages and artisanal desserts. As business operations expanded, the management team faced critical operational bottlenecks caused by manual record-keeping—specifically stock level discrepancies, untracked daily sales transactions, and delayed financial reporting.

This project delivers a centralized relational database architecture using **Oracle Database DDL/DML** and **PL/SQL**, integrated with an **Oracle Application Express (APEX)** web interface. The system automates order management, calculates taxes and discounts dynamically, maintains real-time stock inventory, tracks employee sales performance, and manages customer membership loyalty points.

Developed under the **Database Programming (BIIT 1031)** course at the **International Islamic University Malaysia (IIUM)**.

---

## 💡 2. Executive Summary

* **The Core Problem:** Manual operations led to stockout errors, untracked sales handled by staff, missing customer purchase histories, and an inability to analyze high-value menu items.
* **Database Solution:** Designed a normalized relational model comprising five interconnected tables (`STAFF`, `CUSTOMER`, `PRODUCT`, `ORDERS`, `ORDERDETAIL`) enforce strict entity-relationship constraints and business rules.
* **Programmatic Automation:** Implemented PL/SQL procedures and functions to automate repetitive tasks—such as updating stock quantities upon purchase, auto-calculating 6% service tax per order, and incrementing customer loyalty points.
* **Web Application Interface:** Developed an interactive Oracle APEX dashboard featuring a Barista POS interface, inventory management table, and manager analytical dashboards.
* **Business Impact:** Eliminated data redundancy, guaranteed real-time stock synchronization across POS terminals, and provided actionable sales analytics for management.

---

## 🛠️ 3. Methodology

### System Architecture & Database Pipeline

```
+-----------------------------------------------------------------------------------+
| PHASE I: Conceptual & Logical Database Design                                    |
| - Defined Business Rules and Entity Relationships                                 |
| - Modeled ERD with 1:M and M:N relationships using an associative entity         |
+-----------------------------------------------------------------------------------+
                                         │
                                         ▼
+-----------------------------------------------------------------------------------+
| PHASE II: Relational Schema & Constraint Definition (DDL)                          |
| - Primary Keys, Foreign Keys with Referential Integrity                           |
| - Domain Constraints: CHECK (Price > 0), CHECK (Salary > 0), CHECK (Stock >= 0)  |
+-----------------------------------------------------------------------------------+
                                         │
                                         ▼
+-----------------------------------------------------------------------------------+
| PHASE III: Transaction Processing & Programmatic Logic (PL/SQL)                  |
| - Stored Procedures: Inventory Deduction & Loyalty Point Allocation                |
| - Stored Functions: Dynamic Tax Calculations (6% Tax) & Staff Performance Metrics |
+-----------------------------------------------------------------------------------+
                                         │
                                         ▼
+-----------------------------------------------------------------------------------+
| PHASE IV: Oracle APEX Web Application & GUI Prototyping                           |
| - Authentication & Main Menu Navigation                                          |
| - Barista Visual POS Terminal & Inventory Management Table                        |
| - Manager Analytical Insights Dashboard                                           |
+-----------------------------------------------------------------------------------+
```

### Entity-Relationship Diagram (ERD) Structure

The database consists of 5 primary entities organized in Third Normal Form (3NF):

```
+---------------+          1:M          +---------------+          1:M          +---------------+
|   CUSTOMER    | ────────────────────< |    ORDERS     | >──────────────────── |     STAFF     |
+---------------+                       +---------------+                       +---------------+
| PK CustomerID |                       | PK OrderID    |                       | PK StaffID    |
|    Name, Email|                       | FK CustomerID |                       |    Name, Salary|
|    Points...  |                       | FK StaffID    |                       |    Position...|
+---------------+                       |    OrderDate..|                       +---------------+
                                                │ 1
                                                │
                                                │ M
                                        +---------------+
                                        |  ORDERDETAIL  |
                                        +---------------+
                                        | PK,FK OrderID |
                                        | PK,FK ProdID  |
                                        | Quantity      |
                                        | Subtotal      |
                                        +---------------+
                                                │ M
                                                │
                                                │ 1
                                        +---------------+
                                        |    PRODUCT    |
                                        +---------------+
                                        | PK ProductID  |
                                        |    Name, Price|
                                        |    Category.. |
                                        +---------------+
```

---

## 🔑 4. Key Findings & SQL/PLSQL Highlights

### 1. Complex Analytical Queries (SQL Data Mining)

* **Top Revenue-Generating Menu Items:**
  ```sql
  SELECT * FROM (
      SELECT p.ProductName AS "Product Name",
             SUM(d.Quantity) AS "Units Sold",
             SUM(d.Subtotal) AS "Revenue"
      FROM Product p
      JOIN OrderDetail d ON p.ProductID = d.ProductID
      GROUP BY p.ProductName
      ORDER BY "Revenue" DESC
  ) WHERE ROWNUM <= 3;
  ```
  * *Insight:* **Cappuccino** ($RM17.00$), **Cheesecake** ($RM16.50$), and **Latte** ($RM13.50$) represent the top revenue drivers.

* **Performance-Based Salary Adjustments:**
  Dynamic query identifying the top 3 cashiers/baristas with the highest transaction volumes to award a 10% raise.
  ```sql
  UPDATE Staff
  SET Salary = Salary * 1.10
  WHERE StaffID IN (
      SELECT StaffID FROM (
          SELECT StaffID FROM Orders
          GROUP BY StaffID
          ORDER BY COUNT(OrderID) DESC
      ) WHERE ROWNUM <= 3
  );
  ```

### 2. PL/SQL Automation Snippets

* **Tax Calculation Function (`GET_FINAL_TOTAL_BY_ORDER`):** Automatically evaluates subtotal amounts and computes total charges inclusive of a 6% service tax factor ($1 + \text{Tax}$).
* **Loyalty Reward Procedure (`ADD_MEMBERSHIP_POINT`):** Prompts customer transactions and increments membership points upon order completion.
* **Automated Stock Deduction (`DEDUCT_STOCK`):** Safely decrements menu item quantities in real time during purchase logging.

---

## 🎯 5. Recommendations

1. **Implement Automated Database Triggers for Inventory Control:**
   * *Action:* Create an `AFTER INSERT ON ORDERDETAIL` database trigger to execute automatic stock deductions directly upon transaction completion.
   * *Impact:* Eliminates the need for manual procedure calls during fast-paced cashier workflows.
2. **Introduce Role-Based Access Control (RBAC):**
   * *Action:* Restrict APEX navigation paths so that Baristas only access the POS page, while administrative functions (salary edits, managerial reports) require Manager credentials.
   * *Impact:* Protects sensitive financial and employee payroll data.
3. **Automated Low-Stock Alerting System:**
   * *Action:* Build an automated background routine triggering system notifications when product stock drops below a safety threshold ($\le 20$ units).
   * *Impact:* Prevents sudden stockouts of popular items like cakes and coffee beans.

---

## ⚠️ 6. Limitations

* **Static Tax Threshold:** The tax function hardcodes the tax rate ($6\%$). Future tax code adjustments would require updating the PL/SQL package source code.
* **Single-Location Architecture:** The database schema is optimized for a single outlet and currently lacks store/branch ID keys required for multi-outlet retail chains.
* **Manual Trigger Execution:** In the current prototype stage, inventory deduction routines are triggered via application calls rather than transactional row-level triggers.

---

## 📈 7. Project Impact

* **Operational Efficiency:** Reduces cashier checkout processing times by providing a visual, button-based POS interface.
* **Data Integrity:** Strict foreign key references and domain check constraints ($Price > 0$, $Stock \ge 0$) prevent data corruption and accidental manual errors.
* **Data-Driven Management:** Equips management with real-time insight charts into staff performance ratings, high-margin product categories, and top spending customers.

---

## 🖥️ 8. Web Application Prototype

*(Note: The live Oracle APEX cloud instance is no longer publicly hosted. The interface modules are demonstrated below using system screenshots.)*

### Application Interface Visuals

#### 1. Authentication & Main Menu Dashboard
The system opens with a secure login prompt leading into a streamlined central hub, allowing quick navigation between **Inventory Management**, **Manager Insights**, and the **Barista POS Interface**.

| Login Screen | Main Navigation Menu |
| :---: | :---: |
| ![Login Page](https://via.placeholder.com/400x250?text=Login+Interface) | ![Home Page](https://via.placeholder.com/400x250?text=Main+Menu+Dashboard) |
*(Screenshots corresponding to Task 9 - Login & Home Page)*

#### 2. Barista Point-of-Sale (POS) Interface
A high-efficiency, card-based interface built for front-of-house staff to select drinks/pastries, view current stock availability in real-time, select target customers for loyalty points, and compute total subtotals.

![POS Interface](https://via.placeholder.com/800x400?text=Barista+POS+Interface+Screen)
*(Screenshot corresponding to Task 9 - POS Interface)*

#### 3. Manager Insights Dashboard
Provides high-level business analytics, including staff order performance breakdowns, best-selling product distributions, and category-wise sales revenue pie charts.

![Manager Dashboard](https://via.placeholder.com/800x400?text=Manager+Analytics+Dashboard)
*(Screenshot corresponding to Task 9 - Manager Dashboard)*

#### 4. Real-Time Inventory Management Table
Allows store managers to search, inspect stock quantities, adjust prices, and add new beverage/food SKUs dynamically.

![Inventory Page](https://via.placeholder.com/800x400?text=Inventory+Management+Table)
*(Screenshot corresponding to Task 9 - Inventory Page)*

---

## 👥 Project Team & Acknowledgments

* **Institution:** Faculty of Information & Communication Technology, International Islamic University Malaysia (IIUM)
* **Course:** Database Programming (BIIT 1031) — Section 4
* **Lecturer:** Dr. Nurhafizah Binti Mahri
* **Project Team:**
  * **Nurul Hana Binti Abdul Halim** (Matric: 2315932)
  * **Che Nurul Liyana Binti Che Mat Noor** (Matric: 2317600)
  * **Dayana Batrisya Binti Ramile** (Matric: 2318872)
  * **Nur Najihah Binti Mohd Zamrisham** (Matric: 2319880)