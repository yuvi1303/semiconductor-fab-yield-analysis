# semiconductor-fab-yield-analysis
"Semiconductor Wafer Fab Yield Analysis System using MySQL"
# 🔬 Semiconductor Fab Yield Analysis System
![MySQL](https://img.shields.io/badge/MySQL-8.0-blue?logo=mysql)
![Level](https://img.shields.io/badge/Level-Beginner%20Learning-yellow)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)

---

I didn't want to build a basic "student database" or "library management" project like everyone else. So I challenged myself to build something that actually relates to my ECE domain — a **Semiconductor Wafer Fab Yield Analysis System**.

Is it perfect? Probably not.  
Did I learn a ton building it? **Absolutely yes.**

---

## 💡 Why This Project?

As an ECE student I kept asking myself —
> *"What does SQL look like in the real semiconductor industry?"*

Companies like **Intel, Qualcomm, TSMC** track wafer yield, defects, and process steps using databases exactly like this. So I tried to simulate that — at a beginner level.

---

## 🧠 What I Learned Building This

This was my first real SQL project. Here's what I picked up:

- ✅ How to design a database from scratch (normalization)
- ✅ Writing JOINs across multiple tables
- ✅ Using Window Functions like RANK() and LAG()
- ✅ What CTEs are and how to use them
- ✅ Writing my first Stored Procedures
- ✅ Understanding FOREIGN KEY relationships
- ✅ How real fab concepts like yield%, defect density, and SPC map to SQL queries

---

## 🗄️ What the Database Contains

10 tables that simulate a wafer fab plant:

```
semiconductor_fab
├── technology_nodes    → Process nodes like 7nm, 14nm, 28nm
├── products            → Chips like Mobile SoC, GPU, MCU, IoT
├── engineers           → Fab engineers and departments
├── equipment           → Machines like ASML scanners, Lam etchers
├── process_steps       → Steps like Lithography, Etch, CMP
├── defect_types        → Defect types like Particle, Bridge, Open
├── lots                → Production lots being processed
├── wafers              → Individual wafers with yield %
├── defects             → Defect records with location data
└── wafer_measurements  → Measurements like CD, Overlay, Thickness
```

### ERD Diagram:
![ERD Diagram](erd_diagram.png)

---

## 📊 Queries I Wrote (Still Learning!)

| # | What the Query Does |
|---|---|
| 1 | Lot yield summary — how each lot performed |
| 2 | Which equipment causes the most defects |
| 3 | Find measurements that failed specification |
| 4 | Rank wafers by yield using Window Functions |
| 5 | Engineer performance report |
| 6 | Rolling yield trend using CTE + LAG() |
| 7 | Defect Pareto — which defects kill yield most |
| 8 | SPC analysis — process stability using STDDEV |
| 9 | Cost of poor yield — financial impact |
| 10 | Equipment health — machines needing maintenance |

---

## 🔧 Stored Procedures I Built

```sql
-- Get full report for any lot
CALL GetLotReport('LOT-2024-001');

-- Alert when yield drops below a threshold
CALL YieldExcursionAlert(60.00);

-- Check defect history of any machine
CALL EquipmentDefectReport('LAM-ETH02');
```

---

## 🚀 How to Run This

1. Install **MySQL 8.0** and **MySQL Workbench**
2. Open MySQL Workbench
3. Go to **Server → Data Import**
4. Select the **Dump20260524.sql** file
5. Click **Start Import**
6. Open a new query tab and run:
```sql
USE semiconductor_fab;
-- Now run any query you like!
```

---

## 📁 Files in This Repo

```
semiconductor-fab-yield-analysis/
├── Dump20260524.sql     → Full database (just import and run!)
├── README.md            → You're reading this!
└── erd_diagram.png      → Visual diagram of all tables
```

---

## 🙏 Honest Note

I'm still a beginner. I built this project to push myself beyond basic SQL and to connect my ECE background with data skills. There's definitely room to improve and I'm still learning every day.

If you're a recruiter or senior engineer reading this — I'd love any feedback! 😊

---

## 📬 Let's Connect!

**Nallavelli Yuvraj Yadav**  
🔗 [LinkedIn](https://www.linkedin.com/in/nallavelliyuvraj)

---

*First SQL project | Built with curiosity and a lot of Stack Overflow 😄*
