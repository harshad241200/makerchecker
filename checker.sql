create database checker;
use checker;
create table product(
id int primary key not null identity,
productname varchar(100),
productid int,
makerid int,
makername varchar(100),
pr_status varchar(50) NOT NULL CHECK (pr_status IN('APPROVED','PENDING','REJECT'))  default 'PENDING',
createdAt datetime default CURRENT_TIMESTAMP
)

select * from product
