-- =====================================================
-- EXECUTIVE KPI OVERVIEW
-- =====================================================

SELECT
    COUNT(*) AS orders,
    ROUND(SUM("sales")::numeric,2) AS total_sales,
    ROUND(SUM("profit")::numeric,2) AS total_profit,
    ROUND(
        SUM("profit")::numeric /
        SUM("sales") * 100,
        2
    ) AS margin_pct,
    ROUND(AVG("discount")::numeric,2) AS avg_discount
FROM superstore_clean;


-- =====================================================
-- SALES AND PROFIT BY REGION
-- =====================================================

SELECT
    "region",
    ROUND(SUM("sales")::numeric,2) AS sales,
    ROUND(SUM("profit")::numeric,2) AS profit,
    ROUND(
        SUM("profit")::numeric /
        SUM("sales") * 100,
        2
    ) AS margin_pct
FROM superstore_clean
GROUP BY "region"
ORDER BY profit DESC;


-- =====================================================
-- SALES AND PROFIT BY CATEGORY
-- =====================================================

SELECT
    "category",
    ROUND(SUM("sales")::numeric,2) AS sales,
    ROUND(SUM("profit")::numeric,2) AS profit
FROM superstore_clean
GROUP BY "category"
ORDER BY profit DESC;


-- =====================================================
-- SALES AND PROFIT BY SUBCATEGORY
-- =====================================================

SELECT
    "sub_category",
    ROUND(SUM("sales")::numeric,2) AS sales,
    ROUND(SUM("profit")::numeric,2) AS profit
FROM superstore_clean
GROUP BY "sub_category"
ORDER BY profit DESC;


-- =====================================================
-- CUSTOMER SEGMENT ANALYSIS
-- =====================================================

SELECT
    "segment",
    ROUND(SUM("sales")::numeric,2) AS sales,
    ROUND(SUM("profit")::numeric,2) AS profit,
    COUNT(*) AS orders
FROM superstore_clean
GROUP BY "segment"
ORDER BY profit DESC;