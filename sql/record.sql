drop table if exists db_a.record;
create table db_a.record (
  id         int auto_increment primary key
  comment 'id PK',
  userId     int  not null
  comment 'user id NN ',
  categoryId int  not null
  comment 'category id NN',
  productId  int  not null
  comment 'product id NN ',
  recordTime long not null
  comment 'recordTime NN '
)
  comment 'record table';

truncate table db_a.record;


select *
from db_a.record;