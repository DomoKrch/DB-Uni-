do $$
    declare;
        src int;
        lim int;
    begin;
    insert into transactions values (4, '2021-06-05 18:02:45.000001', 'AB10203', 'NK90123', 200, 'init');
    savepoint my_save;

    update accounts set balance = balance - 200 where account_id = 'AB10203';
    update accounts set balance = balance + 200 where account_id = 'NK90123';

    select balance into src from accounts where account_id = 'AB10203';
    select accounts.limit into lim from accounts where account_id = 'AB10203';

    if src < lim then
        rollback to my_save;
        update transactions set status = 'rollback' where id = 4;
    else
        update transactions set status = 'committed' where id = 4;
    end if;
    commit;
end $$;