SELECT ch.id AS cardholder, t.date AS hour, t.amount
        FROM transaction AS t
        JOIN credit_card AS cc ON cc.card = t.card
        JOIN card_holder AS ch ON ch.id = cc.id_card_holder
        WHERE ch.id in (25)
        AND DATE BETWEEN '2018/01/01 00:00:00' and '2018/07/01 00:00:00'
        ORDER BY hour
		
select * from transaction

SELECT ch.id AS cardholder, t.date AS hour, t.amount
        FROM transaction AS t
        JOIN credit_card AS cc ON cc.card = t.card
        JOIN card_holder AS ch ON ch.id = cc.id_card_holder
        WHERE ch.id in (2, 18)
        ORDER BY hour

Select date, amount, card
from transaction
where date_part('hour', date) >=7 and date_part('hour', date) <= 9
order by amount DESC
Limit 100
--Without a full DD (Due Diligence) work up of the cusotmers who carry these cards it would be impossible 
--to tell if the transactions were fraud. Take #5811 for example achieving three of the top 10 spots
--these could be fraud yes or maybe its usually when the CEO's secretary makes the plan tickets purchases
--usually. In my opinion nothing stands out as odd, if there was identical amounts, huge sums, or
--short periods for large transactions then my answer would be yes.
Select * from merchant
Select * from transaction
Select * from credit_card
Select * from card_holder

Select merchant.id,
	   merchant.name,
	   transaction.id_merchant,
	   transaction.amount,
       transaction.id
from transaction
INNER JOIN merchant on transaction.id_merchant = merchant.id
ORder by amount ASC
Limit 100;
--Again nothing in particular stands out to me, judging fraud by the smallest transactions is usally
--handled automatically by the CC company and is linked to known fraudsters. Is there fraud? Possibly,
--but making a concrete conclusion would not in my opinion be fair to make. 