# Fraud Detection Data Engineering Pipeline

## Overview

This project demonstrates an end-to-end **Data Engineering pipeline** for fraud detection using modern data stack tools.
It ingests raw transaction data, transforms it into analytics-ready tables, and applies rule-based logic to identify high-risk transactions.

---

## Architecture

```
CSV Data
   ↓
Snowflake (RAW Layer)
   ↓
dbt (STAGING Layer - Cleaning & Standardization)
   ↓
dbt (MART Layer - Fact & Dimension Tables)
   ↓
dbt (ANALYTICS Layer - Fraud Risk Scoring)
   ↓
Airflow (Orchestration)
   ↓
Dashboard (Power BI / Tableau)
```

---

## Tech Stack

* **Data Warehouse**: Snowflake
* **Transformation Tool**: dbt (Data Build Tool)
* **Orchestration**: Apache Airflow
* **Programming Language**: Python
* **Query Language**: SQL
* **Containerization**: Docker
* **Version Control**: Git, GitHub
* **Data Format**: CSV

---

## Data Pipeline Layers

### RAW Layer

* Stores original data from CSV files
* No transformations applied

### STAGING Layer

* Data cleaning and standardization
* Column renaming
* Null handling and validation

### MART Layer

* Star schema design
* Fact and dimension tables
* Optimized for analytics

### ANALYTICS Layer

* Fraud risk scoring logic
* Rule-based classification
* Risk categories (HIGH / MEDIUM / LOW)

---

## Data Processing Flow

1. Load CSV data into Snowflake RAW tables
2. Transform data using dbt staging models
3. Build dimension and fact tables
4. Apply fraud detection logic
5. Orchestrate pipeline using Airflow

---

## Fraud Detection Logic

Fraud risk is calculated using:

* High transaction amount
* Account balance anomalies
* Suspicious transaction types (TRANSFER, CASH_OUT)
* Flagged transactions

### Output:

* `fraud_risk_score`
* `risk_category` (LOW / MEDIUM / HIGH / CONFIRMED_FRAUD)

---

## Data Quality Checks

Implemented using dbt tests:

* Not null checks
* Accepted values validation
* Data consistency checks

---

## Dashboard

The final dataset used for visualization:

```
FRAUD_DETECTION_DB.ANALYTICS.FRAUD_RISK_SCORING
```

### Sample Insights:

* Fraud vs Non-Fraud Transactions
* Risk Category Distribution
* High-Risk Transactions by Amount
* Transaction Type Analysis

---

## Airflow Orchestration

Airflow DAG automates:

```
dbt debug → dbt run → dbt test
```

Scheduled pipeline execution ensures data freshness.

---

## How to Run

### 1. Install dependencies

```
pip install -r requirements.txt
```

### 2. Run dbt

```
dbt run
dbt test
```

### 3. Run Airflow

```
docker compose up
```

### 4. Open Airflow UI

```
http://localhost:8080
```

---

## Key Highlights

* End-to-end data pipeline implementation
* Layered architecture (RAW → STAGING → MART → ANALYTICS)
* Scalable and production-ready design
* Automated workflow using Airflow
* Real-world fraud detection use case
