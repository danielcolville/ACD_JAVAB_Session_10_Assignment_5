use music_db;
select client_name, city from client;
select * from product;
select client_name from client where client_name like '_a%';
select * from client where city like 'Tezpur';
select * from product;
select * from product where selling_price between 2001 AND 5000;

ALTER TABLE `music_db`.`product` 
ADD COLUMN `new_price` DECIMAL(10,2) NULL;
select * from product order by description;
select order_date,idorder from music_db.order;

select * from music_db.order;
delete from music_db.order where order_date < '2008-08-25';

UPDATE `music_db`.`order`
SET
`delivery_date`=16-08-08
WHERE idorder='ON01008';

UPDATE `music_db`.`client`
SET
`total_bal`=1200
WHERE idclient= 'CN01003';

select * from product where description like 'HDD1034' or 'DVDRW';

select client_name,city,State from client where State <> 'Assam';

select * from orders where cancel_date like '%-03-%';

