## 1. ѕроанализировать какие запросы могут выполн€тьс€ наиболее часто в процессе работы приложени€ и добавить необходимые индексы.


## предположительно это будут частые запросы от пользователей: 

CREATE INDEX first_name_last_name_users_idx ON users (first_name, last_name);
-- поиск юзеров по имени и фамилии.

CREATE UNIQUE INDEX email_users_idx ON users(email);

CREATE UNIQUE INDEX phone_users_idx ON users(phone);

-- поиск юзеров по телефону или email

## автоматический поиск:

CREATE INDEX birthday_profiles_idx ON profiles(birthday);

-- поиск дл€ уведомлений о дн€х рождени€

CREATE INDEX media_user_id_media_type_id_created_at_idx ON media(user_id, media_type_id, created_at);

-- чтобы выводить категории медиа по дате дл€ показа пользователю (c определенным user_id).

CREATE INDEX from_user_id_created_at_messages_idx ON messages(from_user_id, created_at);

CREATE INDEX to_user_id_created_at_messages_idx ON messages(to_user_id, created_at);

-- поиск сообщений по отправителю и получателюупор€доченный по дате дл€ вывода.

CREATE INDEX comminuty_id_created_at_posts_idx ON posts(comminuty_id, created_at);

CREATE INDEX user_id_created_at_posts_idx ON posts(user_id, created_at);

-- поиск постов при открытии сообщества, упор€доченные по дате.
-- поиск постов определенного пользовател€, упор€доченные по дате.


## 2. «адание на оконные функции.
#ѕровести аналитику в разрезе групп.
#ѕостроить запрос, который будет выводить следующие столбцы:
#!!!! им€ группы
# --- среднее количество пользователей в группах
#самый молодой пользователь в группе
#самый пожилой пользователь в группе
# !!!! количество пользователей в группе
# !!!! всего пользователей в системе
# !!!! отношение в процентах (количество пользователей в группе / всего пользователей в системе) * 100


SELECT DISTINCT co.name,
   (SELECT COUNT(id) FROM users) AS total_users,
   COUNT(cu.user_id) OVER w AS number_of_users_in_community,
   COUNT(cu.user_id) OVER() / (SELECT COUNT(*) FROM communities c2) AS average_number,
   COUNT(cu.user_id) OVER w / (SELECT COUNT(id) FROM users) * 100 AS "%%",
   FIRST_VALUE(pr.user_id) OVER (PARTITION BY cu.community_id ORDER BY pr.birthday DESC) AS youngest_user_id,
   FIRST_VALUE(pr.user_id) OVER (PARTITION BY cu.community_id ORDER BY pr.birthday ASC)  AS oldest_user_id
   
  
    FROM users u
      LEFT JOIN profiles pr
        ON u.id = pr.user_id 
      LEFT JOIN communities_users cu 
        ON cu.user_id = pr.user_id 
      RIGHT JOIN communities co
        ON co.id = cu.community_id 
       WINDOW w AS (PARTITION BY cu.community_id)
       ;

      
    SELECT DISTINCT co.name,
   (SELECT COUNT(id) FROM users) AS total_users,
   COUNT(cu.user_id) OVER w AS number_of_users_in_community,
   COUNT(cu.user_id) OVER() / (SELECT COUNT(*) FROM communities c2) AS average_number,
   COUNT(cu.user_id) OVER w / (SELECT COUNT(id) FROM users) * 100 AS "%%",
   FIRST_VALUE(pr.user_id) OVER (PARTITION BY cu.community_id ORDER BY pr.birthday DESC) AS youngest_user_id,
   FIRST_VALUE(pr.user_id) OVER (PARTITION BY cu.community_id ORDER BY pr.birthday ASC)  AS oldest_user_id
   
  
    FROM users u
      LEFT JOIN profiles pr
        ON u.id = pr.user_id 
      LEFT JOIN communities_users cu 
        ON cu.user_id = pr.user_id 
      LEFT JOIN communities co
        ON co.id = cu.community_id 
       WINDOW w AS (PARTITION BY cu.community_id)
       ;









   COUNT(pr.user_id) OVER() / 
   (COUNT(co.name) OVER()) * COUNT(cu.user_id) OVER w 

SELECT DISTINCT co.name,
   AVG(YEAR(NOW()) - YEAR(pr.birthday)) OVER w AS average_age,
   COUNT(cu.user_id) OVER w AS number_of_users_in_community,
   COUNT(pr.user_id) OVER() AS total_users,
   COUNT(pr.user_id) OVER() / (SELECT COUNT(*) FROM communities c2) AS average_number,
   COUNT(cu.user_id) OVER() / COUNT(pr.user_id) OVER() * 100 AS "%%",
   FIRST_VALUE(pr.user_id) OVER (PARTITION BY cu.community_id ORDER BY pr.birthday DESC) AS youngest_user_id,
   FIRST_VALUE(pr.user_id) OVER (PARTITION BY cu.community_id ORDER BY pr.birthday ASC)  AS oldest_user_id
   
  
    FROM profiles pr
      LEFT JOIN communities_users cu 
        ON cu.user_id = pr.user_id 
      LEFT JOIN communities co
        ON co.id = cu.community_id 
       WINDOW w AS (PARTITION BY cu.community_id)
       ;
        
      ## !!!    (SELECT COUNT(id) FROM users) AS total_users,

      SELECT DISTINCT co.name,
   COUNT(u.id) OVER() AS total_users,
   COUNT(cu.user_id) OVER w AS number_of_users_in_community,
   COUNT(u.id) OVER() / (SELECT COUNT(*) FROM communities c2) AS average_number,
   COUNT(cu.user_id) OVER w / COUNT(u.id) OVER() * 100 AS "%%",
   FIRST_VALUE(pr.user_id) OVER (PARTITION BY cu.community_id ORDER BY pr.birthday DESC) AS youngest_user_id,
   FIRST_VALUE(pr.user_id) OVER (PARTITION BY cu.community_id ORDER BY pr.birthday ASC)  AS oldest_user_id
   
  
    FROM users u
      LEFT JOIN profiles pr
        ON u.id = pr.user_id 
      LEFT JOIN communities_users cu 
        ON cu.user_id = pr.user_id 
      LEFT JOIN communities co
        ON co.id = cu.community_id 
       WINDOW w AS (PARTITION BY cu.community_id)
       ;
      
      
      
         SELECT DISTINCT co.name,
   (SELECT COUNT(id) FROM users) AS total_users,
   COUNT(cu.user_id) OVER w AS number_of_users_in_community,
   (SELECT COUNT(id) FROM users) / (SELECT COUNT(*) FROM communities c2) AS average_number,
   COUNT(cu.user_id) OVER w / (SELECT COUNT(id) FROM users) * 100 AS "%%",
   FIRST_VALUE(pr.user_id) OVER (PARTITION BY cu.community_id ORDER BY pr.birthday DESC) AS youngest_user_id,
   FIRST_VALUE(pr.user_id) OVER (PARTITION BY cu.community_id ORDER BY pr.birthday ASC)  AS oldest_user_id
   
  
    FROM users u
      LEFT JOIN profiles pr
        ON u.id = pr.user_id 
      LEFT JOIN communities_users cu 
        ON cu.user_id = pr.user_id 
      LEFT JOIN communities co
        ON co.id = cu.community_id 
       WINDOW w AS (PARTITION BY cu.community_id)
       ;
      
      
        SELECT DISTINCT COUNT(cu.user_id) OVER() 
    FROM users u
      LEFT JOIN profiles pr
        ON u.id = pr.user_id 
      LEFT JOIN communities_users cu 
        ON cu.user_id = pr.user_id 
      LEFT JOIN communities co
        ON co.id = cu.community_id 
       WINDOW w AS (PARTITION BY cu.community_id)
       ;
      
      
      
--      ---------------------------------------------------

      
      
      
      
  SELECT * FROM communities_users;    
      
      INSERT INTO communities_users (community_id, user_id) VALUES
      (1, 65),
      (2, 4),
      (3, 5)
      ;
     
       SELECT * FROM communities;    

     
      INSERT INTO communities (id, name) VALUES
      (21, 'super')
      ;
     
     DELETE FROM communities_users 
     WHERE community_id = 1 AND user_id = 1;
     DELETE FROM communities_users 
     WHERE community_id = 2 AND user_id = 2;
     DELETE FROM communities_users 
     WHERE community_id = 3 AND user_id = 3;
   
    
    
     SELECT COUNT(*) FROM users;
     
     SELECT DISTINCT co.name,
   u.id,
   COUNT(u.id) OVER(),
   cu.user_id,
   COUNT(cu.user_id) OVER(),
   COUNT(u.id) OVER() / (SELECT COUNT(*) FROM communities c2) AS average_number,
   COUNT(cu.user_id) OVER w / COUNT(pr.user_id) OVER() * 100 AS "%%",
   FIRST_VALUE(pr.user_id) OVER (PARTITION BY cu.community_id ORDER BY pr.birthday DESC) AS youngest_user_id,
   FIRST_VALUE(pr.user_id) OVER (PARTITION BY cu.community_id ORDER BY pr.birthday ASC)  AS oldest_user_id
  
    FROM users u
      LEFT JOIN profiles pr
        ON u.id = pr.user_id 
      LEFT JOIN communities_users cu 
        ON cu.user_id = pr.user_id 
      LEFT JOIN communities co
        ON co.id = cu.community_id 
       WINDOW w AS (PARTITION BY cu.community_id)
       ;
     
     
        SELECT DISTINCT co.name,
   u.id,
   COUNT(u.id) OVER(),
   cu.user_id,
   COUNT(cu.user_id) OVER(),
   COUNT(u.id) OVER() / (SELECT COUNT(*) FROM communities c2) AS average_number,
   COUNT(cu.user_id) OVER w / COUNT(pr.user_id) OVER() * 100 AS "%%",
   FIRST_VALUE(pr.user_id) OVER (PARTITION BY cu.community_id ORDER BY pr.birthday DESC) AS youngest_user_id,
   FIRST_VALUE(pr.user_id) OVER (PARTITION BY cu.community_id ORDER BY pr.birthday ASC)  AS oldest_user_id
  
    FROM users u
      LEFT JOIN profiles pr
        ON u.id = pr.user_id 
       JOIN communities_users cu 
        ON cu.user_id = pr.user_id 
       JOIN communities co
        ON co.id = cu.community_id 
       WINDOW w AS (PARTITION BY cu.community_id)
       ;
     
      
      
     
     
     
          SELECT * FROM 
       communities_users cu 
       JOIN communities c
       ON c.id = cu.community_id
       JOIN profiles pr 
       ON pr.user_id = cu.user_id 
       WHERE c.name = 'suscipit'
       ;
      
      
           SELECT DISTINCT *
  
    FROM users u
      LEFT JOIN profiles pr
        ON u.id = pr.user_id 
      LEFT JOIN communities_users cu 
        ON cu.user_id = pr.user_id 
      LEFT JOIN communities co
        ON co.id = cu.community_id 
       WINDOW w AS (PARTITION BY cu.community_id)
       ;
      
      
      
     SELECT DISTINCT communities.name,
    AVG(communities_users.user_id) OVER w AS average,
    MAX(profiles.birthday) OVER w AS youngest_user,
    MIN(profiles.birthday) OVER w AS oldest_user,
    COUNT(communities_users.user_id) OVER w AS count_user,
    COUNT(*) OVER() AS all_users,
    SUM(communities_users.user_id) OVER w / SUM(users.id) OVER() * 100 AS "%%"
                FROM (communities
                     LEFT JOIN communities_users
                         ON communities.id = communities_users.community_id
                     LEFT JOIN users
                         ON communities_users.user_id = users.id
                     LEFT JOIN profiles
                         ON profiles.user_id = communities_users.user_id)
                         WINDOW w AS (PARTITION BY communities.id);
                        
                        
     
     SELECT DISTINCT communities.name,
    AVG(communities_users.user_id) OVER w AS average,
    MAX(profiles.birthday) OVER w AS youngest_user,
    MIN(profiles.birthday) OVER w AS oldest_user,
    COUNT(communities_users.user_id) OVER w AS count_user,
    COUNT(*) OVER() AS all_users,
    SUM(communities_users.user_id) OVER w / SUM(users.id) OVER() * 100 AS "%%"
                FROM (communities
                     LEFT JOIN communities_users
                         ON communities.id = communities_users.community_id
                     LEFT JOIN users
                         ON communities_users.user_id = users.id
                     LEFT JOIN profiles
                         ON profiles.user_id = communities_users.user_id)
                         WINDOW w AS (PARTITION BY communities.id);
                        
                        
     SELECT DISTINCT communities.name,
    AVG(communities_users.user_id) OVER w AS average,
    MAX(profiles.birthday) OVER w AS youngest_user,
    MIN(profiles.birthday) OVER w AS oldest_user,
    COUNT(communities_users.user_id) OVER w AS count_user,
    COUNT(*) OVER w AS all_users,
    SUM(communities_users.user_id) OVER w / SUM(users.id) OVER() * 100 AS "%%"
                FROM (communities
                     LEFT JOIN communities_users
                         ON communities.id = communities_users.community_id
                     LEFT JOIN users
                         ON communities_users.user_id = users.id
                     LEFT JOIN profiles
                         ON profiles.user_id = communities_users.user_id)
                         WINDOW w AS (PARTITION BY communities.id);
     
     
        SELECT *
                FROM (communities
                     LEFT JOIN communities_users
                         ON communities.id = communities_users.community_id
                     LEFT JOIN users
                         ON communities_users.user_id = users.id
                     LEFT JOIN profiles
                         ON profiles.user_id = communities_users.user_id)
                         WINDOW w AS (PARTITION BY communities.id);
     
     
     
     
     
       SELECT * FROM 
       communities_users cu 
       JOIN communities c
       ON c.id = cu.community_id 
       WHERE c.name = 'ipsa'
       ;
      
      SELECT * FROM 
       communities_users cu ;
 
      
      SELECT *  
   FROM profiles pr
      JOIN communities_users cu
        ON cu.user_id = pr.user_id 
      JOIN communities co
        ON co.id = cu.community_id 
       WINDOW w AS (PARTITION BY cu.community_id)
      ;
      
      SELECT DISTINCT media_types.name,
  AVG(media.size) OVER(PARTITION BY media.media_type_id) AS average,
  MIN(media.size) OVER(PARTITION BY media.media_type_id) AS min,
  MAX(media.size) OVER(PARTITION BY media.media_type_id) AS max,
  SUM(media.size) OVER(PARTITION BY media.media_type_id) AS total_by_type,
  SUM(media.size) OVER() AS total,
  SUM(media.size) OVER(PARTITION BY media.media_type_id) / SUM(media.size) OVER() * 100 AS "%%"
    FROM media
      JOIN media_types
        ON media.media_type_id = media_types.id;
        
       