/* Using this dataset, show the SQL query to find the rolling 3 day average transaction amount for each day in January 2021. */

SELECT dates, AVG(sum_transaction) OVER(ORDER BY dates ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS rolling_average from
(
SELECT dates, sum(transaction_amount) as sum_transaction from 
(
SELECT transaction_amount, TO_CHAR(transaction_time :: DATE, 'yyyy-mm-dd') as dates from transactions
) a
group by dates
) b
ORDER BY dates;
