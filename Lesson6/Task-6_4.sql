/* Практическое задание 6.*/

/* Задание # 4.
 	 	Hайти из друзей пользователя, кто больше всего с ним общался.
*/

SELECT u.id, CONCAT(u.first_name, ' ', u.last_name) AS best_companion
FROM users u
	JOIN messages m
		ON (m.from_user_id = u.id OR m.to_user_id = u.id)
	JOIN friend_requests fr
		ON (fr.from_user_id = u.id OR fr.to_user_id = u.id)
WHERE m.is_delivered = 1 AND (m.from_user_id = 1 OR m.to_user_id = 1)
	AND fr.request_type = 1 AND (fr.from_user_id = 1 OR fr.to_user_id = 1)
	AND u.id != 1
GROUP BY u.id
ORDER  BY u.id LIMIT 1;