/* Практическое задание 9.
 * Практическое задание по теме “Хранимые процедуры и функции, триггеры" */

/* Задание # 2.
 	 	В таблице products есть два текстовых поля: name с названием товара и 
 	 	description с его описанием. Допустимо присутствие обоих полей или одно 
 	 	из них. Ситуация, когда оба поля принимают неопределенное значение NULL 
 	 	неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей 
 	 	или оба поля были заполнены. При попытке присвоить полям NULL-значение 
 	 	необходимо отменить операцию.
*/

DROP TRIGGER IF EXISTS check_name_or_desсription_before_insert;
DROP TRIGGER IF EXISTS check_name_or_desсription_before_update;

DELIMITER //

CREATE TRIGGER check_name_or_desсription_before_insert BEFORE INSERT ON products
FOR EACH ROW
BEGIN
   IF NEW.name IS NULL AND 
   	  NEW.desсription IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! Insert Canceled.';
   END IF;
END//

CREATE TRIGGER check_name_or_desсription_before_update BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
   IF NEW.name IS NULL AND 
   	  NEW.desсription IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error! Update Canceled.';
   END IF;
END//

DELIMITER ;

INSERT INTO products (name, desсription, price, catalog_id) VALUES -- сработает
	('Trigger', 'Check', 10000, 1);

INSERT INTO products (name, desсription, price, catalog_id) VALUES -- -- сработает
	('Trigger_1', null, 10000, 1);
	
INSERT INTO products (name, desсription, price, catalog_id) VALUES -- -- сработает
	(NULL, 'Check_1', 10000, 1);

INSERT INTO products (name, desсription, price, catalog_id) VALUES -- выдаст сообщение об ошибке
	(NULL, NULL, 10000, 1);

UPDATE products SET name = NULL, desсription = NULL WHERE name = 'Trigger'; -- сработает

-- или этот запрос сработает, если не выполнен предъидущий запрос:
-- UPDATE products SET desсription = NULL WHERE name = 'Trigger';  

UPDATE products SET name = NULL WHERE name = 'Trigger_1'; -- выдаст сообщение об ошибке

UPDATE products SET desсription = NULL WHERE desсription = 'Check_1'; -- выдаст сообщение об ошибке 