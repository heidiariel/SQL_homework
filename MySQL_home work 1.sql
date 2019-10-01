-- 1.	建立一資料表名為食物(food)，有編號、名稱、到期日、產地編號、價格、種類六個欄位，分別定義如下：id(char(5),PK), name(varchar(30)), expiredate(datetime), placeid(char(2)), price(int unsigned), catalog(varchar(20))
create table food(
	id			char(5)		primary key,
    name		varchar(30),
    expiredate 	datetime,
    placeid 	char(2),
    price 		int			unsigned,
    catalog 	varchar(20)
    ); 

-- 2.	建立一資料表名為產地(place)，有編號、名稱兩個欄位，分別定義如下：id(char(2),PK), name(varchar(20))
CREATE TABLE `db01`.`place` (
  `id` CHAR(2) NOT NULL,
  `name` VARCHAR(20) NULL,
  PRIMARY KEY (`id`));

-- 3.	利用複製表格結構的方式複製food產生一個新的表格名為food1
create table food1 like food; 

-- 4.	利用food1新增、修改、重新命名和刪除一個欄位
alter table food1 
add manufacture varchar(30) after price,
change name product VARCHAR(20),
drop placeid; 


-- 5.	將food1重新命名為food2
alter table food1 rename food2; 


-- 6.	刪除food2資料表
drop table food2; -- 第六題
