/*
	kredyty niespłacane vs spłacane terminowo z uwzględnieniem:
	średnia kwota kredytu,
	średni okres kredytowania,
	średnia miesięczna rata
*/

WITH loans_grouped AS (
    SELECT
        CASE
            WHEN status IN ('B', 'D') THEN 'niespłacone'
            WHEN status IN ('A', 'C') THEN 'spłacane terminowo'
            ELSE 'other'
        END AS credit_status,
        amount,
        duration_months,
        monthly_payment
    FROM loan
)

SELECT
    credit_status,
    count(*)                                                 AS status_count,
    round(100.0 * count(*)    / sum(count(*))    OVER (), 2) AS percent_of_credits,
    round(100.0 * sum(amount) / sum(sum(amount)) OVER (), 2) AS percent_of_amount,
    round(avg(amount), 2)                                    AS Avg_of_amount,
    round(AVG(duration_months), 2)							 AS Avg_of_credit_duration,
    round(AVG(monthly_payment), 2)							 AS Avg_of_monthly_payment
FROM loans_grouped
GROUP BY credit_status

/*
 Na podstawie danych można zauważyć, że kredyty niespłacane są zawarte średnio na dużo wyszą kwotę(ok. 40%) niż te spłacane.
 Dodatkowo okres kredytowania jest niemalże identyczny, co powoduje że miesięczna rata jest wyższa o około 30%.
 
 Warto sprawdzić czy wysokość zarobków klientów niespłacających zadłużenie ma wpływ na status kredytu.
 */
