/* Практическое задание 7.*/

/* Задание # 2.
 	 	Выведите список товаров products и разделов catalogs, 
 	 	который соответствует товару.
*/

SELECT	p2.name AS 'Название товара',
		c2.name AS 'Раздел'
	FROM products p2  
	JOIN catalogs c2 
	ON p2.catalog_id = c2.id;	/* объединяем таблицы по id в каталоге. 
	Если в таблице products нет товаров с catalog_id равному id из таблицы catalogs,
	то товар не будет выведен */	