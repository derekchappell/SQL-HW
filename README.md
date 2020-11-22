# In this SQL assignment we not only setup a postgre database to interact with we query it directly into  a jupyter Notebook for Analysis #

## In this first section we query directly in Postgres window to determine of there are any anomolies ##

```python
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
```

## Comments were left directly in the code which is a practice best left for relevent information regarding the data, view or query. Not the findings. ##
---

## Here we will be visually analyzing the data housed on our locally hosted server to determine if there is a presence of fraud ##
 - loading of relevant libraries and pointing our notebook to the right server
 
 ```python
import pandas as pd
import calendar
import plotly.express as px
import hvplot.pandas
from sqlalchemy import create_engine

engine = create_engine("postgresql://postgres:Mfbwahn08!@localhost:5432/Test_for_SQL_HW")
```

## Here we have a query showing a time series from the transactions along all the year for card holders 2 and 18. ##
 
 ```python
query = """
        SELECT ch.id AS cardholder, t.date AS hour, t.amount
        FROM transaction AS t
        JOIN credit_card AS cc ON cc.card = t.card
        JOIN card_holder AS ch ON ch.id = cc.id_card_holder
        WHERE ch.id in (2, 18)
        ORDER BY hour
        """
df_question1 = pd.read_sql(query, engine)
```
  - Setting the index for that query in our pandas DataFrame for analysis 
  
 [.](<a href="https://imgur.com/yXBNZQn"><img src="https://i.imgur.com/yXBNZQn.jpg" title="source: imgur.com" /></a>)
 
 ## Using our second query in order to identify how many outliers could be per month for card holder id 25 ##

```python
query_2 = """
        SELECT ch.id AS cardholder, t.date AS hour, t.amount
        FROM transaction AS t
        JOIN credit_card AS cc ON cc.card = t.card
        JOIN card_holder AS ch ON ch.id = cc.id_card_holder
        WHERE ch.id in (25)
        AND DATE BETWEEN '2018/01/01 00:00:00' and '2018/07/01 00:00:00'
        ORDER BY hour
        """
df_question2 = pd.read_sql(query_2, engine)
df_question2.set_index('hour')
df_question2.head()
```

[.](<a href="https://imgur.com/3fQI5tw"><img src="https://i.imgur.com/3fQI5tw.jpg" title="source: imgur.com" /></a>)
 
# In this assignment the primary goals were to setup a locally hosted SQL server using Postgres with schemas we created in order to query the data driectly into a python jupyter notebook for further analysis # 
