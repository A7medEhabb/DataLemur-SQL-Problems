WITH highest AS (
  SELECT
    ticker,
    TO_CHAR(date,'Mon-YYYY') AS highest_mth,
    MAX(open) AS highest_open,
    ROW_NUMBER() OVER(PARTITION BY ticker ORDER BY open DESC) as RN
  FROM stock_prices 
  group by ticker,  TO_CHAR(date,'Mon-YYYY'), open
),
lowest AS (
  SELECT
    ticker,
    TO_CHAR(date,'Mon-YYYY') AS lowest_mth,
    MIN(open) AS lowest_open,
    ROW_NUMBER() OVER(PARTITION BY ticker ORDER BY open ) as RN
  FROM stock_prices 
  group by ticker,  TO_CHAR(date,'Mon-YYYY'), open
)

SELECT 
  h.ticker,
  h.highest_mth,
  h.highest_open,
  l.lowest_mth,
  l.lowest_open
FROM highest h 
JOIN lowest l 
  ON h.ticker = l.ticker
WHERE h.RN=1 AND l.RN =1
ORDER BY h.ticker
