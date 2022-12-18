create database QuanLyBanHang;
use QuanLyBanHang;
create table Customer(
cID int not null primary key,
cName varchar(15) not null,
cAge int not null
);
create table `Order`(
oID int not null primary key,
cID int not null,
oDate datetime not null,
oTotalPrice bigint,
foreign key (cID) references Customer(cID)
);
create table OrderDetail(
oID int not null,
pID int not null,
odQTY middleint not null,
primary key (oID, pID),
foreign key (oID) references `Order`(oID)
);
create table Product(
pID int not null primary key,
pName varchar(60) not null,
pPrice bigint not null
);
alter table OrderDetail
add foreign key (pID) references Product(pID);
alter table Customer
add unique (cID);
alter table `Order`
add unique (oID, cID);
alter table OrderDetail
add unique (oID, pID);
alter table Product
add unique (pID);
alter table OrderDetail
alter odQTY set default 0;
alter table OrderDetail
add check (odQTY >= 1);