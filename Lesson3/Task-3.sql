/* Практическое задание к уроку 3. */

-- Таблица "Посты". Колонки: "автор поста", "ссылка на медиа файл", "текст поста", "дата создания".
USE vk;

CREATE TABLE information_block (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, -- id поста   
  txt TEXT DEFAULT NULL, -- текста может и не быть, если есть медиа файл
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,  -- дата и время создания (добавил время, так логичнее)
  CONSTRAINT fk_inf_block_media FOREIGN KEY (id) REFERENCES media (id),  -- ссылка на медиа файл
  CONSTRAINT fk_inf_block_users FOREIGN KEY (id) REFERENCES users (id)   -- ссылка на автора поста
 );

/*Таблица "Лайки на посты". Колонки "пост", "автор лайка", "тип лайка (поставил или убрал)", "дата создания", "дата изменения". 
  Или! колонки "пост", "автор лайка".
 */

CREATE TABLE likes (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- id лайка
  who_user_id BIGINT UNSIGNED NOT NULL, -- id  кто поставил лайк
  like_status BOOLEAN DEFAULT False,  -- по умочанию лайк не стоит
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,  -- дата и время создания
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,  -- дата и время изменения 
  INDEX fk_likes_who_user_idx (who_user_id),  -- индекс для поиска, кто поставил лайк
  CONSTRAINT fk_likes_users_1 FOREIGN KEY (who_user_id) REFERENCES information_block (id),  -- ссылка на пост
  CONSTRAINT fk_likes_users_2 FOREIGN KEY (who_user_id) REFERENCES users (id)   -- ссылка на автора лайка
);

-- Таблица "Черный список". Колонки: "кто добавил в черный список", "кого добавили в черный список", "дата добавления".

CREATE TABLE black_list (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- id записи
  who_user_id BIGINT UNSIGNED NOT NULL, -- id  кто занес в список
  whom_user_id BIGINT UNSIGNED NOT NULL, -- id  кого занес в список
  append BOOLEAN DEFAULT False,  -- по умочанию не состоит в черном списке
  INDEX fk_black_list_who_user_idx (who_user_id),  -- индекс для поиска кто занес в список
  INDEX fk_black_list_whom_user_idx (whom_user_id),  -- индекс для поиска кого занес в список
  CONSTRAINT fk_black_list_users_1 FOREIGN KEY (who_user_id) REFERENCES users (id), -- ссылка на автора списка
  CONSTRAINT fk_black_list_users_2 FOREIGN KEY (whom_user_id) REFERENCES users (id) -- ссылка на пользователя в списке
);
