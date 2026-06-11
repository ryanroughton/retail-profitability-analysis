-- =====================================================

-- DATA VALIDATION

-- =====================================================

-- Check row count
SELECT COUNT(*)
FROM superstore_clean;

-- Check for missing values
SELECT *
FROM superstore_clean
WHERE "sales" IS NULL
   OR "profit" IS NULL
   OR "discount" IS NULL;

-- Check duplicate orders
SELECT
    "row_id",
    COUNT(*)
FROM superstore_clean
GROUP BY "row_id"
HAVING COUNT(*) > 1;

-- Validate numeric ranges
SELECT
    MIN("sales") AS min_sales,
    MAX("sales") AS max_sales,
    MIN("profit") AS min_profit,
    MAX("profit") AS max_profit,
    MIN("discount") AS min_discount,
    MAX("discount") AS max_discount
FROM superstore_clean;

-- Result:
-- No missing values detected in Sales, Profit, or Discount.
-- No duplicate row IDs identified.