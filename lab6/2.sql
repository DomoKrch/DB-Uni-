create view a1
as select count(distinct client.name)
from client;

select * from a1;

create view a2
as select sell.date, avg(sell.amount)
from sell
group by sell.date;

select * from a2;

create view a3
as select sell.date, sum(sell.amount)
from sell
group by sell.date;

select * from a3;

create view b1
as select sell.date, sum(sell.amount)
from sell
group by sell.date
limit 5;

select * from b1;

create view c1
as select dealer.name, count(distinct sell.id)
from dealer, sell
where dealer.id = sell.dealer_id
group by dealer.name;

select * from c1

create view c2
as select dealer.name, avg(sell.amount)
from dealer, sell
where dealer.id = sell.dealer_id
group by dealer.name;

select * from c2;

create view c3
as select dealer.name, sum(sell.amount)
from dealer, sell
where dealer.id = sell.dealer_id
group by dealer.name;

select * from c3;

create view d1
as select dealer.name, dealer.location, sum(sell.amount) * dealer.charge as earn
from dealer join sell
on dealer.id = sell.dealer_id
group by dealer.name, dealer.charge, dealer.location;

select * from d1;

create view e1
as select dealer.name, dealer.location, count(distinct sell.id)
from dealer, sell
where dealer.id = sell.dealer_id
group by dealer.name, dealer.location;

select * from e1;

create view e2
as select dealer.name, dealer.location, avg(sell.amount)
from dealer, sell
where dealer.id = sell.dealer_id
group by dealer.name, dealer.location;

select * from e2;

create view e3
as select dealer.name, dealer.location, sum(sell.amount)
from dealer, sell
where dealer.id = sell.dealer_id
group by dealer.name, dealer.location;

select * from e3;

create view f1
as select client.name, client.city, count(distinct sell.id)
from sell, client
where client.id = sell.client_id
group by client.name, client.city;

select * from f1;

create view f2
as select client.name, client.city, avg(sell.amount)
from sell, client
where client.id = sell.client_id
group by client.name, client.city;

select * from f2;

create view f3
as select client.name, client.city, sum(sell.amount)
from sell, client
where client.id = sell.client_id
group by client.name, client.city;

select * from f3;

create view g1
as select client.name, client.city, sum(sell.amount) as expenses
from sell, client
where client.id = sell.client_id
group by client.name, client.city;

select * from g1;

create view g2
as select dealer.name, dealer.location, sum(sell.amount) as sales
from dealer, sell
where dealer.id = sell.dealer_id
group by dealer.name, dealer.location;

select * from g2;

create view g3
as select g1.city, g1.expenses, g2.sales
from g1, g2
where g1.city = g2.location and g1.expenses > g2.sales;

select * from g3;

















