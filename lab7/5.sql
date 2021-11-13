create index cur_index on accounts(currency);

create index transac_index on accounts(currency, balance);

select * from accounts where balance > 100 and currency = 'KZT';