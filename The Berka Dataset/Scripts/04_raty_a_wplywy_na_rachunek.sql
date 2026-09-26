WITH loans_grouped AS (
    SELECT
        CASE
            WHEN l.status IN ('B', 'D') THEN 'niespłacone'
            WHEN l.status IN ('A', 'C') THEN 'spłacane terminowo'
            ELSE 'other'
        END AS credit_status,
        l.account_id,
        l.monthly_payment
    FROM loan l
),
	monthly_inflow_to_account as (
		select
			t.account_id,
			sum(t.amount) 						as sum_of_inflow,
			left(cast(t.trans_date as text), 7) as Month
		from trans t
		join loan l on l.account_id = t.account_id 
		where t.operation in ('transfer_in','cash_deposit')
						  and t.trans_date  < l.loan_date
		group by t.account_id, 
				 left(cast(t.trans_date as text), 7)
		order by account_id 
),
	AVG_inflow_per_account as (
		select
			account_id,
			avg(sum_of_inflow) 			as AVG_inflow
		from monthly_inflow_to_account
		group by account_id 
)

select 
	lg.credit_status,
	COUNT(*) 																				as accounts,
	round(AVG(ai.AVG_inflow),2) 															as avg_monthly_inflow,
	PERCENTILE_CONT(0.5) within group (order by ai.AVG_inflow) 								as median_inflow,
	round(avg(100.0 * lg.monthly_payment / ai.avg_inflow), 2) 								as monthly_payment_to_avg_inflow,
	percentile_cont(0.5) within group (order by 100.0 * lg.monthly_payment / ai.avg_inflow) as median_payment_to_inflow 
from loans_grouped lg
inner join AVG_inflow_per_account ai on ai.account_id = lg.account_id
group by lg.credit_status

/*
	Jak widać różnica średniej wpływów między grupami jest marginalna. 
	Mediana za to jest wyższa u grupy niespłacającej zadłużenia.
	Ale można zauważyć że stosunek raty do średnich wpływów na konto jest o 11 punktów procentowych wyższy u grupy nie spłacającej.
	Mediana jednak różni się zaledwie o półtora punktu procentowego.
	Można zauważyć że u części kredytobiorców z grupy niespłacającej rata pochłania dużą część wpływów.
	Więc ciężko jednoznacznie stwierdzić przyczyne nie spłacania zadłużenia.
*/