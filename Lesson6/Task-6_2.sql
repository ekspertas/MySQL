/* Практическое задание 6.*/

/* Задание # 2.
 	 	Подсчитать общее количество лайков
 	    на посты, которые получили пользователи младше 18 лет.
*/

SELECT COUNT(*) AS 'Общее кол-во лайков'			-- общее кол-во лайков 
FROM posts_likes									-- таблица с лайками
WHERE user_id IN (SELECT user_id					-- определяем id кому считаем 
			FROM profiles							-- таблица с датой рождения	
			WHERE round (							-- округляем возраст	
			TIMESTAMPDIFF (YEAR, birthday, NOW()))	-- вычисляем возраст	
			< 18);									-- устанавлмваем ограничение возраста
