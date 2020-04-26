-- ���� ������. ���� 10. �������. ����������, ����������, �������������


-- �� � ����� 8

-- 1.���������� �������, ������� � �� ����� 6 � �������������� JOIN
--  (��� �������).

-- ���������� ����� ���������� ������, ������� �������� 10 ����� ������� �������������.

SELECT SUM(got_likes) AS total_likes_for_youngest
  FROM (   
    SELECT COUNT(DISTINCT likes.id) AS got_likes 
      FROM profiles
        LEFT JOIN likes
          ON likes.target_id = profiles.user_id
            AND target_type_id = 2
      GROUP BY profiles.user_id
      ORDER BY profiles.birthday DESC
      LIMIT 10
) AS youngest;

-- ���
SELECT count(*) 
  FROM likes
    JOIN target_types ON target_types.id = likes.target_type_id 
    JOIN (SELECT user_id FROM profiles ORDER BY birthday DESC limit 10) AS youngest 
      ON youngest.user_id = likes.target_id 
  WHERE target_types.name = 'users';

-- ���������� ��� ������ �������� ������ (�����) - ������� ��� �������?

SELECT profiles.gender, 
  COUNT(likes.id) AS total_likes
  FROM likes
    JOIN profiles
      ON likes.user_id = profiles.user_id
    GROUP BY profiles.gender
    ORDER BY total_likes DESC
    LIMIT 1;

-- ����� 10 �������������, ������� ��������� ���������� ���������� �
-- ������������� ���������� ����.

   USE vk;
   
SELECT users.id,
  COUNT(DISTINCT messages.id) + 
  COUNT(DISTINCT likes.id) + 
  COUNT(DISTINCT media.id) AS activity 
  FROM users
    LEFT JOIN messages 
      ON users.id = messages.from_user_id
    LEFT JOIN likes
      ON users.id = likes.user_id
    LEFT JOIN media
      ON users.id = media.user_id
  GROUP BY users.id
  ORDER BY activity
  LIMIT 10;
 
SELECT   
  u.id, COUNT(DISTINCT l.id) + COUNT(DISTINCT med.id) + COUNT(DISTINCT mes.id) as activity 
	  FROM users u
    LEFT JOIN messages mes
      ON u.id = mes.from_user_id
    LEFT JOIN likes l
      ON u.id = l.user_id
    LEFT JOIN media med
      ON u.id = med.user_id
	  GROUP BY u.id 
	  ORDER BY activity
	  LIMIT 10;

	 
	 SELECT users.id,
  COUNT(DISTINCT messages.id) + 
  COUNT(DISTINCT likes.id) + 
  COUNT(DISTINCT media.id) AS activity 
  FROM users
    LEFT JOIN messages 
      ON users.id = messages.from_user_id
    LEFT JOIN likes
      ON users.id = likes.user_id
    LEFT JOIN media
      ON users.id = media.user_id
  GROUP BY users.id
  ORDER BY activity
  LIMIT 10;
-- �� � ����� 10

-- 1.� ���� ������ shop � sample ������������ ���� � �� �� �������, ������� ���� ������.
-- ����������� ������ id = 1 �� ������� shop.users � ������� sample.users.
-- ����������� ����������.

SELECT * FROM shop.users;
SELECT * FROM sample.users;

START TRANSACTION;
  INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
  DELETE FROM shop.users WHERE id = 1;
COMMIT;

-- 2.�������� �������������, ������� ������� �������� name ��������
-- ������� �� ������� products � ��������������� �������� �������� name
-- �� ������� catalogs.

CREATE OR REPLACE VIEW products_catalogs AS
SELECT
  p.name AS product,
  c.name AS catalog
FROM
  products AS p
JOIN
  catalogs AS c
ON
  p.catalog_id = c.id;

-- 3.����� ������� ������� � ����������� ����� created_at.
-- � ��� ��������� ���������� ����������� ������ �� ������ 2018 ���� '2018-08-01', '2018-08-04', 
-- '2018-08-16' � 2018-08-17. ��������� ������, ������� ������� ������ ������ ��� �� ������, 
-- ��������� � �������� ���� �������� 1, ���� ���� ������������ � �������� ������� � 0, ���� ��� �����������.

CREATE TABLE IF NOT EXISTS posts (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  created_at DATE NOT NULL
);

INSERT INTO posts VALUES
(NULL, '������ ������', '2018-08-01'),
(NULL, '������ ������', '2018-08-04'),
(NULL, '������ ������', '2018-08-16'),
(NULL, '��������� ������', '2018-08-17');

CREATE TEMPORARY TABLE last_days (
  day INT
);

INSERT INTO last_days VALUES
(0), (1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
(11), (12), (13), (14), (15), (16), (17), (18), (19), (20),
(21), (22), (23), (24), (25), (26), (27), (28), (29), (30);

SELECT
  DATE(DATE('2018-08-31') - INTERVAL l.day DAY) AS day,
  NOT ISNULL(p.name) AS order_exist
FROM
  last_days AS l
LEFT JOIN
  posts AS p
ON
  DATE(DATE('2018-08-31') - INTERVAL l.day DAY) = p.created_at
ORDER BY
  day;

-- 4.����� ������� ����� ������� � ����������� ����� created_at. 
-- �������� ������, ������� ������� ���������� ������ �� �������, ��������
-- ������ 5 ����� ������ �������.

DROP TABLE IF EXISTS posts;
CREATE TABLE IF NOT EXISTS posts (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  created_at DATE NOT NULL
);

INSERT INTO posts VALUES
(NULL, '������ ������', '2018-11-01'),
(NULL, '������ ������', '2018-11-02'),
(NULL, '������ ������', '2018-11-03'),
(NULL, '��������� ������', '2018-11-04'),
(NULL, '����� ������', '2018-11-05'),
(NULL, '������ ������', '2018-11-06'),
(NULL, '������� ������', '2018-11-07'),
(NULL, '������� ������', '2018-11-08'),
(NULL, '������� ������', '2018-11-09'),
(NULL, '������� ������', '2018-11-10');

DELETE
  posts
FROM
  posts
JOIN
 (SELECT
    created_at
  FROM
    posts
  ORDER BY
    created_at DESC
  LIMIT 5, 1) AS delpst
ON
  posts.created_at <= delpst.created_at;

SELECT * FROM posts;


-- ������������ ������� �� ���� ������������������ MySQL�
-- (��� ���� ��������� �� ������ �������)

--1.�������� ���� ������������� ������� ����� ������ � ���� ������ shop.
-- ������� ������������ shop_read ������ ���� �������� ������ ������� �� ������ ������,
-- ������� ������������ shop � ����� �������� � �������� ���� ������ shop.

CREATE USER 'shop_read'@'localhost';
GRANT SELECT, SHOW VIEW ON shop.* TO 'shop_read'@'localhost' IDENTIFIED BY '';

SHOW DATABASES;
USE shop;
SHOW TABLES;
SELECT * FROM catalogs;
INSERT INTO catalogs (name) VALUES ('����������� ������');

CREATE USER 'shop'@'localhost';
GRANT ALL ON shop.* TO 'shop'@'localhost' IDENTIFIED BY '';


-- 2. (�� �������) ����� ������� ������� accounts ���������� ��� ������� id, name, password,
-- ���������� ��������� ����, ��� ������������ � ��� ������. �������� �������������
-- username ������� accounts, ��������������� ������ � �������� id � name. ��������
-- ������������ user_read, ������� �� �� ���� ������� � ������� accounts, ������, ��� ��
-- ��������� ������ �� ������������� username.

DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  password VARCHAR(255)
);

INSERT INTO accounts (name, password) VALUES
  ('��������', 'Qt3X08VetW'),
  ('�������', 'hvg0b057Br'),
  ('���������', 'a4YGUJjRLk'),
  ('������', 'YYug1IeyWl'),
  ('����', 'oKoo7KXvTE'),
  ('�����', 'w5r4yvfo9f');

CREATE VIEW username AS SELECT id, name FROM accounts;

SELECT * FROM username;

CREATE USER 'user_read'@'localhost';
GRANT SELECT (id, name) ON shop.username TO 'user_read'@'localhost';




-- ������������ ������� �� ���� ��������� ��������� � �������, ��������"

-- 1.�������� �������� ������� hello(), ������� ����� ���������� �����������,
-- � ����������� �� �������� ������� �����. � 6:00 �� 12:00 ������� ������
-- ���������� ����� "������ ����", � 12:00 �� 18:00 ������� ������ ����������
-- ����� "������ ����", � 18:00 �� 00:00 � "������ �����", � 00:00 �� 6:00 �
-- "������ ����".

USE vk;

DROP FUNCTION IF EXISTS hello;

DELIMITER -

CREATE FUNCTION hello ()
RETURNS TINYTEXT NO SQL
BEGIN
  DECLARE hour INT;
  SET hour = HOUR(NOW());
  CASE
    WHEN hour BETWEEN 0 AND 5 THEN
      RETURN "������ ����";
    WHEN hour BETWEEN 6 AND 11 THEN
      RETURN "������ ����";
    WHEN hour BETWEEN 12 AND 17 THEN
      RETURN "������ ����";
    WHEN hour BETWEEN 18 AND 23 THEN
      RETURN "������ �����";
  END CASE;
END-

DELIMITER ;
SELECT NOW(), hello ();


-- 2.� ������� products ���� ��� ��������� ����: name � ��������� ������ �
-- description � ��� ���������. ��������� ����������� ����� ����� ��� ������ �� ���.
-- ��������, ����� ��� ���� ��������� �������������� �������� NULL �����������. 
-- ��������� ��������, ��������� ����, ����� ���� �� ���� ����� ��� ��� ���� ���� ���������.
-- ��� ������� ��������� ����� NULL-�������� ���������� �������� ��������.

DELIMITER //

CREATE TRIGGER validate_name_description_insert BEFORE INSERT ON products
FOR EACH ROW BEGIN
  IF NEW.name IS NULL AND NEW.description IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Both name and description are NULL';
  END IF;
END//

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  (NULL, NULL, 9360.00, 2)//

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('ASUS PRIME Z370-P', 'HDMI, SATA3, PCI Express 3.0,, USB 3.1', 9360.00, 2)//

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  (NULL, 'HDMI, SATA3, PCI Express 3.0,, USB 3.1', 9360.00, 2)//

CREATE TRIGGER validate_name_description_update BEFORE UPDATE ON products
FOR EACH ROW BEGIN
  IF NEW.name IS NULL AND NEW.description IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Both name and description are NULL';
  END IF;
END//

-- 3.�������� �������� ������� ��� ���������� ������������� ����� ���������. 
-- ������� ��������� ���������� ������������������ � ������� ����� ����� ����� ���� ���������� �����.
--# ����� ������� FIBONACCI(10) ������ ���������� ����� 55.

DELIMITER //

CREATE FUNCTION FIBONACCI(num INT)
RETURNS INT DETERMINISTIC
BEGIN
  DECLARE fs DOUBLE;
  SET fs = SQRT(5);

  RETURN (POW((1 + fs) / 2.0, num) + POW((1 - fs) / 2.0, num)) / fs;
END//

SELECT FIBONACCI(10)//


-- �������� ��������� � ������� �� �� vk

-- 1. ������ �������

-- �������������� ������
-- ���-�� ����������� � ������ � ������������
-- /
-- ���-�� ����������� � ������ �� ������������

-- ��� ������ - ������������ ����
-- ���� �������� ������ ������� - ������������ ��������� ������.

USE vk;

DROP FUNCTION IF EXISTS friendship_direction;

DELIMITER -
CREATE FUNCTION friendship_direction(check_user_id INT)
RETURNS DECIMAL(3,2) READS SQL DATA

  BEGIN
    
    DECLARE requests_to_user INT;
    DECLARE requests_from_user INT;
    
    SET requests_to_user = 
      (SELECT COUNT(*) 
        FROM friendship
          WHERE friend_id = check_user_id);
    
    SET requests_from_user = 
      (SELECT COUNT(*) 
        FROM friendship
          WHERE user_id = check_user_id);
    
    RETURN requests_to_user / requests_from_user;
  END-
  
DELIMITER ;

-- ������ ������������� ��� ������������ � id 8
SELECT friendship_direction(8);



-- 2. ������ ���������

-- �������� ����������� ���� "��������, ��� ����� ��������� ���������� � ..."
-- ��������:
-- �� ������ ������
-- ������� � ����� ������
-- ������ ������
-- �� ������� ���������� 5 ������� � ��������� ����������.


DROP PROCEDURE IF EXISTS friendship_offers;

DELIMITER -

CREATE PROCEDURE friendship_offers (IN for_user_id INT)

  BEGIN 
    (
      SELECT pr2.user_id
        FROM profiles pr1
          JOIN profiles pr2
            ON pr1.city = pr2.city
        WHERE pr1.user_id = for_user_id
      
      UNION
      
      SELECT cu2.user_id
        FROM communities_users cu1
          JOIN communities_users cu2
            ON cu1.community_id = cu2.community_id
        WHERE cu1.user_id = for_user_id
      
      UNION
            
      SELECT DISTINCT fr2.user_id
        FROM friendship fr1
          JOIN friendship fr2
            ON fr1.user_id = fr2.user_id 
              OR fr1.friend_id = fr2.friend_id
              OR fr1.friend_id = fr2.user_id 
              OR fr1.user_id = fr2.friend_id
            WHERE fr1.user_id = for_user_id 
              OR fr1.friend_id = for_user_id 
          
    )
        
    ORDER BY RAND()
    LIMIT 5;
     
END; -
  
DELIMITER ;

CALL friendship_offers(3);

-- �������� ������� � ��������
SHOW FUNCTION STATUS LIKE 'friendship_direction';
SHOW CREATE FUNCTION friendship_direction;

SHOW PROCEDURE STATUS LIKE 'friendship_offers';
SHOW CREATE PROCEDURE friendship_offers;

-- �������
-- ���������� ������
SELECT id, firstname, lastname 
  FROM users 
    WHERE email = 'alexis29@example.org';

-- � ����� ������� ������, ������ ���������� ��������� ��� ��� �������, ������� ������������ � ������� WHERE.
-- ���������� ������ �� �������:
SELECT id, firstname, lastname 
  FROM users 
    WHERE email = 'alexis29@example.org';
    
CREATE INDEX users_email_idx ON users(email);

-- ������������ �������� ��������
-- ����������, ��� ���� ������� �������� ���:
SELECT id, firstname, lastname, email FROM users;

-- ����� �������� ������� �� ������� email, MySQL �������� ��� �� �������� � 
-- ��������������� ����:
users_email_idx
+-----------------------------+
| acarroll@example.net        |
| alvera.terry@example.org    |
| alyce76@example.com         |
| arianna46@example.net       |
| arielle.murazik@example.org |
| aurelio.abbott@example.org  |
| beatty.tommie@example.com   |
| bergnaum.asia@example.org   |
| bergnaum.donato@example.org |
| blaise68@example.org        |
+-----------------------------+

-- ���� ����� �������
DROP INDEX users_email_idx ON users;

-- ����� ���� �������� MySQL ������ ������������ ������ users_email_idx ��� ���������� �������� ��������.

-- ����������
SELECT * FROM profiles ORDER BY birthday;

-- ��������� ����� �� ������� � ������� ������ �� �������, �� ������� ���������� ����������:
CREATE INDEX profiles_birthday_idx ON profiles(birthday);

-- MySQL ������������ ����� ���������� �������. ��� ������ ��� �������, 
-- �������� � ������� ������ ���� ����������� �� ���� �������. 

-- ����� ������� �������� ������������� ������� ��� ���������� ��������. 
SELECT * FROM users WHERE email = 'alexis29@example.org';

-- �� ������� email ���������� ������� ���������� ������:
DROP INDEX users_email_idx ON users;
CREATE UNIQUE INDEX users_email_uq ON users(email);

-- ��������� �������
-- ���������� ����� ������:
SELECT * FROM messages WHERE from_user_id = 9 AND to_user_id = 3;

-- ��� ������� ������� ��������� ������ �� ��� �������:
CREATE INDEX messages_from_user_id_to_user_id_idx ON messages (from_user_id, to_user_id);

-- ���������� ���������� �������
-- messages_from_user_id_to_user_id_idx
-- 1 3
-- 2 4
-- 3 8
-- ...

-- ����������
-- ��������� ������� ����� ����� ������������, ���� ����������� ����������:
SELECT * FROM profiles WHERE country = 'Russia' ORDER BY birthday;

-- � ���� ������ ��� ����� ����� ������� ������ � �������
-- WHERE ORDER BY



-- ������� �������

-- ������
-- ����� ������� �������� ����� ���������� � ������� ����� � ���������� �����������

-- ������ ������������ ��������, �������� ���������� �������
SELECT media_types.name, 
  SUM(media.size) AS total_by_type,
  (SELECT SUM(size) FROM media) AS total_size,
  SUM(media.size)/(SELECT SUM(size) FROM media) * 100 AS "%%" 
    FROM media
      JOIN media_types
        ON media.media_type_id = media_types.id
    GROUP BY media.media_type_id;

-- ���������� ��������� ���������� ������� ��� �������
SELECT DISTINCT media_types.name, 
  SUM(media.size) OVER(PARTITION BY media.media_type_id) AS total_by_type,
  SUM(media.size) OVER() AS total,
  SUM(media.size) OVER(PARTITION BY media.media_type_id) / SUM(media.size) OVER() * 100 AS "%%"
    FROM media
      JOIN media_types
        ON media.media_type_id = media_types.id;

-- ��������� �����
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

-- ������� ���� ��������
SELECT DISTINCT media_types.name,
  AVG(media.size) OVER w AS average,
  MIN(media.size) OVER w AS min,
  MAX(media.size) OVER w AS max,
  SUM(media.size) OVER w AS total_by_type,
  SUM(media.size) OVER() AS total,
  SUM(media.size) OVER w / SUM(media.size) OVER() * 100 AS "%%"
    FROM (media
      JOIN media_types
        ON media.media_type_id = media_types.id)
        WINDOW w AS (PARTITION BY media.media_type_id);

-- ������� ������� �� ����������� �����
-- ������� DISTINCT
SELECT media_types.name,
  AVG(media.size) OVER w AS average,
  MIN(media.size) OVER w AS min,
  MAX(media.size) OVER w AS max,
  SUM(media.size) OVER w AS total_by_type,
  SUM(media.size) OVER() AS total,
  SUM(media.size) OVER w / SUM(media.size) OVER() * 100 AS "%%"
    FROM (media
      JOIN media_types
        ON media.media_type_id = media_types.id)
        WINDOW w AS (PARTITION BY media.media_type_id);

-- ��������� ������ ������� �������
SELECT user_id, city, birthday,
  ROW_NUMBER() OVER w AS 'row_number',
  FIRST_VALUE(city)  OVER w AS 'first',
  LAST_VALUE(city)   OVER w AS 'last',
  NTH_VALUE(city, 2) OVER w AS 'second'
    FROM profiles
      WINDOW w AS (PARTITION BY LEFT(birthday, 3) ORDER BY birthday);  


-- ��������������

-- ��� �� ������������ ������������, ��� ���������� ��������� ���������� ����, ��� ���������� ������������������.
-- ����������

-- �������� �������

-- ����� ����� ��������������?
-- ��� ��������� � �������������������.

-- ��� ����������, ����� �������������� ���������?
-- ����� ��������� ��� ��������� ������� �����������.
 
-- ��� �������� ����������� ��������������?
-- ������� �� ������� ������.

-- ��������� ���������� �����
-- 1. ��������� ��������
-- ���������� ������ � ������������ � ������� users

-- 2. ������� ���� BLOB
-- �����

-- 3. ������������� ���������� ������ (����� 4-�)
-- ����������� ������
-- media � media_types
-- ���������� ENUM
-- ���������� JSON


-- --------------------------------------------------------------------------------------------------------------------------------------------------------

#������������ ������� �� ���� ������������ ��������

     #�������� ������� logs ���� Archive. ����� ��� ������ �������� ������ � �������� users, 
#catalogs � products � ������� logs ���������� ����� � ���� �������� ������, �������� �������, 
#������������� ���������� ����� � ���������� ���� name.

     USE shop;
    
    SHOW TABLES;
   
  CREATE TABLE logs (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
table_name VARCHAR (20),
table_id INT UNSIGNED,
name_field VARCHAR (255),
event_date_time DATETIME
) COMMENT = '���� �������� � �������� users, catalogs, products' ENGINE = Archive;

DESC logs;

SELECT * FROM users u ;

DELETE FROM users WHERE id = 0;

DESC users;

SELECT MAX(updated_at) FROM users ;

SELECT id FROM users WHERE updated_at = (SELECT updated_at FROM users ORDER BY updated_at DESC LIMIT 1);

DELIMITER //

DROP TRIGGER IF EXISTS insert_users_log //

CREATE TRIGGER insert_users_log AFTER INSERT ON users
FOR EACH ROW
BEGIN

	INSERT INTO logs(table_name, table_id, name_field, event_date_time) VALUES
    ('users', COALESCE (NEW.id, (SELECT id FROM users WHERE updated_at = (SELECT updated_at FROM users ORDER BY updated_at DESC LIMIT 1))), NEW.name, NOW());

END //

SELECT * FROM catalogs;

DELIMITER //

DROP TRIGGER IF EXISTS insert_catalogs_log //

CREATE TRIGGER insert_catalogs_log AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN

	INSERT INTO logs(table_name, table_id, name_field, event_date_time) VALUES
    ('catalogs', NEW.id, NEW.name, NOW());

END //

SELECT * FROM products;


DELIMITER //

DROP TRIGGER IF EXISTS insert_products_log //

CREATE TRIGGER insert_products_log AFTER INSERT ON products
FOR EACH ROW
BEGIN

	INSERT INTO logs(table_name, table_id, name_field, event_date_time) VALUES
    ('products', NEW.id, NEW.name, NOW());

END //

INSERT INTO users (id, name, date, birthday, room, created_at, updated_at) VALUES
 (24, 'Daniel', NOW(), '2020-04-04 17:27:21', 544, NOW(), NOW());

SELECT * FROM logs l ;

     
#(�� �������) �������� SQL-������, ������� �������� � ������� users ������� �������.

SELECT * FROM users ;

DELIMITER //

DROP PROCEDURE IF EXISTS insert_million //

CREATE PROCEDURE insert_million()

BEGIN
	
DECLARE i INT DEFAULT 1 ;
WHILE i =< 10 DO

INSERT INTO users (id, name, date, birthday, room, created_at, updated_at) VALUES
((25 + i), 'Million_names', NOW(), '2020-04-04 17:27:21', i, NOW(), NOW());

SET i = i + 1 ;
END WHILE ;	


END //

CREATE PROCEDURE 

INSERT INTO users (id, name, date, birthday, room, created_at, updated_at) VALUES
(25, 'Million_names', NOW(), '2020-04-04 17:27:21', 1, NOW(), NOW()),
(26, 'Million_names', NOW(), '2020-04-04 17:27:21', 2, NOW(), NOW()),
(27, 'Million_names', NOW(), '2020-04-04 17:27:21', 3, NOW(), NOW()),
...
(124, 'Million_names', NOW(), '2020-04-04 17:27:21', 100, NOW(), NOW())

