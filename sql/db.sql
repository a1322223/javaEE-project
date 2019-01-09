drop database if exists db_a;
create database db_a;
drop table if exists db_a.user;
create table db_a.user (
  id       int auto_increment primary key
  comment 'id PK',
  email    varchar(191) not null unique
  comment 'email NN UN',
  password varchar(64)  not null
  comment 'password NN'
)
  comment 'user table';
drop table if exists db_a.user_info;
create table db_a.user_info (
  id       int          auto_increment primary key
  comment 'id PK',
  username varchar(255) comment 'username',
  avatar   varchar(255) default 'default.png'
  comment 'avatar',
  mobile varchar(255) comment 'mobile',
  createTime datetime comment 'sign up time',
  updateTime datetime comment 'last sign time ',
  updateIp varchar(255) comment 'last sign in ip address',
  token varchar(255) comment 'token for reset password',
  tokenTime bigint comment 'token int',
  userId   int comment 'user id FK'
)comment 'user info table';


alter table db_a.user_info
  add constraint
  user_info_fk_userId
foreign key (userId)
references db_a.user (id);
select * from db_a.user_info;

select * from db_a.user;
select * from db_a.user_info;
truncate db_a.user;
truncate db_a.user_info;

drop table if exists db_a.product;
create table db_a.product (
  id             int                     auto_increment primary key
  comment 'id PK',
  productId int not null comment 'product id',
  title          varchar(255)   not null
  comment 'title NN',
  `desc`           varchar(255)           default null
  comment 'describe NN',
  coverPicture   varchar(255)   not null
  comment 'cover picture NN',
  slidePictures  text           not null
  comment 'slide pictures NN',
  detailPictures text           not null
  comment 'detail pictures NN',
  price          decimal(10, 2) not null
  comment 'price NN',
  originPrice    decimal(10, 2) default null
  comment 'origin price',
  createTime     timestamp       not null default current_timestamp
  comment 'create time NN',
  updateTime     datetime comment 'update time',
  stock int not null default 1000 comment 'stock',
  status         int            not null default 0
  comment 'status 0: 1: 2:',
  mp4 varchar(255) default null comment 'mp4',
  webm varchar(255) default null comment 'webm',
  categoryId     int comment 'category id FK'
)comment 'product table';

set foreign_key_checks = 1;

drop table if exists db_a.category;
create table db_a.category (
  id int auto_increment primary key
  comment 'id PK',
  title varchar(255) not null comment 'title NN',
  `group` varchar(255) default null comment 'group',
  icon varchar(255) default null comment 'icon',
  `desc` varchar(255) default null comment 'describe',
  createTime timestamp  NOT NULL default current_timestamp comment 'create time NN',
  updateTime datetime default null comment 'update time',
  status int not null default 0 comment 'status NN',
  categoryId int default null comment 'parent category id'
) comment 'category table';

alter table db_a.product
  add constraint
  produce_fk_categoryId
foreign key (categoryId)
references db_a.category (id);

select *
from db_a.product;

truncate db_a.product;

select *
from db_a.category;



truncate db_a.product;

drop table if exists db_a.address;
create table db_a.address (
  id       int                   auto_increment primary key
  comment 'id PK',
  province varchar(255) not null
  comment 'province NN',
  city     varchar(255)
  comment 'city NN',
  area varchar(255) not null
  comment 'area NN',
  town   varchar(255) not null
  comment 'town NN',
  detail   varchar(255) not null
  comment 'detail address NN',
  name     varchar(255) not null
  comment 'name NN',
  mobile   varchar(255) not null
  comment 'mobile NN',
  status   int          not null
  comment 'status 1:default address',
  userId   int comment 'user id FK'
)comment 'address table';

alter table db_a.address add constraint  address_fk_user foreign key (userId)references db_a.user (id);

select * from db_a.address;

set foreign_key_checks = 1; /*暂时解除关联关系*/

drop table if exists db_a.cart;
create table db_a.cart (
  id int auto_increment primary key
  comment 'id PK',
  productId int not null comment 'product id NN FK',
  number int not null comment 'product number NN',
  createTime datetime not null comment 'create time NN',
  updateTime datetime comment 'update time',
  userId int not null comment 'user id NN FK'
)comment 'cart table';

alter table db_a.cart add constraint  cart._fk_product foreign key (productId)references db_a.product (id);
alter table db_a.cart add constraint  cart._fk_user foreign key (userId)references db_a.user (id);

select *
from db_a.cart;




select id from db_a.cart where productId = 2 and userId = 1;

truncate db_a.cart;

select * from db_a.address  where userId=1 limit 1 offset 0;
select * from db_a.address;


load data local infile 'C:/Users/guoyan/PycharmProjects/Spider_Demo/spider/csv/categories.csv'
into table db_a.category
fields terminated by ','
ignore 1 lines
(id,title,@v_group,@v_icon,@v_desc,@v_categoryId)
set
  `group` = nullif(@v_group,''),
  icon = nullif(@v_icon,''),
  `desc` = nullif(@v_desc,''),
  categoryId = nullif(@v_categoryId,'');

select * from db_a.category;
select * from db_a.cart;

update db_a.category set categoryId = null where categoryId = 0

drop table if exists db_a.orderProduct;
create table db_a.orderProduct (
  id       int auto_increment primary key
  comment 'id PK',
  productId    int 
  comment 'productId',
  number int  
  comment 'product number'
)
  comment 'orderProduct table';
