
create database if not exists customers; 

use customers; 

drop table if exists phonenumbers; 
drop table if exists product_orders; 
drop table if exists products; 
drop table if exists orders;
drop table if exists customers;


create table customers ( 
    id int(11) not null auto_increment,
    first_name varchar(20) not null, 
    last_name varchar(20) not null, 
    street varchar(25), 
    state char(2) not null, 
    zip char(5), 
    cite varchar(20),
    primary key (id)
);

create table phonenumbers (
    id int(11) not null auto_increment,
    customer_id int(11) not null, 
    phone_number varchar(10) not null, 
    primary key (id),
    foreign key (customer_id) references customers(id)
);

create table orders (
    id int(11) not null auto_increment,
    customer_id int(11) not null, 
    date_ordered datetime default current_timestamp,
    date_delivered datetime,
    total decimal(7, 2),
    primary key (id),
    foreign key (customer_id) references customers(id)
);

create table products (
    id int(11) not null auto_increment,
    name varchar(50) not null, 
    description varchar(255), 
    price decimal(5,2) not null, 
    qty int(10) not null, 
    primary key(id)
);

create table product_orders (
    product_id int(11) not null,
    order_id int(11) not null, 
    qty int(10) not null,
    primary key (product_id, order_id),
    foreign key (product_id) references products(id),
    foreign key (order_id) references orders(id)

);