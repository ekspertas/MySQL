/* Практическое задание 9.*/

/* Задание # 1.
 	 	В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы 
 	 	данных.	Переместите запись id = 1 из таблицы shop.users в таблицу sample.users.
 	 	Используйте транзакции.
*/
START TRANSACTION;

INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
-- вставляем в таблицу sample.users запись (полностью) и таблицы shop.users с id = 1
DELETE FROM sample.users WHERE id = 1 LIMIT 1;
/* удаляем из таблицы sample.users одну запись с id = 1 (удаляется первая запись
с id = 1, запись из shop.users WHERE id = 1 останется в таблице, т.к. при 
вставлении ее в таблицу она попадает в конец таблицы. 
Если id в таблице определен как INT UNSIGNED AUTO_INCREMENT PRIMARY KEY - то сначала 
удаляем запись DELETE FROM sample.users WHERE id = 1, затем выполняем запрос
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1
*/
COMMIT;

/* Первоночально сделал транзакцию такого вида. Но по заданию ( :) ) надо перенести
  запись полностью, а не только одно значение ( name - в моем случае)
 

START TRANSACTION;

USE shop;

SELECT @tmp_name := name FROM users WHERE id = 1;

USE sample;

UPDATE users SET name = @tmp_name WHERE id = 1;

COMMIT;
*/
