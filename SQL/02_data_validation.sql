-- ============================================================
-- Customer Churn & Retention Analytics
-- Data Validation
-- ============================================================


-- ============================================================
-- 1. ROW COUNT
-- ============================================================

SELECT COUNT(*) AS total_customers
FROM telecom_churn;


-- ============================================================
-- 2. COLUMN CHECK
-- ============================================================

SELECT *
FROM telecom_churn
LIMIT 5;


-- ============================================================
-- 3. MISSING VALUE CHECK
-- ============================================================

SELECT
    COUNT(*) FILTER (WHERE churn IS NULL) AS churn_nulls,
    COUNT(*) FILTER (WHERE accountweeks IS NULL) AS accountweeks_nulls,
    COUNT(*) FILTER (WHERE contractrenewal IS NULL) AS contractrenewal_nulls,
    COUNT(*) FILTER (WHERE dataplan IS NULL) AS dataplan_nulls,
    COUNT(*) FILTER (WHERE datausage IS NULL) AS datausage_nulls,
    COUNT(*) FILTER (WHERE custservcalls IS NULL) AS custservcalls_nulls,
    COUNT(*) FILTER (WHERE daymins IS NULL) AS daymins_nulls,
    COUNT(*) FILTER (WHERE daycalls IS NULL) AS daycalls_nulls,
    COUNT(*) FILTER (WHERE monthlycharge IS NULL) AS monthlycharge_nulls,
    COUNT(*) FILTER (WHERE overagefee IS NULL) AS overagefee_nulls,
    COUNT(*) FILTER (WHERE roammins IS NULL) AS roammins_nulls
FROM telecom_churn;


-- ============================================================
-- 4. CHURN VALUE VALIDATION
-- ============================================================

SELECT
    churn,
    COUNT(*) AS customer_count
FROM telecom_churn
GROUP BY churn
ORDER BY churn;


-- ============================================================
-- 5. DUPLICATE CHECK
-- ============================================================

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT (
        churn,
        accountweeks,
        contractrenewal,
        dataplan,
        datausage,
        custservcalls,
        daymins,
        daycalls,
        monthlycharge,
        overagefee,
        roammins
    )) AS distinct_rows
FROM telecom_churn;