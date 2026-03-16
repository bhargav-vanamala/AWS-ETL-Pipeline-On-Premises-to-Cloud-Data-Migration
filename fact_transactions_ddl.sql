-- ============================================================
-- AWS ETL Pipeline — Redshift DDL
-- Author: Vanamala Bhargav | Data Engineer
-- ============================================================

-- Fact Table: Government Transactions
CREATE TABLE IF NOT EXISTS fact_transactions (
    transaction_id       VARCHAR(20)   NOT NULL,
    department           VARCHAR(50)   NOT NULL    ENCODE zstd,
    category             VARCHAR(50)               ENCODE zstd,
    amount               DECIMAL(15,2)             ENCODE az64,
    status               VARCHAR(20)               ENCODE zstd,
    vendor_name          VARCHAR(200)              ENCODE zstd,
    vendor_state         VARCHAR(5)                ENCODE zstd,
    created_date         DATE                      ENCODE az64,
    fiscal_year          INTEGER                   ENCODE az64,
    fiscal_quarter       VARCHAR(3)                ENCODE zstd,
    txn_year             INTEGER                   ENCODE az64,
    txn_month            INTEGER                   ENCODE az64,
    amount_bucket        VARCHAR(15)               ENCODE zstd,
    is_approved          SMALLINT                  ENCODE az64,
    pct_of_budget        DECIMAL(10,4)             ENCODE az64,
    record_hash          VARCHAR(64)               ENCODE zstd,
    etl_load_timestamp   TIMESTAMP                 ENCODE az64,
    etl_source           VARCHAR(50)               ENCODE zstd,
    PRIMARY KEY (transaction_id)
)
DISTSTYLE KEY
DISTKEY(department)
SORTKEY(created_date, department);

-- Redshift COPY from S3
COPY fact_transactions
FROM 's3://nm-state-datalake/curated/transactions/'
IAM_ROLE 'arn:aws:iam::123456789:role/RedshiftS3Role'
FORMAT AS PARQUET
SERIALIZETOJSON;

VACUUM fact_transactions;
ANALYZE fact_transactions;
