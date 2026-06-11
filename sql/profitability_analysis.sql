-- =====================================================
-- DISCOUNT BUCKET ANALYSIS
-- =====================================================

SELECT
    CASE
        WHEN "discount" = 0 THEN 'No Discount'
        WHEN "discount" <= 0.10 THEN '0-10%'
        WHEN "discount" <= 0.25 THEN '10-25%'
        WHEN "discount" <= 0.50 THEN '25-50%'
        ELSE '50%+'
    END AS discount_bucket,

    ROUND(SUM("sales")::numeric,2) AS sales,
    ROUND(SUM("profit")::numeric,2) AS profit,
    COUNT(*) AS orders

FROM superstore_clean

GROUP BY discount_bucket
ORDER BY discount_bucket;


-- =====================================================
-- REGIONAL DISCOUNT ANALYSIS
-- Hypothesis:
-- Higher discount rates contribute to lower profitability.
-- =====================================================

SELECT
    "region",
    ROUND(AVG("discount")::numeric,2) AS avg_discount,
    ROUND(SUM("profit")::numeric,2) AS profit
FROM superstore_clean
GROUP BY "region"
ORDER BY avg_discount DESC;


-- =====================================================
-- CATEGORY DISCOUNT ANALYSIS
-- =====================================================

SELECT
    "category",
    ROUND(AVG("discount")::numeric,2) AS avg_discount,
    ROUND(SUM("profit")::numeric,2) AS profit
FROM superstore_clean
GROUP BY "category"
ORDER BY avg_discount DESC;


-- =====================================================
-- SUBCATEGORY PROFITABILITY
-- =====================================================

SELECT
    "sub_category",
    ROUND(AVG("discount")::numeric,2) AS avg_discount,
    ROUND(SUM("sales")::numeric,2) AS sales,
    ROUND(SUM("profit")::numeric,2) AS profit,
    ROUND(
        SUM("profit")::numeric /
        SUM("sales") * 100,
        2
    ) AS profit_margin_pct
FROM superstore_clean
GROUP BY "sub_category"
ORDER BY profit_margin_pct;

-- =====================================================
-- CENTRAL REGION ANALYSIS
-- =====================================================

SELECT
    "category",
    ROUND(AVG("discount")::numeric,2) AS avg_discount,
    ROUND(SUM("profit")::numeric,2) AS profit
FROM superstore_clean
WHERE "region" = 'Central'
GROUP BY "category"
ORDER BY avg_discount DESC;

-- =====================================================
-- CENTRAL REGION STATE ANALYSIS
-- =====================================================

SELECT
    "state",
    ROUND(SUM("sales")::numeric,2) AS sales,
    ROUND(SUM("profit")::numeric,2) AS profit
FROM superstore_clean
WHERE "region" = 'Central'
GROUP BY "state"
ORDER BY profit;

-- =====================================================
-- TEXAS AND ILLINOIS ROOT CAUSE ANALYSIS
-- =====================================================

SELECT
    "state",
    "sub_category",
    ROUND(SUM("sales")::numeric,2) AS sales,
    ROUND(SUM("profit")::numeric,2) AS profit
FROM superstore_clean
WHERE "state" IN ('Texas','Illinois')
GROUP BY
    "state",
    "sub_category"
ORDER BY profit;

-- =====================================================
-- TABLES DISCOUNT ANALYSIS
-- =====================================================

SELECT
    CASE
        WHEN "discount" = 0 THEN 'No Discount'
        WHEN "discount" <= 0.10 THEN '0-10%'
        WHEN "discount" <= 0.25 THEN '10-25%'
        WHEN "discount" <= 0.50 THEN '25-50%'
        ELSE '50%+'
    END AS discount_bucket,

    ROUND(SUM("sales")::numeric,2) AS sales,
    ROUND(SUM("profit")::numeric,2) AS profit

FROM superstore_clean

WHERE "sub_category" = 'Tables'

GROUP BY discount_bucket
ORDER BY discount_bucket;

-- =====================================================
-- BINDERS DISCOUNT ANALYSIS
-- =====================================================

SELECT
    CASE
        WHEN "discount" = 0 THEN 'No Discount'
        WHEN "discount" <= 0.10 THEN '0-10%'
        WHEN "discount" <= 0.25 THEN '10-25%'
        WHEN "discount" <= 0.50 THEN '25-50%'
        ELSE '50%+'
    END AS discount_bucket,

    ROUND(SUM("sales")::numeric,2) AS sales,
    ROUND(SUM("profit")::numeric,2) AS profit

FROM superstore_clean

WHERE "sub_category" = 'Binders'

GROUP BY discount_bucket
ORDER BY discount_bucket;