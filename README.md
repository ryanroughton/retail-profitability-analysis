# Retail Profitability Analysis

## Project Overview

This project analyzes a retail sales dataset containing 50,000 transactions to identify drivers of profitability, regional performance differences, and the impact of discounting on profit margins.

The analysis was conducted using PostgreSQL and SQL, with Power BI used to visualize findings and communicate business insights.

---

## Business Problem

Although Sales Mart generated over $11 million in revenue and $1.34 million in profit, profitability varied significantly across regions, states, discount levels, and product categories.

The objective was to identify:

- Which regions underperformed
- Which products generated losses
- Whether discounting affected profitability
- Opportunities to improve profit margins

---

## Tools Used

- PostgreSQL
- SQL
- Git/GitHub
- Power BI

---

## Dataset Summary

| Metric | Value |
|----------|----------:|
| Orders | 50,000 |
| Sales | $11.27M |
| Profit | $1.34M |
| Profit Margin | 11.85% |
| Average Discount | 16% |

---

## Key Findings

### 1. High Discounts Reduced Profitability

Orders receiving discounts greater than 25% generated approximately $291,000 in losses within the Central region.

### 2. Texas and Illinois Drove Most Regional Losses

Analysis revealed that Texas and Illinois accounted for the majority of losses within the Central region.

### 3. Several Product Categories Operated at Negative Margins

The largest loss-generating categories included:

- Tables
- Bookcases
- Supplies

### 4. Profitability Declined as Discounts Increased

Products that were profitable at low discount levels frequently became unprofitable once discounts exceeded approximately 25%.

---

## Recommendations

1. Limit discounts above 25%.
2. Review pricing strategy in Texas and Illinois.
3. Reevaluate pricing for Tables and Bookcases.
4. Implement product-specific discount thresholds.

---

## Repository Structure

```text
data/
sql/
README.md
```

---