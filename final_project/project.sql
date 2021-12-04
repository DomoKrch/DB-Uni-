create table customer
(
    ID              varchar,
    cus_name        varchar,
    account_balance float(2) check (account_balance >= 0),
    has_contract    boolean,
    orders_made     integer,
    address         varchar,
    country         varchar,
    city            varchar,
    zip             varchar,
    total_spent     float(2) check (total_spent >= 0),
    primary key (ID)
);

create table transport
(
    transport_id    varchar,
    base_region     varchar,
    status          varchar check (status in ('functional', 'out of order')),
    primary key (transport_id)
);

create table courier
(
    courier_id      varchar,
    courier_name    varchar,
    status          varchar check (status in ('functional', 'out of order')),
    base_region     varchar,
    primary key (courier_id)
);

create table package
(
    package_id      varchar,
    cus_id          varchar,
    service_type    varchar check (service_type in ('international', 'local')),
    package_type    varchar check (package_type  in ('flat envelope', 'small box', 'large box')),
    speed           varchar check (speed in ('overnight', 'second day', 'longer')),
    status          varchar check (status in ('on its way', 'aborted', 'delivered')),
    safe            boolean,
    transport_id    varchar,
    courier_id      varchar,
    dest_address    varchar,
    dest_country    varchar,
    dest_city       varchar,
    dest_zip        varchar,
    deadline        timestamp,
    completion_time timestamp,
    primary key (package_id),
    foreign key (transport_id) references transport(transport_id),
    foreign key (courier_id) references courier(courier_id),
    foreign key (cus_id) references customer(ID)
);

create table customs
(
    check_id        varchar,
    package_id      varchar,
    transport_id    varchar,
    country         varchar,
    city            varchar,
    airport_name    varchar,
    status          varchar check (status in ('ok', 'prohibited')),
    primary key (check_id),
    foreign key (package_id) references package(package_id),
    foreign key (transport_id) references transport(transport_id)
);

create table tracking
(
    package_track_id varchar,
    package_id       varchar,
    start_time       timestamp,
    country          varchar,
    city             varchar,
    address          varchar,
    change_time      timestamp,
    status           varchar check (status in ('on its way', 'aborted', 'delivered')),
    primary key (package_track_id),
    foreign key (package_id) references package(package_id)
);

create table billing
(
    bill_id         varchar,
    package_id      varchar,
    customer_id     varchar,
    customer_address varchar,
    customer_zip    varchar,
    payment_type    varchar check (payment_type in ('prepaid', 'average')),
    delivery_pace   varchar check (delivery_pace in ('overnight', 'second day', 'longer')),
    shipping_price float(2) check (shipping_price >= 0),
    is_international boolean,
    international_fee float(2) check (international_fee >= 0),
    primary key (bill_id),
    foreign key (package_id) references package(package_id),
    foreign key (customer_id) references customer(ID)
);

insert into customer values ('id1', 'Danil', 10000.00, true, 1, 'Abai 48', 'Kazakhstan', 'Almaty', '123', 5000.00);
insert into customer values ('id2', 'Alya', 6000.23, false, 0, 'Baisakov 23', 'Kazakhstan', 'Almaty', '344', 2343.45);
insert into customer values ('id3', 'Aidar', 1233.33, false, 2, 'Lenin 11', 'Kazakhstan', 'Almaty', '565', 1234.00);
insert into customer values ('id4', 'Kanat', 0, true, 1, 'Lenin 11', 'Kazakhstan', 'Almaty', '124', 1002.34);
insert into customer values ('id5', 'Dmitriy', 2345.00, false, 1, 'Mir 32', 'Kazakhstan', 'Almaty', '213', 23.00);

insert into transport values ('truck1', 'Kazakhstan', 'functional');
insert into transport values ('truck2', 'Kazakhstan', 'functional');
insert into transport values ('plane1', 'Belarus', 'out of order');
insert into transport values ('plane2', 'Russia', 'functional');
insert into courier values ('cu1', 'Ashat', 'functional', 'Kazakhstan');
insert into courier values ('cu2', 'Dariga', 'functional', 'Kazakhstan');
insert into courier values ('cu3', 'Arman', 'out of order', 'Kazakhstan');

insert into package values ('pack1', 'id1', 'international', 'large box', 'longer', 'aborted', true, 'plane1',
                            'cu1', 'Abai 48', 'Kazakhstan', 'Almaty', '123', '2019-02-12 02:10:15-02',
                            '2020-02-09 12:13:25-03');
insert into package values ('pack2', 'id5', 'international', 'large box', 'overnight', 'aborted', true, 'plane1',
                            'cu2', 'Mir 32', 'Kazakhstan', 'Almaty', '213', '2019-03-31 09:30:20-07', null);
insert into package values ('pack3', 'id3', 'international', 'small box', 'second day', 'aborted', true, 'plane1',
                            'cu3', 'Lenin 11', 'Kazakhstan', 'Almaty', '565', '2020-03-31 08:31:12-02', null);
insert into package values ('pack4', 'id4', 'local', 'small box', 'longer', 'delivered', true, 'truck2',
                            'cu1', 'Lenin 11', 'Kazakhstan', 'Almaty', '124', '2020-03-20 08:31:12-02',
                            '2020-04-15 02:34:12-02');
insert into package values ('pack5', 'id3', 'local', 'small box', 'second day', 'on its way', true, 'truck2',
                            'cu3', 'Lenin 11', 'Kazakhstan', 'Almaty', '565', '2020-05-21 22:31:12-02', null);


select address, count(address) as maximum from customer
group by address
order by maximum desc
limit 1;

select package_id, deadline, completion_time from package where completion_time > deadline;




