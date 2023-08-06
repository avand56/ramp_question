/* Using this dataset, show the SQL query to find the rolling 3 day average transaction amount for each day in January 2021. */


SELECT *, AVG(sum_transactions) OVER(ORDER BY dates ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS rolling_average from
(
SELECT TO_CHAR(transaction_time :: DATE, 'yyyy-mm-dd') as dates, sum(transaction_amount) as sum_transactions from transactions
group by dates) a
ORDER BY dates;
