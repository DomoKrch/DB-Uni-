do $$
declare
 src varchar;
 src_c varchar;
 dst varchar;
 dst_c varchar;
begin
 select src_account
 into src
 from transactions;

 select dst_account
 into dst
 from transactions;

 select currency
 into src_c
 from accounts
 where accounts.account_id = src;

 select currency
 into dst_c
 from accounts
 where accounts.account_id = dst;

 assert src_c = dst_c;
end $$;

alter table customers
alter column name set not null;

insert into customers values (500, null, '2021-12-12');

