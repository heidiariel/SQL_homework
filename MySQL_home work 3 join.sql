-- 1.	查詢所有食物名稱、產地編號、產地名稱和價格
select f.name, f.placeid, p.name, f.price 
from food f , place p
where f.placeid = p.id ; 

-- 2.	查詢所有食物名稱和產地名稱，並串接成一個字串，中間以空白隔開，並將表頭重新命為'Food name & place'
select concat ( f.name , ' ', p.name) 'Food name & place' 
from food f, place p
where f.placeid = p.id; 

-- 3.	查詢所有'台灣'生產的食物名稱和價格
select f.name, f.price  ,p.name
from food f , place p
where f.placeid = p.id 
and p.name like '台灣';

-- 4.	查詢所有'台灣'和'日本'生產的食物名稱和價格，並以價格做降冪排序
select f.name, f.price ,p.name
from food f , place p
where f.placeid = p.id 
and placeid in ('TW' ,'JP')
order by price desc; 

-- 5.	查詢前三個價格最高且'台灣'生產的食物名稱、到期日和價格，並以價格做降冪排序
select f.name, f.expiredate, f.price, p.name 
from food f , place p
where f.placeid = p.id 
and placeid like 'TW'
order by price desc limit 3; -- offset = 從第幾行開始

-- 6.	查詢每個產地(顯示產地名稱)最高、最低、加總和平均價格，表頭分別命名為'Max'、'Min'、'Sum'和'Avg'，結果皆以四捨五入的整數來顯示
select p.name, round(sum(price)) 'sum' , 
round(avg(price)) 'avg' , 
round(max(price)) 'max' , 
round(min(price)) 'min'
from  place p left join food f
on f.placeid = p.id 
group by placeid ; 

-- place7.	查詢不同產地(顯示產地名稱)和每個種類的食物數量
select  p.name , f.catalog, count(f.name) 'count' 
from place p left join food f
on f.placeid = p.id 
group by placeid,catalog; 
