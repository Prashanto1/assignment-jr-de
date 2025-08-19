# For calculating Working capital
"""SELECT 
    REPLACE(REPLACE(t_a.Total_current_assets, '$', ''), ',', '') AS Assets_clean,
    REPLACE(REPLACE(t_l.Total_current_liabilities, '$', ''), ',', '') AS Liabilities_clean,
    (CAST(REPLACE(REPLACE(t_a.Total_current_assets, '$', ''), ',', '') AS DECIMAL(15,2)) -
     CAST(REPLACE(REPLACE(t_l.Total_current_liabilities, '$', ''), ',', '') AS DECIMAL(15,2))) AS Working_Capital
FROM assignment_db.financial_data_current_assets t_a
INNER JOIN assignment_db.financial_data_current_liabilities t_l 
    ON t_a.index = t_l.index;"""


# Debt-to-Equity Ratio (Total Liabilities ÷ Total Equity)   
"""SELECT 
    t_l.index,
    CAST(REPLACE(REPLACE(t_l.Total_liabilities, '$', ''), ',', '') AS DECIMAL(15,2)) 
      / CAST(REPLACE(REPLACE(t_e.Total_stockholders_equity, '$', ''), ',', '') AS DECIMAL(15,2)) 
      AS Debt_to_Equity
FROM financial_data_noncurrent_liabilities t_l
JOIN financial_data_stockholders_equity t_e 
  ON t_l.index = t_e.index;"""

# Net Profit Margin (Net Income ÷ Total Revenue)
"""SELECT 
    r.index,
    CAST(REPLACE(REPLACE(o.Net_income, '$', ''), ',', '') AS DECIMAL(15,2)) 
      / CAST(REPLACE(REPLACE(r.Total_revenue, '$', ''), ',', '') AS DECIMAL(15,2)) 
      AS Net_Profit_Margin
FROM financial_data_revenue r
JOIN financial_data_cash_flows_from_operating_activities o 
  ON r.index = o.index;"""


# Gross Profit Margin ((Revenue – Operating Expenses) ÷ Revenue)
"""
SELECT 
    r.index,
    (CAST(REPLACE(REPLACE(r.Total_revenue, '$', ''), ',', '') AS DECIMAL(15,2)) 
     - CAST(REPLACE(REPLACE(o.Total_operating_expenses, '$', ''), ',', '') AS DECIMAL(15,2)))
    / NULLIF(CAST(REPLACE(REPLACE(r.Total_revenue, '$', ''), ',', '') AS DECIMAL(15,2)), 0) 
    AS Gross_Margin
FROM financial_data_revenue r
JOIN financial_data_operating_expenses o 
  ON (
    (r.index = 'For_the_Thirteen_Weeks_Ended_July_5_2025' AND o.index = 'Three_Months_Ended_June_30_2025') OR
    (r.index = 'For_the_TwentySix_Weeks_Ended_July_5_2025' AND o.index = 'Six_Months_Ended_June_30_2025') OR
    (r.index = 'For_the_TwentySix_Weeks_Ended_July_6_2024' AND o.index = 'Six_Months_Ended_June_30_2024')
  );
"""

# Return on Assets (ROA) (Net Income ÷ Total Assets)
"""
SELECT 
    a.index,
    CAST(REPLACE(REPLACE(o.Net_income, '$', ''), ',', '') AS DECIMAL(15,2)) 
    / CAST(REPLACE(REPLACE(a.Total_assets, '$', ''), ',', '') AS DECIMAL(15,2)) 
    AS Return_on_Assets
FROM financial_data_noncurrent_assets a
JOIN financial_data_cash_flows_from_operating_activities o 
  ON a.index = 'June_30_2025_unaudited' 
     AND o.index = 'For_the_TwentySix_Weeks_Ended_July_5_2025';
"""

# Current Ratio (Total Current Assets ÷ Total Current Liabilities)

"""
SELECT 
    t_a.index,
    CAST(REPLACE(REPLACE(t_a.Total_current_assets, '$', ''), ',', '') AS DECIMAL(15,2)) 
    / NULLIF(CAST(REPLACE(REPLACE(t_l.Total_current_liabilities, '$', ''), ',', '') AS DECIMAL(15,2)), 0) 
    AS Current_Ratio
FROM financial_data_current_assets t_a
JOIN financial_data_current_liabilities t_l 
    ON t_a.index = t_l.index;
"""

# Operating Cash Flow to Net Income Ratio (Net Cash from Operating Activities ÷ Net Income)
"""
SELECT 
    o.index,
    CAST(REPLACE(REPLACE(a.Net_cash_provided_by_operating__e1a527a0, '$', ''), ',', '') AS DECIMAL(15,2)) 
    / NULLIF(CAST(REPLACE(REPLACE(o.Net_income, '$', ''), ',', '') AS DECIMAL(15,2)), 0) 
    AS Operating_Cash_Flow_to_Net_Income
FROM financial_data_cash_flows_from_operating_activities o
JOIN financial_data_changes_in_assets_and_liabilities a 
    ON o.index = a.index;
"""


# Asset Turnover Ratio (Total Revenue ÷ Total Assets)
"""
SELECT 
    r.index,
    CAST(REPLACE(REPLACE(r.Total_revenue, '$', ''), ',', '') AS DECIMAL(15,2)) 
    / CAST(REPLACE(REPLACE(a.Total_assets, '$', ''), ',', '') AS DECIMAL(15,2)) 
    AS Asset_Turnover_Ratio
FROM financial_data_revenue r
JOIN financial_data_noncurrent_assets a 
    ON (
        (r.index = 'For_the_TwentySix_Weeks_Ended_July_5_2025' AND a.index = 'June_30_2025_unaudited') OR
        (r.index = 'For_the_TwentySix_Weeks_Ended_July_6_2024' AND a.index = 'December_31_2024')
    );
"""
