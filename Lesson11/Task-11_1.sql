/* Практическое задание 11.
 * Практическое задание по теме “Оптимизация запросов” */

/* Задание # 1.
 	 	Создайте таблицу logs типа Archive. Пусть при каждом создании записи
 	 	в таблицах users, catalogs и products в таблицу logs помещается время 
 	 	и дата создания записи, название таблицы, идентификатор первичного ключа
 	 	и содержимое поля name.
*/

-- Создаем таблицу с указанными столбцами

DROP TABLE IF EXISTS logs;			 

CREATE TABLE logs (						
	id bigint UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	created_at datetime COMMENT 'Время и дата создания записи',
	table_name varchar(10) COMMENT 'Название таблицы',
	entry_id bigint COMMENT 'Идентификатор первичного ключа',
	name varchar(255) COMMENT 'Содержимое поля name'	
) ENGINE=ARCHIVE COMMENT = 'Логи создания записей';

/*  Т.к. в условии задания не сказано, каким способом надо реализовать код,
 	мне показалось более логочным сделать триггеры на заполнение таблицы логов,
 	срабатывающих после заполнения полей в исходных таблицах. Один триггер для 
 	нескольких таблиц сделать в MySQL нельзя, поэтому делаем 3 отдельных триггера.
 	Время создания записей соответвует системному (текущему) времени, поэтому,
 	при создании записей указывем SYSDATE().
 
 */

DROP TRIGGER IF EXISTS insert_users_into_logs;
DROP TRIGGER IF EXISTS insert_catalogs_into_logs;
DROP TRIGGER IF EXISTS insert_products_into_logs;

DELIMITER //

CREATE TRIGGER insert_users_into_logs AFTER INSERT ON users  
FOR EACH ROW
BEGIN 
    INSERT INTO logs (created_at, table_name, entry_id, name) VALUES 
	(SYSDATE(), 'users', NEW.id, NEW.name);
END//

CREATE TRIGGER insert_catalogs_into_logs AFTER INSERT ON catalogs  
FOR EACH ROW
BEGIN 
    INSERT INTO logs (created_at, table_name, entry_id, name) VALUES 
	(SYSDATE(), 'catalogs', NEW.id, NEW.name);
END//

CREATE TRIGGER insert_products_into_logs AFTER INSERT ON products  
FOR EACH ROW
BEGIN 
    INSERT INTO logs (created_at, table_name, entry_id, name) VALUES 
	(SYSDATE(), 'products', NEW.id, NEW.name);
END//

DELIMITER ;

INSERT INTO users (name, birthday_at) VALUES ('Кузя', '1973-02-21');

INSERT INTO catalogs (name) VALUES ('Звуковые карты');

INSERT INTO products (name, desсription, price, catalog_id)
VALUES ('Asus Xonar U5', 'Звуковая карта Asus Xonar U5', 1874, 8);

-- Прверенно :) , все срабатывает.
