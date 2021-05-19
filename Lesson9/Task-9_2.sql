/* Практическое задание 9.*/

/* Задание # 2.
 	 	Создайте представление, которое выводит название name товарной позиции из таблицы
 	 	products и соответствующее название каталога name из таблицы catalogs.
*/

CREATE VIEW my_view (Каталог, Товар) 
		AS SELECT	catalogs.name,  
					products.name
		FROM products, catalogs
		WHERE products.catalog_id = catalogs.id;
		
SELECT * FROM my_view;