create type Currency_type as enum ('KZT', 'USD', 'EUR');

alter table accounts
alter column currency type Currency_type using currency::currency_type;

insert into accounts values ('DK12001', 204, 'TNG', 100, 0);
