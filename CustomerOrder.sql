use empdb1;
select client_name, city from empdb1.client;
select * from product;
select client_name from client where client_name like '_a%';
select * from client where city like 'Tezpur';
select * from empdb1.product;
select * from empdb1.product where selling_price between 2001 AND 5000;
select * from empdb1.order;
ALTER TABLE `empdb1`.`product` 
ADD COLUMN `new_price` DECIMAL(10,2) NULL;
