/* Практическое задание 6.*/

/* Задание # 3.
 	 	Определить, кто больше поставил лайков (всего) - мужчины или женщины?
*/

SELECT COUNT(*) AS 'Общее кол-во лайков' 
FROM posts_likes
WHERE user_id ;

SELECT COUNT(*) AS 'Общее кол-во лайков женщин'			
FROM posts_likes									
WHERE user_id IN (SELECT user_id  
FROM profiles
WHERE gender = 'f');

SELECT COUNT(*) AS 'Общее кол-во лайков мужчин'			
FROM posts_likes									
WHERE user_id IN (SELECT user_id  
FROM profiles
WHERE gender = 'm');

/*
 * Дальше не успел сделать ...
 * вернее не знаю как правильно сделать сравнение и 
 * вывод результата
SELECT user_id, 
		(SELECT COUNT(*)			
		FROM posts_likes									
		WHERE user_id IN (SELECT user_id  
		FROM profiles
		WHERE gender = 'm')) AS mans_likes,
		
		(SELECT COUNT(*)			
		FROM posts_likes									
		WHERE user_id IN (SELECT user_id  
		FROM profiles
		WHERE gender = 'f')) AS womans_likes
FROM posts_likes
GROUP BY user_id
ORDER BY user_id;


SELECT
       	IF (SELECT COUNT(*)		
			FROM posts_likes									
			WHERE user_id IN (SELECT user_id  
			FROM profiles
			WHERE gender = 'f')) < 
			(SELECT COUNT(*)		
			FROM posts_likes									
			WHERE user_id IN (SELECT user_id  
			FROM profiles
			WHERE gender = 'm') 
		THEN 
		SET grender = 'm';
		ELSE 
		SET grender = 'f';
	   	END IF;
FROM profiles;
*/


