USE vk;


SHOW tables;

SELECT id, first_name, last_name from users where id = (SELECT user_id from profiles order by birthday DESC limit 1);







SELECT COUNT(*) FROM likes l WHERE target_type_id = (

    SELECT id FROM target_types WHERE name = 'users'
    
    ) 

AND 

user_id IN (

SELECT user_id from profiles order by birthday desc limit 10

     );



    
    
    
    
SELECT target_id AS mediafile, COUNT(*) AS likes 
  FROM likes 
    WHERE target_id IN (
      SELECT id FROM media WHERE user_id = 55
        UNION
      (SELECT id FROM media WHERE user_id IN (
        SELECT friend_id 
          FROM friendship WHERE user_id = 55 AND status_id = (
                SELECT id FROM friendship_statuses WHERE name = 'Confirmed'
              )))
        UNION
      (SELECT id FROM media WHERE user_id IN (
        SELECT user_id 
          FROM friendship WHERE friend_id = 55 AND status_id = (
                SELECT id FROM friendship_statuses WHERE name = 'Confirmed'
              ))) 
    )
    AND target_type_id = (SELECT id FROM target_types WHERE name = 'media')
    GROUP BY target_id;
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    




SELECT user_id, birthday from profiles order by birthday DESC limit 10;




-- CREATE VIEW number_of_likes AS 

SELECT SUM(like_number) FROM

(SELECT
  (SELECT COUNT(*) 
    FROM likes l WHERE l.target_id = p.user_id AND target_type_id = (SELECT id FROM target_types WHERE name = 'users')
       ) as like_number, 
       birthday
        
FROM profiles p 
ORDER BY birthday DESC
LIMIT 10) AS number_of_likes
;

SELECT SUM(like_number) from number_of_likes;




SELECT user_id, SUM(size) AS total
  FROM media
  GROUP BY user_id
  HAVING total > 100000000
  ORDER BY total DESC;

SELECT * from media;


SELECT * from likes where target_type_id = 2;
   
SELECT * from target_types limit 5;




SELECT id from profiles order by birthday DESC limit 1;

DESC profiles;

SELECT id, first_name, last_name from users;

SELECT first_name, last_name, 

 (SELECT city FROM profiles WHERE user_id = 8) AS city 
 (SELECT file_path FROM media WHERE id = 
   (SELECT photo_id FROM profiles WHERE user_id = 8)) AS main_photo,

FROM users WHERE ; 











SELECT 
    (SELECT CONCAT(first_name, ' ', last_name) 
      FROM users 
      WHERE id = user_id) AS friend,            -- имя пользователя
    CASE (gender)                       
      WHEN 'm' THEN 'man'
      WHEN 'f' THEN 'women'
    END AS sex,                                  -- пол
    TIMESTAMPDIFF(YEAR, birthday, NOW()) AS age -- возраст
  FROM profiles
  WHERE user_id IN (
    SELECT friend_id FROM friendship
      WHERE user_id = 5 
        AND confirmed_at IS NOT NULL
        AND status_id IN (
          SELECT id FROM friendship_statuses WHERE name = 'Confirmed'
          )
      UNION
      SELECT user_id 
      FROM friendship
      WHERE friend_id = 5
        AND confirmed_at IS NOT NULL
        AND status_id IN (
          SELECT id FROM friendship_statuses WHERE name = 'Confirmed'
          )
  );




SELECT * FROM likes;

SELECT * FROM profiles;










SELECT gender, SUM(SELECT COUNT(*) 
    FROM likes l 
    
     WHERE 
    
       l.user_id = p.user_id 
        
    ) AS like_number

FROM profiles p
GROUP BY gender;


SELECT COUNT(*) FROM likes l WHERE l.user_id = 8; 

DESC profiles;
DESC likes;

SELECT * from likes limit 5;


SELECT IF(

(SELECT gender, SUM(SELECT COUNT(*) FROM likes l WHERE l.user_id = p.user_id) FROM profiles p GROUP BY gender HAVING gender = 'm') > 
(SELECT gender, SUM(SELECT COUNT(*) FROM likes l WHERE l.user_id = p.user_id) FROM profiles p GROUP BY gender HAVING  gender = 'f'), 

'Больше мужчин', 'Больше женщин');

SELECT gender FROM profiles p ;

SELECT 3+5;




SELECT gender, SUM(per_user) AS total 
  FROM 
  
       (SELECT gender, 
       
           (SELECT COUNT(*) 
            FROM likes l 
            WHERE l.user_id = p.user_id) AS per_user 
   
        FROM profiles p) AS counted_likes
 
GROUP BY gender
ORDER BY total DESC;






-- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

show tables;


SELECT * from messages;
-- from_user_id


SELECT * from posts;
-- user_id








SELECT ANY_VALUE(user_id), MAX(number_of_posts+number_of_messages) AS activity

FROM

(

SELECT user_id, COUNT(*) AS number_of_posts, 

(SELECT COUNT(*) FROM messages m WHERE m.from_user_id = pos.user_id) AS number_of_messages

FROM posts pos GROUP BY user_id

) AS number_of_mp

;












SELECT (SELECT CONCAT(first_name, ' ', last_name) FROM users u WHERE u.id = number_of_mp.user_id) AS user_name, 

user_id, number_of_posts+number_of_messages AS activity

FROM

(

SELECT user_id, COUNT(*) AS number_of_posts, 

(SELECT COUNT(*) FROM messages m WHERE m.from_user_id = pos.user_id) AS number_of_messages

FROM posts pos GROUP BY user_id

) AS number_of_mp

ORDER BY activity LIMIT 10
;
















SELECT
    (SELECT CONCAT(first_name, ' ', last_name) FROM users where id = profiles.user_id) AS users,
    (SELECT COUNT(*) from likes where user_id = profiles.user_id) AS likes,
    birthday
    FROM profiles
    ORDER BY birthday DESC limit 10;

   
   
SELECT SUM(like_number) FROM

	(SELECT
	    (SELECT COUNT(*) 
	    FROM likes l WHERE l.target_id = p.user_id AND target_type_id = (SELECT id FROM target_types WHERE name = 'users')
	    ) as like_number, 
	    birthday
	        
	FROM profiles p 
	ORDER BY birthday DESC
	LIMIT 10) AS number_of_likes
;












SELECT CASE

 WHEN

(
	(SELECT SUM(per_user) AS total 
		  FROM 
		  
		       (SELECT gender, 
		       
		           (SELECT COUNT(*) 
		            FROM likes l 
		            WHERE l.user_id = p.user_id) AS per_user 
		   
		        FROM profiles p) AS counted_likes
		 
		GROUP BY gender HAVING gender = 'm')
		
		> 
		
		(SELECT SUM(per_user) AS total 
		  FROM 
		  
		       (SELECT gender, 
		       
		           (SELECT COUNT(*) 
		            FROM likes l 
		            WHERE l.user_id = p.user_id) AS per_user 
		   
		        FROM profiles p) AS counted_likes
		 
		GROUP BY gender HAVING gender = 'f') 
 
)
		
 THEN 'Больше мужчин'

 WHEN

 (
		(SELECT SUM(per_user) AS total 
		  FROM 
		  
		       (SELECT gender, 
		       
		           (SELECT COUNT(*) 
		            FROM likes l 
		            WHERE l.user_id = p.user_id) AS per_user 
		   
		        FROM profiles p) AS counted_likes
		 
		GROUP BY gender HAVING gender = 'm')
		
		< 
		
		(SELECT SUM(per_user) AS total 
		  FROM 
		  
		       (SELECT gender, 
		       
		           (SELECT COUNT(*) 
		            FROM likes l 
		            WHERE l.user_id = p.user_id) AS per_user 
		   
		        FROM profiles p) AS counted_likes
		 
		GROUP BY gender HAVING gender = 'f') 

)
		
 THEN 'Больше женщин'

 ELSE 'Одинаково!'

END


SELECT gender, SUM(per_user) AS total 
  FROM (SELECT gender, (SELECT COUNT(*) 
    FROM likes l 
    WHERE l.user_id = p.user_id) AS per_user 
    FROM profiles p) AS counted_likes
  GROUP BY gender
  ORDER BY total DESC
  LIMIT 1
  ;



 
 
 
 
 
 
 
 
 
 
 
 
 
 
 SELECT CASE

 WHEN

(SELECT total FROM

(SELECT gender, SUM(per_user) AS total 
  FROM 
  
       (SELECT gender, 
       
           (SELECT COUNT(*) 
            FROM likes l 
            WHERE l.user_id = p.user_id) AS per_user 
   
        FROM profiles p) AS counted_likes
 
GROUP BY gender) AS total_likes

WHERE gender = 'm')

> 

(SELECT total FROM

(SELECT gender, SUM(per_user) AS total 
  FROM 
  
       (SELECT gender, 
       
           (SELECT COUNT(*) 
            FROM likes l 
            WHERE l.user_id = p.user_id) AS per_user 
   
        FROM profiles p) AS counted_likes
 
GROUP BY gender) AS total_likes

WHERE gender = 'f') THEN 'Больше мужчин'

 WHEN

(SELECT total FROM

(SELECT gender, SUM(per_user) AS total 
  FROM 
  
       (SELECT gender, 
       
           (SELECT COUNT(*) 
            FROM likes l 
            WHERE l.user_id = p.user_id) AS per_user 
   
        FROM profiles p) AS counted_likes
 
GROUP BY gender) AS total_likes

WHERE gender = 'm')

< 

(SELECT total FROM

(SELECT gender, SUM(per_user) AS total 
  FROM 
  
       (SELECT gender, 
       
           (SELECT COUNT(*) 
            FROM likes l 
            WHERE l.user_id = p.user_id) AS per_user 
   
        FROM profiles p) AS counted_likes
 
GROUP BY gender) AS total_likes

WHERE gender = 'f') THEN 'Больше женщин'

ELSE 'Поровну!'

END
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 





SELECT user_id, SUM(size) AS total
  FROM media
  GROUP BY user_id
  HAVING total > 100000000
  ORDER BY total DESC;







SELECT created_at , COUNT(*) -- (SELECT gender FROM profiles p, WHERE p.user_id = l.user_id)

    FROM likes l 
         
     GROUP BY user_id; 
    
 GROUP BY gender;




SELECT (COUNT(id)) as like_number, (SELECT gender FROM profiles p WHERE p.user_id = l.user_id) as gender

   FROM likes l

GROUP BY user_id;





SELECT user_id, SUM(size) AS total
  FROM media
  GROUP BY user_id
  HAVING total > 100000000
  ORDER BY total DESC;














-- Получаем данные пользователя
SELECT * FROM users WHERE id = 8;

SELECT first_name, last_name, 'main_photo', 'city' FROM users WHERE id = 8;

SELECT
  first_name,
  last_name,
  (SELECT file_path FROM media WHERE id = 
    (SELECT photo_id FROM profiles WHERE user_id = 8)
  ) AS file_path,
  (SELECT city FROM profiles WHERE user_id = 8) AS city
  FROM users
    WHERE id = 8;  

-- Дорабатывем условия    
SELECT
  first_name,
  last_name,
  (SELECT file_path FROM media WHERE id = 
    (SELECT photo_id FROM profiles WHERE user_id = users.id)
  ) AS file_path,
  (SELECT city FROM profiles WHERE user_id = users.id) AS city
  FROM users
    WHERE id = 8;          

-- Получаем фотографии пользователя
SELECT file_path FROM media
  WHERE user_id = 8
    AND media_type_id = (
      SELECT id FROM media_types WHERE name = 'photo'
    );
    
SELECT * FROM media_types;

-- Выбираем историю по добавлению фотографий пользователем
SELECT CONCAT(
  'Пользователь добавил фото ', 
  file_path, 
  ' ', 
  created_at) AS news 
    FROM media 
    WHERE user_id = 8 AND media_type_id = (
        SELECT id FROM media_types WHERE name LIKE 'photo'
);

-- Улучшаем запрос
SELECT CONCAT(
  'Пользователь ', 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = media.user_id),
  ' добавил фото ', 
  file_path, ' ', 
  created_at) AS news 
    FROM media 
    WHERE user_id = 8 AND media_type_id = (
        SELECT id FROM media_types WHERE name LIKE 'photo'
);

-- Найдём кому принадлежат 10 самых больших медиафайлов
SELECT user_id, file_path, size 
  FROM media 
  ORDER BY size DESC
  LIMIT 10;

-- Улучшим запрос, используем алиасы для имён таблиц
SELECT 
  (SELECT CONCAT(first_name, ' ', last_name) 
    FROM users u WHERE u.id = m.user_id) AS owner,
  file_path, 
  size 
    FROM media m
    ORDER BY size DESC
    LIMIT 10;
  
 -- Выбираем друзей пользователя с двух сторон отношения дружбы
(SELECT friend_id FROM friendship WHERE user_id = 8)
UNION
(SELECT user_id FROM friendship WHERE friend_id = 8);

SELECT * from friendship limit 5;

-- Выбираем только друзей с активным статусом
SELECT * FROM friendship_statuses;

(SELECT friend_id 
  FROM friendship 
  WHERE user_id = 8 AND status_id = (
      SELECT id FROM friendship_statuses WHERE name = 'Confirmed'
    )
)
UNION
(SELECT user_id 
  FROM friendship 
  WHERE friend_id = 8 AND status_id = (
      SELECT id FROM friendship_statuses WHERE name = 'Confirmed'
    )
);


-- Выбираем медиафайлы друзей
SELECT file_path FROM media WHERE user_id IN (
  (SELECT friend_id 
  FROM friendship 
  WHERE user_id = 8 AND status_id = (
      SELECT id FROM friendship_statuses WHERE name = 'Confirmed'
    )
  )
  UNION
  (SELECT user_id 
    FROM friendship 
    WHERE friend_id = 8 AND status_id = (
      SELECT id FROM friendship_statuses WHERE name = 'Confirmed'
    )
  )
);

-- Объединяем медиафайлы пользователя и его друзей для создания ленты новостей
SELECT file_path, user_id, created_at FROM media WHERE user_id = 8
UNION
SELECT file_path, user_id, created_at FROM media WHERE user_id IN (
  (SELECT friend_id 
  FROM friendship 
    WHERE user_id = 8 AND status_id = (
      SELECT id FROM friendship_statuses WHERE name = 'Confirmed'
    )
  )
  UNION
  (SELECT user_id 
    FROM friendship 
    WHERE friend_id = 8 AND status_id = (
      SELECT id FROM friendship_statuses WHERE name = 'Confirmed'
    )
  )
);

-- Определяем пользователей, общее занимаемое место медиафайлов которых 
-- превышает 100МБ
SELECT user_id, SUM(size) AS total
  FROM media
  GROUP BY user_id
  HAVING total > 100000000
  ORDER BY total DESC;

-- Подсчитываем лайки для медиафайлов пользователя и его друзей
SELECT target_id AS mediafile, COUNT(*) AS likes 
  FROM likes 
    WHERE target_id IN (
      SELECT id FROM media WHERE user_id = 55
        UNION
      (SELECT id FROM media WHERE user_id IN (
        SELECT friend_id 
          FROM friendship WHERE user_id = 55 AND status_id = (
                SELECT id FROM friendship_statuses WHERE name = 'Confirmed'
              )))
        UNION
      (SELECT id FROM media WHERE user_id IN (
        SELECT user_id 
          FROM friendship WHERE friend_id = 55 AND status_id = (
                SELECT id FROM friendship_statuses WHERE name = 'Confirmed'
              ))) 
    )
    AND target_type_id = (SELECT id FROM target_types WHERE name = 'media')
    GROUP BY target_id;
   
   SELECT * from media;


-- Начинаем создавать архив новостей для медиафайлов по месяцам
SELECT COUNT(id) AS arhive, MONTHNAME(created_at) AS month 
  FROM media
  GROUP BY month;
  
-- Архив с правильной сортировкой новостей по месяцам
SELECT COUNT(id) AS news, 
  MONTHNAME(created_at) AS month,
  MONTH(created_at) AS month_num 
    FROM media
      WHERE YEAR(created_at) = YEAR(NOW())
    GROUP BY month_num, month
    ORDER BY month_num DESC;

SELECT COUNT(id) AS news, 
  MONTHNAME(created_at) AS month,
  MONTH(created_at) AS month_num 
    FROM media
    GROUP BY month_num, month
    ORDER BY month_num DESC;   
    

-- Выбираем сообщения от пользователя и к пользователю
SELECT from_user_id, to_user_id, body, is_delivered, created_at 
  FROM messages
    WHERE from_user_id = 8 OR to_user_id = 8
    ORDER BY created_at DESC;
    
-- Сообщения со статусом
SELECT from_user_id, 
  to_user_id, 
  body, 
  IF(is_delivered, 'delivered', 'not delivered') AS status 
    FROM messages
      WHERE (from_user_id = 8 OR to_user_id = 8)
    ORDER BY created_at DESC;
    
 -- Выводим друзей пользователя с преобразованием пола и возраста 
SELECT 
    (SELECT CONCAT(first_name, ' ', last_name) 
      FROM users 
      WHERE id = user_id) AS friend,            -- имя пользователя
    CASE (gender)                       
      WHEN 'm' THEN 'man'
      WHEN 'f' THEN 'women'
    END AS sex,                                  -- пол
    TIMESTAMPDIFF(YEAR, birthday, NOW()) AS age -- возраст
  FROM profiles
  WHERE user_id IN (
    SELECT friend_id FROM friendship
      WHERE user_id = 5 
        AND confirmed_at IS NOT NULL
        AND status_id IN (
          SELECT id FROM friendship_statuses WHERE name = 'Confirmed'
          )
      UNION
      SELECT user_id 
      FROM friendship
      WHERE friend_id = 5
        AND confirmed_at IS NOT NULL
        AND status_id IN (
          SELECT id FROM friendship_statuses WHERE name = 'Confirmed'
          )
  );
    
-- Поиск пользователя по шаблонам имени  
SELECT CONCAT(first_name, ' ', last_name) AS fullname  
  FROM users
  WHERE first_name LIKE 'M%';
  
-- Используем регулярные выражения
SELECT CONCAT(first_name, ' ', last_name) AS fullname  
  FROM users
  WHERE last_name RLIKE '^S.*t$';
  
  
  