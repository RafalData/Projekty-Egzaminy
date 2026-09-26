
--	kredyty niespłacane vs spłacane terminowo

WITH loans_grouped AS (
    SELECT
        CASE
            WHEN status IN ('B', 'D') THEN 'niespłacone'
            WHEN status IN ('A', 'C') THEN 'spłacane terminowo'
            ELSE 'other'
        END AS credit_status,
        amount
    FROM core.loan
)

SELECT
    credit_status,
    count(*)                                                 AS status_count,
    sum(amount)                                              AS sum_of_amount,
    round(100.0 * count(*)    / sum(count(*))    OVER (), 2) AS percent_of_credits,
    round(100.0 * sum(amount) / sum(sum(amount)) OVER (), 2) AS percent_of_amount
FROM loans_grouped
GROUP BY credit_status

/*
	Kredyty niespłacane (statusy B i D) stanowią 11,14% wszystkich umów, ale aż 15,09% pożyczonej kwoty.
	Oznacza to, że kredyty niespłacane są średnio wyższe niż spłacane terminowo.
	Warto sprawdzić, czym jeszcze różnią się obie grupy.
*/
