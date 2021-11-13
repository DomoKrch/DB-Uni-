create role accountant;
grant select on accounts to accountant;

create role supporter;
grant select on transactions, accounts to supporter;

create role administrator;
grant all privileges on accounts to administrator;

create user Amir;
create user Saule;
create user Beket;
create user Sultan;

grant accountant to Amir;
grant supporter to Saule, Beket;
grant administrator to Sultan;
revoke supporter from Beket;

