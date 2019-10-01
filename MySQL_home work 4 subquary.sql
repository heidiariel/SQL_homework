-- 1.	查詢所有比'鳳梨酥'貴的食物名稱、到期日和價格
select name,expiredate,price
from food
where price > (select price 
				from food
                where name = '鳳梨酥'); 
   
-- 2.	查詢所有比'曲奇餅乾'便宜且種類是'點心'的食物名稱、到期日和價格
select name,expiredate,price,catalog
from food 
where price < (select price 
				from food
                where name = '曲奇餅乾')
and catalog = '點心'; 


-- 3.	查詢所有和'鳳梨酥'同一年到期的食物名稱、到期日和價格
select name,price, year(expiredate)'年份'
from food
where substring(expiredate,1,4) = (select year(expiredate)
                    from food
                    where name ='鳳梨酥'); 

-- 4.	查詢所有比平均價格高的食物名稱、到期日和價格
select name,expiredate,price
from food
where price > (select avg(price)
				from food);

-- 5.	查詢所有比平均價格低的'台灣'食物名稱、到期日和價格
select f.name,f.expiredate,f.price, p.name
from food f,place p
where f.placeid = p.id
and f.price < (select avg(price)
				from food)
and placeid = 'tw';

-- 6.	查詢所有種類和'仙貝'相同且價格比'仙貝'便宜的食物名稱、到期日和價格
select name,expiredate,price
from food
where catalog = (select catalog
				from food
                where name = '仙貝')
and price < (select price
				from food
                where name = '仙貝');
                
-- 7.	查詢所有產地和'仙貝'相同且到期日超過6個月以上的食物名稱、到期日和價格
select name,expiredate,price
from food
where catalog = (select catalog
				from food
                where name = '仙貝')
and datediff(expiredate, now()) < -180;

-- 8.	查詢每個產地價格最低的食物名稱、到期日和價格
select f.name,f.expiredate,f.price, p.name
from place p left join food f
on f.placeid = p.id
and price = (select min(price)
				from food
                where placeid = f.placeid); -- 類似於group by


-- 9.	查詢每個種類的食物價格最高者的食物名稱和價格
select name,price,catalog
from food f
where price = (select max(price)
				from food
                where catalog = f.catalog);
                
-- 10.	查詢所有種類不是'點心'但比種類是'點心'貴的食物名稱、種類和價格，並以價格做降冪排序
select name,price,catalog
from food 
where catalog != '點心'
and price > (select max(price)
				from food
                where catalog = '點心')
order by price desc;

-- 11.	查詢每個產地(顯示產地名稱)的食物價格最高者的食物名稱和價格
select f.name,f.price, p.name
from place p left join food f
on f.placeid = p.id
and price = (select max(price)
				from food
                where placeid = f.placeid);



