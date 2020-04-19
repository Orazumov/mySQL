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


USE shop;

SELECT * FROM users;

SELECT * FROM orders;



SELECT id, name from users u WHERE EXISTS (SELECT product_id from orders o where o.user_id = u.id);



SELECT
  p.name,
  p.price,
  c.name
FROM
  catalogs c
JOIN
  products p
WHERE
  c.id = p.catalog_id;


SELECT * FROM products p ;
SELECT * FROM catalogs c ;

2	ruchka	{"info": "good pen!"}	50.00	25
3	karandash	{"info": "good pencil"}	55.00	26
4	Python textbook	{"info": "good book"}	555.00	260
1	Pjlesos	{"info": "good pjlesos"}	5555.00	555

 INSERT INTO catalogs (id, name) VALUES

(25, 'Письменные принадлежности'),
(260, 'Учебники'),
(555, 'Бытовая техника');

SELECT user_id, product_id from orders;



-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля 
-- from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.


SELECT 
id,
(SELECT name from cities c WHERE f.from_ = c.label) as from_,
(SELECT name from cities c WHERE f.to_ = c.label) as to_

FROM 
flights f
;

SELECT * FROM cities;

SELECT * FROM flights;
1	Москва	Омск
2	Новгород	Казань
3	Иркутск	Москва
4	Омск	Иркутск
5	Москва	Казань












SELECT 
  (SELECT CONCAT(first_name, ' ', last_name) 
    FROM users u WHERE u.id = m.user_id) AS owner,
  file_path, 
  size 
    FROM media m
    ORDER BY size DESC
    LIMIT 10;
  









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

 --  Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
   
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

-- переписать с помощью JOIN:

SELECT * from profiles WHERE user_id = 99;
SELECT * from likes WHERE target_id = 15;



SELECT SUM(likes_number) FROM (
SELECT p.user_id, p.birthday, COUNT(l.target_id) as likes_number 
FROM profiles p 
	 JOIN likes l 
	 ON p.user_id = l.target_id AND l.target_type_id = 2

GROUP BY l.target_id
ORDER BY p.birthday DESC
LIMIT 10
) as number_of_likes 
;


SHOW tables;

SELECT * from target_types tt ;




SELECT SUM(likes_number) FROM (
SELECT p.birthday, COUNT(l.target_id) as likes_number, l.target_type_id 
FROM likes l
	 LEFT JOIN profiles p 
	 ON p.user_id = l.target_id AND l.target_type_id = 2

GROUP BY l.target_id

ORDER BY p.birthday DESC
LIMIT 10
) as number_of_likes 
;

--  

SELECT *
FROM likes l
	 JOIN profiles p 
	 ON p.user_id = l.target_id AND l.target_type_id = 2


ORDER BY p.birthday DESC
LIMIT 10
;
-- 

SELECT SUM(likes_number) FROM (
SELECT  l.target_id 
FROM likes l
	 LEFT JOIN profiles p 
	 ON p.user_id = l.target_id AND l.target_type_id = 2

 GROUP BY l.target_id

ORDER BY p.birthday DESC
LIMIT 10
) as number_of_likes 
;

--

SELECT  l.target_id
FROM profiles p 
   LEFT JOIN likes l
   ON p.user_id = l.target_id AND l.target_type_id = 2

   GROUP BY p.user_id

ORDER BY p.birthday DESC
LIMIT 10
;

--

sql_mode=only_full_group_by




SELECT SUM(likes_number) FROM (

SELECT  COUNT(l.target_id) as likes_number
FROM profiles p 
	 LEFT JOIN likes l
	 ON p.user_id = l.target_id AND l.target_type_id = 2

  GROUP BY p.user_id

ORDER BY p.birthday DESC
LIMIT 10
) as number_of_likes 
;



-- -------------------------------

SELECT users.id, first_name, last_name, COUNT(requested_at) AS total_friends
  FROM users
    LEFT JOIN friendship
      ON users.id = friendship.user_id
        OR users.id = friendship.friend_id
  GROUP BY users.id
  ORDER BY total_friends DESC
  LIMIT 10;


-- через JOIN:

99	2017-09-05	1
78	2016-05-11	1
12	2016-03-10	1
59	2014-03-19	1
95	2014-01-30	1
30	2013-04-18	1
14	2011-08-04	1
36	2010-10-19	1
11	2009-04-06	1
32	2007-10-07	1

-- через вложенный запрос:

99	1	2017-09-05
15	0	2017-06-26
78	1	2016-05-11
12	1	2016-03-10
8	0	2015-04-01
64	0	2015-01-18
56	0	2014-07-28
59	1	2014-03-19
95	1	2014-01-30
51	0	2013-10-19

SELECT * from likes WHERE target_id = 78;



SELECT SUM(like_number) FROM

	(SELECT p.user_id, 
	    (SELECT COUNT(*) 
	    FROM likes l WHERE l.target_id = p.user_id AND target_type_id = (SELECT id FROM target_types WHERE name = 'users')
	    ) as like_number, 
	    birthday
	        
	FROM profiles p 
	ORDER BY birthday DESC
	LIMIT 10) AS number_of_likes
;



-- Кто больше поставил лайков: мужчины или женщины?

   SELECT
	 (SELECT gender FROM profiles WHERE user_id = likes.user_id) AS gender,
	 COUNT(*) AS total
   FROM likes
   GROUP BY gender
   ORDER BY total DESC
   LIMIT 2;  

-- переписать через JOIN:

   SELECT p.gender, COUNT(*) as total 
   FROM likes l
   JOIN profiles p
   	 ON p.user_id = l.user_id
   GROUP BY gender
   ORDER BY total DESC
   LIMIT 2;  

 -- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

SELECT 
  CONCAT(first_name, ' ', last_name) AS user, 
	(SELECT COUNT(*) FROM likes WHERE likes.user_id = users.id) + 
	(SELECT COUNT(*) FROM media WHERE media.user_id = users.id) + 
	(SELECT COUNT(*) FROM messages WHERE messages.from_user_id = users.id) AS overall_activity 
	  FROM users
	  ORDER BY overall_activity
	  LIMIT 10;
	 
-- Blanche Hintz	0
-- Roderick Runolfsson	0
-- Freda Reinger	0
-- Lelah Haag	0
-- Rhiannon O'Kon	0
-- Lonny Schmeler	0
-- Gilda Mayer	0
-- Ike Glover	1
-- Dino Schneider	1
-- Sherman Toy	1
	 
	 
	 
	 
-- перепишем через JOIN:


	 
SELECT   
  CONCAT(first_name, ' ', last_name) AS user, (COUNT(DISTINCT l.user_id) + COUNT(DISTINCT med.user_id) + COUNT(DISTINCT mes.from_user_id)) as activity 
	  FROM users u
	  LEFT JOIN likes l
	  	ON l.user_id = u.id
	  LEFT JOIN media med
	    ON med.user_id = u.id
	  LEFT JOIN messages mes
	    ON mes.from_user_id = u.id
	  GROUP BY u.id 
	  ORDER BY activity
	  LIMIT 10;
	  
	  
	 --  
	 
	 
	SELECT   
  CONCAT(first_name, ' ', last_name) AS user, (DISTINCT (COUNT(l.user_id) + COUNT( med.user_id) + COUNT( mes.from_user_id))) as activity 
	  FROM users u
	  LEFT JOIN likes l
	  	ON l.user_id = u.id
	  LEFT JOIN media med
	    ON med.user_id = u.id
	  LEFT JOIN messages mes
	    ON mes.from_user_id = u.id
	  GROUP BY u.id 
	  ORDER BY activity
	  LIMIT 10;
	 
	 
	 
	 
	 USE vk;
	 
SELECT CONCAT(u.first_name," ",u.last_name) AS user, 
  p.user_id AS posts, 
    m.from_user_id AS messages, 
    media.user_id AS media, 
    l.user_id AS likes,
    (IFNULL(p.user_id,0) + IFNULL(m.from_user_id,0) + IFNULL(media.user_id,0) + IFNULL(l.user_id,0)) AS user activity 
  
    FROM users AS u
    LEFT JOIN posts AS p
    ON p.user_id = u.id
    LEFT JOIN messages AS m
    ON m.from_user_id = u.id
    LEFT JOIN media AS media
    ON media.user_id = u.id
    LEFT JOIN likes AS l
    ON l.user_id = u.id
    GROUP BY u.id
    ORDER BY user activity ASC
    limit 100;
    
    --
	 
	 
	  SELECT * from likes ;

	  SELECT * from media ;

	 
	 
   
   
	 
	 
	 
	 
	 
	 -- 
	 

SELECT 
  CONCAT(first_name, ' ', last_name) AS user, 
	(SELECT COUNT(likes.user_id) FROM likes WHERE likes.user_id = users.id) + 
	(SELECT COUNT(media.user_id) FROM media WHERE media.user_id = users.id) + 
	(SELECT COUNT(messages.from_user_id) FROM messages WHERE messages.from_user_id = users.id) AS overall_activity 
	  FROM users
	  ORDER BY overall_activity
	  LIMIT 10;
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
   --
   
   
   
SELECT users.name, COUNT(orders.user_id) AS total_orders
  FROM users
    JOIN orders
  ON users.id = orders.user_id
  GROUP BY orders.user_id
  ORDER BY total_orders;
 
 












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
  
  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 USE shop;


CREATE VIEW names AS
SELECT products.name AS product_name, catalogs.name AS catalog_name 
FROM products
JOIN catalogs
ON catalogs.id = products.catalog_id ;

SELECT * FROM names;

SELECT * from catalogs c2 ;
  
1	Процессоры
2	Мат. платы
3	Видеокарты
4	Письменные принадлежности
5	Учебники
6	Бытовая техника
25	Письменные принадлежности
260	Учебники
555	Бытовая техника

SELECT * from products p2 ;
