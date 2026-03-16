# 🚀 AWS ETL Pipeline: On-Premises to Cloud Data Migration

![AWS](https://img.shields.io/badge/AWS-Glue%20%7C%20S3%20%7C%20Redshift-orange?logo=amazon-aws)
![PySpark](https://img.shields.io/badge/PySpark-3.x-yellow?logo=apache-spark)
![Python](https://img.shields.io/badge/Python-3.9+-blue?logo=python)

> End-to-end AWS data pipeline migrating state government on-premises data to cloud-native analytics. Built at Deloitte for New Mexico State Government.

## 🏗️ Architecture
```
On-Prem SQL Server → AWS DMS (CDC) → S3 Raw Zone → AWS Glue ETL
→ S3 Curated Zone → S3 Processed Zone → Amazon Redshift → Tableau/Power BI
                 ↘ Amazon Kinesis → AWS Lambda → Redshift (real-time)
```

## 📓 Notebooks
| Notebook | Coverage |
|---|---|
| `01_s3_ingestion_glue_etl.ipynb` | AWS DMS extract simulation, S3 3-zone architecture, Glue DQ rules, Parquet partitioning |
| `02_redshift_star_schema.ipynb` | Star schema DDL (DISTKEY/SORTKEY), SCD-2 merge, fact/dim loading, analytical queries |

## ⚡ Key Features
- **3-Zone S3 Data Lake** — Raw → Curated → Processed (Hive partitioning)
- **AWS Glue Data Quality Rules** — NullCheck, Uniqueness, ColumnValues
- **SCD Type 2** — Full history tracking for dim_department
- **Redshift Optimization** — DISTKEY, COMPOUND SORTKEY, ZSTD encoding
- **Realistic dirty data** — Nulls, sentinel values, duplicates injected & resolved

## 🚀 Quick Start
```bash
git clone https://github.com/bhargav-vanamala/aws-etl-pipeline.git
cd aws-etl-pipeline
pip install pandas numpy pyarrow
jupyter notebook notebooks/01_s3_ingestion_glue_etl.ipynb
```

## 📊 Results
| Metric | Value |
|---|---|
| Daily records processed | 10M+ |
| Pipeline latency | < 30 min |
| DQ pass rate | 99.7% |
| Cost reduction | ~25% |

**Author:** Vanamala Bhargav · Data Engineer · Deloitte  
🔗 [linkedin.com/in/bhargav-vanamala](https://linkedin.com/in/bhargav-vanamala)
