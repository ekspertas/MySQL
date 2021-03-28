/* Практическое задание 5. */

/* Задание # 1.
 Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
 Заполните их текущими датой и временем
*/

USE shop;  -- выбор базы данных

UPDATE users -- обновляем данные в таблице users
SET 
	created_at = CURRENT_TIMESTAMP,
	updated_at = CURRENT_TIMESTAMP;