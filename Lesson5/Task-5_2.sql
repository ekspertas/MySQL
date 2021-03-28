/* Практическое задание 5. */

/* Задание # 2.
 	Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR 
 	и в них долгое время помещались значения в формате 20.10.2017 8:10.
  	Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.
*/

USE shop;  -- выбор базы данных

DROP TABLE IF EXISTS users;  -- удаляем таблицу users

CREATE TABLE users (		 -- создаем таблицу с параметрами полей как в задании
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(255),
  updated_at VARCHAR(255)
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES -- заполняем таблицу
  ('Геннадий', '1990-10-05', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Наталья', '1984-11-12', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Александр', '1985-05-20', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Сергей', '1988-02-14', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Иван', '1998-01-12', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Мария', '1992-08-29', '20.10.2017 8:10', '20.10.2017 8:10');
 
UPDATE users -- обновляем данные в таблице users
SET 
	created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'),
	updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');

ALTER TABLE users MODIFY created_at DATETIME; -- обновляем типы данных столбцов

ALTER TABLE users MODIFY updated_at DATETIME;