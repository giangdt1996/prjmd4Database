create database projectmd4;
use projectmd4;



create table role(
id int auto_increment primary key,
name varchar(10)
);
insert into role(name)  values
("admin"),
("manager"),
("user");
 
create table user(
id int auto_increment primary key,
username varchar(15) unique,
email varchar(255) unique,
first_name varchar(255),
last_name varchar(255),
password varchar(255),
address varchar(255),
role int default 3,
avatar varchar(255),
status bit default 0,
foreign key (role) references role(id)
);
create table product(
product_id int auto_increment primary key,
name varchar(255),
description text,
unit_price int check(unit_price >=0),
image varchar(255),
stock int check (stock>=0)
);
create table orders(
order_id int auto_increment primary key,
user_id int,
order_at datetime default now(),
total_price int,
status int default 0,
note text,
foreign key (user_id) references user(id)
);
create table orders_detail(
detail_id int auto_increment primary key,
order_id int,
product_id int(255),
unit_price int,
quantity int,
sub_total_price int,
foreign key (product_id) references product(product_id),
foreign key (order_id) references orders(order_id)
);

delimiter //
create procedure findAll()
begin 
select * from user;
end //

delimiter //
create procedure findById(in idFind int)
begin 
select * from user where idFind = id;
end //

delimiter //
create procedure updateUser(idUp int, newusername varchar(15),
newemail varchar(255),
newfirst_name varchar(255),
newlast_name varchar(255),
newpassword varchar(255),
newavatar varchar(255))
begin 
update user set username = newusername,
email = newemail,
first_name = newfirst_name,
last_name = newlast_name,
password = newpassword,
avatar = newavatar where idUp = id;
end //

delimiter //
create procedure deleteById(in idDel int)
begin 
delete from user where id = idDel;
end //
