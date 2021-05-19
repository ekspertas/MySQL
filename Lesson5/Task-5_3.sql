/* Практическое задание 5. */

/* Задание # 3.
 	В таблице складских запасов storehouses_products в поле value могут встречаться самые 
 	разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо 
 	отсортировать записи таким образом,	чтобы они выводились в порядке увеличения значения value.
 	Однако нулевые запасы должны выводиться в конце, после всех записей.
*/

USE shop;  -- выбор базы данных

SELECT * FROM storehouses_products ORDER BY value = 0, value;
-- сначала "сортируем" значения где value = 0, затем - сортеруем в порядке увеличения значения value

/* Задание # 4.
(по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы 
заданы в виде списка английских названий (may, august)
*/

SELECT * FROM users WHERE birthday_at RLIKE ('^may$', '^august$'); -- проверить не успеваю
SELECT * FROM users WHERE birthday_at IN ('1990-10-05', '1984-11-12'); -- на датах в БД скрипт работает

/* Задание # 5.
(по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs 
WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.
*/

SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY field(id, '5', '2', '1');
