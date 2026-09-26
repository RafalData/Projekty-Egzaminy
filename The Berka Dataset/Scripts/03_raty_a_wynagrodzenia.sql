WITH loans_grouped AS (
    SELECT
        CASE
            WHEN l.status IN ('B', 'D') THEN 'niespłacone'
            WHEN l.status IN ('A', 'C') THEN 'spłacane terminowo'
            ELSE 'other'
        END AS credit_status,
        l.account_id,
        l.monthly_payment,
        d.avg_salary 
    FROM loan l
    inner join account a on a.account_id = l.account_id
    inner join district d on d.district_id = a.district_id 
)
SELECT
    credit_status,
    round(avg(avg_salary),2) as avg_salary,
    percentile_cont(0.5) WITHIN GROUP (ORDER BY avg_salary) as median_of_salary,
    round(avg(monthly_payment),2) as avg_monthly_payment,
    round(avg(100.0 * monthly_payment / avg_salary), 2) AS avg_payment_to_salary,
    COUNT(*)
FROM loans_grouped
GROUP BY credit_status

/*
  Baza danych nie zawiera pewnej informacji o zarobkach klientów. Możemy określić wyłącznie wpływy na konto, co nie daje jednoznacznej infromacji o zarobkach.
  Określiłem więc średnią i mediane przeciętnego wynagrodzenia w regionie klienta.
  Jak możemy zauważyć nie odstają one znacząco między statusem kredytów.
  Ale można zauważyc wyraźną różnicę między udziałem raty w pensji per status.
  W kredytach niespłacanych możemy zauważyć że rata pochłania średnio o 14 punktów procentowych więcej przeciętnej pensji w regionie.
  Różnica nie wynika z niższych zarobków w regionie, tylko z wyższej raty.
  Na wszelki wypadek porównam z wpływami na konto.
 */
