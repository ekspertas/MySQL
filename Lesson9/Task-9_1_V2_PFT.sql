/* Практическое задание 9.
 * Практическое задание по теме “Хранимые процедуры и функции, триггеры" */

/* Задание # 1.
 	 	Создайте хранимую функцию hello(), которая будет возвращать приветствие,
 	 	в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна 
 	 	возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать
 	 	фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — 
 	 	"Доброй ночи".
*/

/* Используюя оператор CASE, функция выглядит гораздо лаконичнее
   и выполняется в 1,7 раза быстрее 
 */

DROP FUNCTION IF EXISTS func_hello;

DELIMITER //

CREATE FUNCTION func_hello()
RETURNS char(20) READS SQL DATA  
BEGIN
	DECLARE cur_time MEDIUMINT UNSIGNED DEFAULT (CURTIME() + 0);
	CASE
		WHEN (cur_time > 120000 AND cur_time <= 180000) THEN
			RETURN "Добрый день";
		WHEN cur_time >= 000000 AND cur_time <= 60000 THEN
			RETURN "Доброй ночи";
		WHEN cur_time > 60000 AND cur_time <= 120000 THEN
			RETURN "Доброе утро";
		ELSE 
			RETURN "Добрый вечер";
	END CASE;
END //

DELIMITER ;

SELECT func_hello();