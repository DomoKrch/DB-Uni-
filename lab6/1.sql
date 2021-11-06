select client.dealer_id, dealer.name, dealer.location, dealer.charge,
       client.id, client.name, client.city, client.priority
from dealer join client
on dealer.id = client.dealer_id;

select dealer.name, dealer.charge, temp.dealer_id, temp.name, temp.city, temp.priority, temp.date, temp.amount
from dealer join
(select client.name, client.city, client.priority, sell.date, sell.amount, sell.dealer_id
from client join sell
on sell.client_id = client.id) as temp
on dealer.id = temp.dealer_id;

select client.name, dealer.name, client.city
from client join dealer
on client.city = dealer.location;

select client.name, client.id, sell.id, sell.amount
from client join sell
on sell.client_id = client.id and sell.amount > 100 and sell.amount < 500;

select dealer.name, client.name
from dealer join client
on dealer.id = client.dealer_id;

select dealer.name, dealer.charge, client.name, client.city
from dealer join client
on dealer.id = client.dealer_id;

select dealer.name, dealer.charge, client.name, client.city
from dealer join client
on dealer.id = client.dealer_id and dealer.charge > 0.12;

select temp.name, temp.city, temp.id, temp.date, temp.amount, dealer.name, dealer.charge
from dealer join
(select client.name, client.city, client.priority, sell.date, sell.amount, sell.id, sell.dealer_id
from client join sell
on sell.client_id = client.id) as temp
on dealer.id = temp.dealer_id;

select temp.name, temp.priority, dealer.name, temp.id, temp.amount
from dealer join
(select client.name, client.priority, sell.amount, sell.id, sell.dealer_id
from client join sell
on sell.client_id = client.id and sell.amount > 1000) as temp
on dealer.id = temp.dealer_id;






