-- 1.	以不列舉欄位的方式新增一筆食物資料
insert into food (id, name,expiredate,placeid ,price,catalog)
values ('SG004','醬油膏','2018/9/15','TW',200,'調味品');

-- 2.	以列舉欄位的方式新增一筆食物資料
insert into food 
values('OL004', '蠔油', '2019/09/18', 'jp', 60, '調味品');

-- 3.	以不列舉欄位的方式新增多產地資料
insert into place values
('KR', '韓國'),('PH', '菲律賓');

-- 4.	修改一筆食物資料的價格
update food
set price=450
where id = 'SG004';

-- 5.	按價格分250以下、251~500和501以上三種分別增加8%,5%和3%且價格無條件捨去成整數
select name, price,
	CASE
		When price <=250 then round(price*1.08 )
		When price between 251 and 500 then round(price*1.05 )
		When price >= 501 then round(price*1.03 )
        ELSE'D'
	END 'new price'
from food; 
-- 6.	刪除一筆食物資料
delete from food where id = 'SG004';