/* Практическое задание 7.*/

/* Задание # 3.
 	 	(по желанию) Пусть имеется таблица рейсов flights (id, from, to)
 	 	и таблица городов cities (label, name). Поля from, to и label содержат
 	 	английские названия городов, поле name — русское. Выведите список рейсов 
 	 	flights с русскими названиями городов.
*/

CREATE DATABASE airport;

USE airport;

CREATE TABLE flights(
	id SERIAL PRIMARY KEY,
	fl_from varchar(255),
	fl_to varchar(255));
	
INSERT INTO flights VALUES 
	(NULL, 'moscow', 'omsk'),
	(NULL, 'novgorod', 'kazan'),
	(NULL, 'irkutsk', 'moscow'),
	(NULL, 'omsk', 'irkutsk'),
	(NULL, 'moscow', 'kazan');
	
CREATE TABLE cities(
	label varchar(255),
	name varchar(255));
	
INSERT INTO cities VALUES
	('moscow', 'Москва'),
	('irkutsk', 'Иркутск'),
	('novgorod', 'Новгород'),
	('kazan', 'Казань'),
	('omsk', 'Омск');
	
SELECT 	f.id AS 'Номер рейса',
		c.name AS 'Откуда',
		c2.name AS 'Куда' 
FROM flights f
	JOIN cities c ON c.label = f.fl_from 
	JOIN cities c2 ON c2.label = f.fl_to
ORDER BY f.id;