/* Практическое задание 6.*/

/* Задание # 1.
 	Пусть задан некоторый пользователь.
	Найдите человека, который больше всех общался с нашим 
	пользователем, иначе, кто написал пользователю наибольшее число сообщений.
 	(можете взять пользователя с любым id).
*/

SELECT last_name AS 'Best frend'
FROM users
WHERE id = (SELECT COUNT(*) AS messages_count		-- считаем кол-во сообщений 
			FROM messages							-- таблица данных	
			WHERE to_user_id = 3					-- id для кого считаем
			GROUP BY from_user_id					-- групперуем по полю "от кого"	
			ORDER BY messages_count DESC LIMIT 1);	-- сортируем в обратном порядке,
													-- и выбираем первую запись
