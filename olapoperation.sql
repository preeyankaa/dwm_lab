
use olap;

create table location(
location_id varchar(10) primary key,
street varchar(20),
city varchar(20),
zip_code int
);

insert into location(location_id,street,city,zip_code)
values('AB','Roku','Manila',546763),
('BC','jimi','Tokyo',423101),
('CD','damm','seoul',345679),
('DF','piko','Shenzen',768876);

create table manager(
manager_id varchar(10) primary key,
manager_name varchar(20),
manager_phoneno int
);

insert into manager(manager_id,manager_name,manager_phoneno)
values('E2345','Kimsohyun',765642789),
('E6787','Namjoohyun',826376468),
('E4356','Leeminho',876543245);

create table sales(
sales_id varchar(10) primary key,
sales_amount int,
branch varchar(20),
manager_id Varchar(10),
location_id varchar(10)
);

insert into sales(sales_id,sales_amount)
values(12,30000),
(14,50000),
(34,70009);

create table product(
product_id varchar(10) primary key,
product_category varchar(20),
product_name varchar(20),
product_sales int,
sales_id varchar(10),
location_id varchar(10),
FOREIGN KEY (sales_id) REFERENCES sales(sales_id),
FOREIGN KEY (location_id) REFERENCES location(location_id)
);


