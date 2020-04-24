CREATE DATABASE tutu;

USE tutu;

-- таблица вокзалов ЖД.


CREATE TABLE railways (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  railway_name VARCHAR(255) NOT NULL
  );
 
 DESCRIBE railways;

INSERT INTO railways (railway_name) VALUES
('Leningradskii'),
('Yaroslavskii'),
('Kazanskii'),
('Belorusskii'),
('Kurskii'),
('Kievskii'),
('Rizhskii');
 
-- таблица с названиями станций и расстоянием до них в км.
 
-- DROP TABLE stations_base ;

CREATE TABLE stations_base (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  station_name VARCHAR(255) NOT NULL,
  distance DECIMAL(10,3) NOT NULL
  );
 
 DESCRIBE stations_base;
 
 -- ALTER TABLE stations_base MODIFY COLUMN distance DECIMAL(10,3) NOT NULL;

-- TRUNCATE TABLE stations_base ;
 
 
  INSERT INTO stations_base (station_name, distance) VALUES
('Moskva Yaroslavskaya', 0),
('Moskva-3', 2.100),
('Malenkovskaya', 3.600),
('Yauza', 5.100),
('Severyanin', 6.900),
('Losinoostrovskaya', 8.900),
('Los', 10.700),
('Perlovskaya', 12.200),
('Taininskaya', 14.000),
('Mjtishi', 16.000),
('Stroitel', 17.500),
('Chelyuskinskaya', 19.500),
('Tarasovskaya', 21.300),
('Klyazma', 22.800),
('Mamontovskaya', 24.900),
('Pushkino', 26.700),
('Zavetj Ilicha', 28.500),
('Pravda', 30.500),
('Zelenogradskaya', 32.000),
('43km', 34.000),
('Sofrino', 35.800),
('Ashukinskaya', 37.800),
('Kalistovo', 39.300),
('Radonezh', 41.400),
('Abramcevo', 43.200),
('Hotkovo', 45.000),
('Semhoz', 47.000),
('Sergiev Pasad', 49.100);
 
-- таблица с ветками ЖД.
 



CREATE TABLE stations_line (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  line_name VARCHAR(255) NOT NULL,
  railway_id INT UNSIGNED NOT NULL
  );
 
  INSERT INTO stations_line (line_name, railway_id) VALUES
('Сергиево-Посадская', 2);
 
 -- таблица связи станции и ветки, указан также номер станции начиная с Москвы.
 

 CREATE TABLE stations_line_stations_base (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  stations_line_id INT UNSIGNED NOT NULL,
  station_id INT UNSIGNED NOT NULL,
  station_number INT UNSIGNED
  );
 
   INSERT INTO stations_line_stations_base (stations_line_id, station_id, station_number) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(1, 4, 4),
(1, 5, 5),
(1, 6, 6),
(1, 7, 7),
(1, 8, 8),
(1, 9, 9),
(1, 10, 10),
(1, 11, 11),
(1, 12, 12),
(1, 13, 13),
(1, 14, 14),
(1, 15, 15),
(1, 16, 16),
(1, 17, 17),
(1, 18, 18),
(1, 19, 19),
(1, 20, 20),
(1, 21, 21),
(1, 22, 22),
(1, 23, 23),
(1, 24, 24),
(1, 25, 25),
(1, 26, 26),
(1, 27, 27),
(1, 28, 28);
 
-- таблица с расписанием поездов.
 


 CREATE TABLE train_time (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  stations_line_name INT UNSIGNED NOT NULL,
  train_name VARCHAR(255) NOT NULL,
  express_flag BIT NOT NULL,
  date_time_arrive DATETIME DEFAULT NOW(),
  stop_time TIME,
  station_id INT UNSIGNED NOT NULL,
  platform_id INT UNSIGNED NOT NULL
  );
 
 -- ALTER TABLE train_time MODIFY COLUMN express_flag BIT NOT NULL;
--  SELECT * FROM train_time tt ;

 INSERT INTO train_time (stations_line_id, train_id, express_flag, date_time_arrive, stop_time, station_id, platform_way_id) VALUES
(1, 1, 0, '2011-02-12 08:25:00', '00:01:00', 1, 1),
(1, 1, 0, '2011-02-12 08:28:00', '00:01:00', 2, 3),
(1, 1, 0, '2011-02-12 08:33:00', '00:01:00', 3, 5),
(1, 1, 0, '2011-02-12 08:37:00', '00:02:00', 4, 7),
(1, 1, 0, '2011-02-12 08:42:00', '00:03:00', 5, 9),
(1, 1, 0, '2011-02-12 08:50:00', '00:01:00', 6, 11),
(1, 1, 0, '2011-02-12 08:54:00', '00:01:00', 7, 13),
(1, 1, 0, '2011-02-12 08:58:00', '00:01:00', 8, 15),
(1, 1, 0, '2011-02-12 09:02:00', '00:01:00', 9, 19),
(1, 1, 0, '2011-02-12 09:04:00', '00:02:00', 10, 21),
(1, 1, 0, '2011-02-12 09:10:00', '00:01:00', 11, 25),
(1, 1, 0, '2011-02-12 09:13:00', '00:01:00', 12, 27),
(1, 1, 0, '2011-02-12 09:17:00', '00:01:00', 13, 29),
(1, 1, 0, '2011-02-12 09:20:00', '00:02:00', 14, 31),
(1, 1, 0, '2011-02-12 09:25:00', '00:02:00', 15, 33),
(1, 1, 0, '2011-02-12 09:30:00', '00:01:00', 16, 35),
(1, 1, 0, '2011-02-12 09:33:00', '00:01:00', 17, 39),
(1, 1, 0, '2011-02-12 09:37:00', '00:01:00', 18, 41),
(1, 1, 0, '2011-02-12 09:41:00', '00:01:00', 19, 43),
(1, 1, 0, '2011-02-12 09:44:00', '00:02:00', 20, 45),
(1, 1, 0, '2011-02-12 09:47:00', '00:01:00', 21, 49),
(1, 1, 0, '2011-02-12 09:50:00', '00:05:00', 22, 51),
(1, 1, 0, '2011-02-12 09:58:00', '00:01:00', 23, 53),
(1, 1, 0, '2011-02-12 10:01:00', '00:01:00', 24, 55),
(1, 1, 0, '2011-02-12 10:04:00', '00:02:00', 25, 57),
(1, 1, 0, '2011-02-12 10:08:00', '00:01:00', 26, 61),
(1, 1, 0, '2011-02-12 10:10:00', '00:01:00', 27, 63),
(1, 1, 0, '2011-02-12 10:15:00', '00:20:00', 28, 65);
 

 INSERT INTO train_time (stations_line_id, train_id, express_flag, date_time_arrive, stop_time, station_id, platform_way_id) VALUES
(1, 2, 0, '2011-02-12 11:25:00', '00:01:00', 1, 1),
(1, 2, 0, '2011-02-12 11:28:00', '00:01:00', 2, 3),
(1, 2, 0, '2011-02-12 11:33:00', '00:01:00', 3, 5),
(1, 2, 0, '2011-02-12 11:37:00', '00:02:00', 4, 7),
(1, 2, 0, '2011-02-12 11:42:00', '00:03:00', 5, 9),
(1, 2, 0, '2011-02-12 11:50:00', '00:01:00', 6, 11),
(1, 2, 0, '2011-02-12 11:54:00', '00:01:00', 7, 13),
(1, 2, 0, '2011-02-12 11:58:00', '00:01:00', 8, 15),
(1, 2, 0, '2011-02-12 12:02:00', '00:01:00', 9, 19),
(1, 2, 0, '2011-02-12 12:04:00', '00:02:00', 10, 21),
(1, 2, 0, '2011-02-12 12:10:00', '00:01:00', 11, 25),
(1, 2, 0, '2011-02-12 12:13:00', '00:01:00', 12, 27),
(1, 2, 0, '2011-02-12 12:17:00', '00:01:00', 13, 29),
(1, 2, 0, '2011-02-12 12:20:00', '00:02:00', 14, 31),
(1, 2, 0, '2011-02-12 12:25:00', '00:02:00', 15, 33), -- !!!
(1, 2, 0, '2011-02-12 12:30:00', '00:01:00', 16, 35),
(1, 2, 0, '2011-02-12 12:33:00', '00:01:00', 17, 39),
(1, 2, 0, '2011-02-12 12:37:00', '00:01:00', 18, 41),
(1, 2, 0, '2011-02-12 12:41:00', '00:01:00', 19, 43),
(1, 2, 0, '2011-02-12 12:44:00', '00:02:00', 20, 45),
(1, 2, 0, '2011-02-12 12:47:00', '00:01:00', 21, 49),
(1, 2, 0, '2011-02-12 12:50:00', '00:05:00', 22, 51),
(1, 2, 0, '2011-02-12 12:58:00', '00:01:00', 23, 53),
(1, 2, 0, '2011-02-12 13:01:00', '00:01:00', 24, 55),
(1, 2, 0, '2011-02-12 13:04:00', '00:02:00', 25, 57),
(1, 2, 0, '2011-02-12 13:08:00', '00:01:00', 26, 61),
(1, 2, 0, '2011-02-12 13:10:00', '00:01:00', 27, 63),
(1, 2, 0, '2011-02-12 13:15:00', '00:20:00', 28, 65);


 INSERT INTO train_time (stations_line_id, train_id, express_flag, date_time_arrive, stop_time, station_id, platform_way_id) VALUES
(1, 3, 1, '2011-02-12 12:25:00', '00:01:00', 1, 1),
(1, 3, 1, '2011-02-12 12:28:00', '00:01:00', 2, 3),
(1, 3, 1, '2011-02-12 12:33:00', '00:01:00', 3, 5),
(1, 3, 1, '2011-02-12 12:37:00', '00:02:00', 4, 7),
(1, 3, 1, '2011-02-12 12:42:00', '00:03:00', 5, 9),
(1, 3, 1, '2011-02-12 12:50:00', '00:01:00', 6, 11),
(1, 3, 1, '2011-02-12 12:54:00', '00:01:00', 7, 13),
(1, 3, 1, '2011-02-12 12:58:00', '00:01:00', 8, 15),
(1, 3, 1, '2011-02-12 13:02:00', '00:01:00', 9, 19),
(1, 3, 1, '2011-02-12 13:25:00', '00:02:00', 20, 45),
(1, 3, 1, '2011-02-12 13:29:00', '00:01:00', 21, 49),
(1, 3, 1, '2011-02-12 13:33:00', '00:05:00', 22, 51),
(1, 3, 1, '2011-02-12 13:40:00', '00:01:00', 23, 53),
(1, 3, 1, '2011-02-12 13:43:00', '00:01:00', 24, 55),
(1, 3, 1, '2011-02-12 13:45:00', '00:02:00', 25, 57),
(1, 3, 1, '2011-02-12 13:50:00', '00:01:00', 26, 61),
(1, 3, 1, '2011-02-12 13:54:00', '00:01:00', 27, 63),
(1, 3, 1, '2011-02-12 14:00:00', '00:20:00', 28, 65);


 INSERT INTO train_time (stations_line_id, train_id, express_flag, date_time_arrive, stop_time, station_id, platform_way_id) VALUES
(1, 4, 1, '2011-02-12 14:25:00', '00:01:00', 1, 1),
(1, 4, 1, '2011-02-12 14:28:00', '00:01:00', 2, 3),
(1, 4, 1, '2011-02-12 14:33:00', '00:01:00', 3, 5),
(1, 4, 1, '2011-02-12 14:37:00', '00:02:00', 4, 7),
(1, 4, 1, '2011-02-12 14:42:00', '00:03:00', 5, 9),
(1, 4, 1, '2011-02-12 14:50:00', '00:01:00', 6, 11),
(1, 4, 1, '2011-02-12 14:54:00', '00:01:00', 7, 13),
(1, 4, 1, '2011-02-12 14:58:00', '00:01:00', 8, 15),
(1, 4, 1, '2011-02-12 15:02:00', '00:01:00', 9, 19),
(1, 4, 1, '2011-02-12 15:40:00', '00:02:00', 25, 57),
(1, 4, 1, '2011-02-12 15:44:00', '00:01:00', 26, 61),
(1, 4, 1, '2011-02-12 15:47:00', '00:01:00', 27, 63),
(1, 4, 1, '2011-02-12 15:50:00', '00:20:00', 28, 65);


 INSERT INTO train_time (stations_line_id, train_id, express_flag, date_time_arrive, stop_time, station_id, platform_way_id) VALUES
(1, 5, 0, '2011-02-12 17:25:00', '00:01:00', 1, 1),
(1, 5, 0, '2011-02-12 17:28:00', '00:01:00', 2, 3),
(1, 5, 0, '2011-02-12 17:33:00', '00:01:00', 3, 5),
(1, 5, 0, '2011-02-12 17:37:00', '00:02:00', 4, 7),
(1, 5, 0, '2011-02-12 17:42:00', '00:03:00', 5, 9),
(1, 5, 0, '2011-02-12 17:50:00', '00:01:00', 6, 11),
(1, 5, 0, '2011-02-12 17:54:00', '00:01:00', 7, 13),
(1, 5, 0, '2011-02-12 17:58:00', '00:01:00', 8, 15),
(1, 5, 0, '2011-02-12 18:02:00', '00:01:00', 9, 19),
(1, 5, 0, '2011-02-12 18:04:00', '00:02:00', 10, 21),
(1, 5, 0, '2011-02-12 18:10:00', '00:01:00', 11, 25),
(1, 5, 0, '2011-02-12 18:13:00', '00:01:00', 12, 27),
(1, 5, 0, '2011-02-12 18:17:00', '00:01:00', 13, 29),
(1, 5, 0, '2011-02-12 18:20:00', '00:02:00', 14, 31),
(1, 5, 0, '2011-02-12 18:25:00', '00:02:00', 15, 33),
(1, 5, 0, '2011-02-12 18:30:00', '00:01:00', 16, 35),
(1, 5, 0, '2011-02-12 18:33:00', '00:01:00', 17, 39),
(1, 5, 0, '2011-02-12 18:37:00', '00:01:00', 18, 41),
(1, 5, 0, '2011-02-12 18:41:00', '00:01:00', 19, 43),
(1, 5, 0, '2011-02-12 18:44:00', '00:02:00', 20, 45),
(1, 5, 0, '2011-02-12 18:47:00', '00:01:00', 21, 49),
(1, 5, 0, '2011-02-12 18:50:00', '00:05:00', 22, 51),
(1, 5, 0, '2011-02-12 18:58:00', '00:01:00', 23, 53),
(1, 5, 0, '2011-02-12 19:01:00', '00:01:00', 24, 55),
(1, 5, 0, '2011-02-12 19:04:00', '00:02:00', 25, 57),
(1, 5, 0, '2011-02-12 19:08:00', '00:01:00', 26, 61),
(1, 5, 0, '2011-02-12 19:10:00', '00:01:00', 27, 63),
(1, 5, 0, '2011-02-12 19:15:00', '00:20:00', 28, 65);

 INSERT INTO train_time (stations_line_id, train_id, express_flag, date_time_arrive, stop_time, station_id, platform_way_id) VALUES
(1, 6, 0, '2011-02-12 19:25:00', '00:01:00', 1, 1),
(1, 6, 0, '2011-02-12 19:28:00', '00:01:00', 2, 3),
(1, 6, 0, '2011-02-12 19:33:00', '00:01:00', 3, 5),
(1, 6, 0, '2011-02-12 19:37:00', '00:02:00', 4, 7),
(1, 6, 0, '2011-02-12 19:42:00', '00:03:00', 6, 9),
(1, 6, 0, '2011-02-12 19:50:00', '00:01:00', 6, 11),
(1, 6, 0, '2011-02-12 19:54:00', '00:01:00', 7, 13),
(1, 6, 0, '2011-02-12 19:58:00', '00:01:00', 8, 15),
(1, 6, 0, '2011-02-12 20:02:00', '00:01:00', 9, 19),
(1, 6, 0, '2011-02-12 20:04:00', '00:02:00', 10, 21),
(1, 6, 0, '2011-02-12 20:10:00', '00:01:00', 11, 25),
(1, 6, 0, '2011-02-12 20:13:00', '00:01:00', 12, 27),
(1, 6, 0, '2011-02-12 20:17:00', '00:01:00', 13, 29),
(1, 6, 0, '2011-02-12 20:20:00', '00:02:00', 14, 31),
(1, 6, 0, '2011-02-12 20:25:00', '00:02:00', 15, 33),
(1, 6, 0, '2011-02-12 20:30:00', '00:01:00', 16, 35),
(1, 6, 0, '2011-02-12 20:33:00', '00:01:00', 17, 39),
(1, 6, 0, '2011-02-12 20:37:00', '00:01:00', 18, 41),
(1, 6, 0, '2011-02-12 20:41:00', '00:01:00', 19, 43),
(1, 6, 0, '2011-02-12 20:44:00', '00:02:00', 20, 45),
(1, 6, 0, '2011-02-12 20:47:00', '00:01:00', 21, 49),
(1, 6, 0, '2011-02-12 20:50:00', '00:05:00', 22, 51),
(1, 6, 0, '2011-02-12 20:58:00', '00:01:00', 23, 53),
(1, 6, 0, '2011-02-12 21:01:00', '00:01:00', 24, 55),
(1, 6, 0, '2011-02-12 21:04:00', '00:02:00', 25, 57),
(1, 6, 0, '2011-02-12 21:08:00', '00:01:00', 26, 61),
(1, 6, 0, '2011-02-12 21:10:00', '00:01:00', 27, 63),
(1, 6, 0, '2011-02-12 21:15:00', '00:20:00', 28, 65);

 INSERT INTO train_time (stations_line_id, train_id, express_flag, date_time_arrive, stop_time, station_id, platform_way_id) VALUES
(1, 7, 0, '2011-02-12 21:25:00', '00:01:00', 1, 1),
(1, 7, 0, '2011-02-12 21:28:00', '00:01:00', 2, 3),
(1, 7, 0, '2011-02-12 21:33:00', '00:01:00', 3, 5),
(1, 7, 0, '2011-02-12 21:37:00', '00:02:00', 4, 7),
(1, 7, 0, '2011-02-12 21:42:00', '00:03:00', 7, 9),
(1, 7, 0, '2011-02-12 21:50:00', '00:01:00', 6, 11),
(1, 7, 0, '2011-02-12 21:54:00', '00:01:00', 7, 13),
(1, 7, 0, '2011-02-12 21:58:00', '00:01:00', 8, 15),
(1, 7, 0, '2011-02-12 22:02:00', '00:01:00', 9, 19),
(1, 7, 0, '2011-02-12 22:04:00', '00:02:00', 10, 21),
(1, 7, 0, '2011-02-12 22:10:00', '00:01:00', 11, 25),
(1, 7, 0, '2011-02-12 22:13:00', '00:01:00', 12, 27),
(1, 7, 0, '2011-02-12 22:17:00', '00:01:00', 13, 29),
(1, 7, 0, '2011-02-12 22:20:00', '00:02:00', 14, 31),
(1, 7, 0, '2011-02-12 22:25:00', '00:02:00', 15, 33),
(1, 7, 0, '2011-02-12 22:30:00', '00:01:00', 16, 35),
(1, 7, 0, '2011-02-12 22:33:00', '00:01:00', 17, 39),
(1, 7, 0, '2011-02-12 22:37:00', '00:01:00', 18, 41),
(1, 7, 0, '2011-02-12 22:41:00', '00:01:00', 19, 43),
(1, 7, 0, '2011-02-12 22:44:00', '00:02:00', 20, 45),
(1, 7, 0, '2011-02-12 22:47:00', '00:01:00', 21, 49),
(1, 7, 0, '2011-02-12 22:50:00', '00:05:00', 22, 51),
(1, 7, 0, '2011-02-12 22:58:00', '00:01:00', 23, 53),
(1, 7, 0, '2011-02-12 23:01:00', '00:01:00', 24, 55),
(1, 7, 0, '2011-02-12 23:04:00', '00:02:00', 25, 57),
(1, 7, 0, '2011-02-12 23:08:00', '00:01:00', 26, 61),
(1, 7, 0, '2011-02-12 23:10:00', '00:01:00', 27, 63),
(1, 7, 0, '2011-02-12 23:15:00', '00:20:00', 28, 65);


 -- модель поезда:
 

 
  CREATE TABLE train (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  name VARCHAR(255) NOT NULL,
  type_id INT UNSIGNED NOT NULL,
  feedback_id INT UNSIGNED
  );
 
 -- ALTER TABLE train RENAME COLUMN train_type_id TO type_id;

 
 INSERT INTO train (train_name, train_type_id, feedback_id) VALUES
('EL601', 1, 1),
('SKK150', 2, 2),
('EKS750', 3, 3),
('PAS451', 4, 4),
('SKO298', 5, 5),
('VSO788', 6, 6),
('MVS898', 7, 7);

-- отзывы о поездах:



  CREATE TABLE feedback (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  train_id INT UNSIGNED NOT NULL,
  rate INT UNSIGNED,
  feedback TEXT,
  feedback_date DATETIME);

  INSERT INTO feedback (train_id, rate, feedback, feedback_date) VALUES
(1, 5, '{"who":"Alex", "text":"Мне все понравилось, сидишь себе и едешь!"}', '2007-05-08 12:35:29'),
(2, 4, '{"who":"Misha", "text":"В целом все хорошо, новые постели"}', '2018-06-15 18:00:05'),
(3, 1, '{"who":"Konstantin", "text":"Да вы что смеетесь?! сравните с поездами в Европе, и за те же деньги, кстати!"}', '2020-03-15 17:00:05'),
(4, 5, '{"who":"Alena", "text":"Вежливый проводник, все понравилось!"}', '2015-01-01 18:00:05'),
(5, 5, '{"who":"Max", "text":"Отлично."}', '2017-07-15 18:00:05'),
(6, 3, '{"who":"455monster", "text":"А че, неплохо так, везет!"}', '2014-02-15 14:00:05'),
(7, 5, '{"who":"Greg", "text":"Oh, I liked everything! Mysterious russian soul!"}', '2018-08-04 15:00:05');
  

 -- типы поездов:
 

 
  CREATE TABLE train_type (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  train_type_name VARCHAR(255) NOT NULL
  );

 INSERT INTO train_type (train_type_name) VALUES
('Пассажирские круглогодичного обращения'),
('Скорые пассажирские'),
('Скоростные'),
('Пассажирские сезонные и разового назначения'),
('Скорые сезонные и разового обращения'),
('Высокоскоростные'),
('Скорые, обслуживаемые мотор-вагонными составами');
 
 -- связь поезда и вагонов, формирование состава:
 


   CREATE TABLE train_car (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  train_id INT UNSIGNED NOT NULL,
  car_id INT UNSIGNED NOT NULL, 
  car_num INT UNSIGNED NOT NULL
  );
 
 INSERT INTO train_car (train_id, car_id, car_num) VALUES
(1, 1, 1), -- EL601
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(1, 1, 5),

(2, 3, 1), -- Скорые пассажирские
(2, 3, 2),
(2, 2, 3),
(2, 3, 4),
(2, 4, 5),

(3, 3, 1), -- Скоростные
(3, 3, 2),
(3, 4, 3),
(3, 4, 4),
(3, 5, 5),

(4, 1, 1), -- Пассажирские сезонные и разового назначения
(4, 1, 2),
(4, 1, 3),
(4, 2, 4),
(4, 2, 5),

(5, 3, 1), -- Скорые сезонные и разового обращения
(5, 3, 2),
(5, 3, 3),
(5, 4, 4),
(5, 4, 5),

(6, 3, 1), -- Высокоскоростные
(6, 4, 2),
(6, 4, 3),
(6, 6, 4),
(6, 6, 5),

(7, 3, 1), -- Скорые, обслуживаемые мотор-вагонными составами
(7, 3, 2),
(7, 4, 3),
(7, 4, 4),
(7, 6, 5);
 
-- вагоны:

  CREATE TABLE car (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  car_name VARCHAR(255) NOT NULL,
  car_type_id INT UNSIGNED NOT NULL
  );
 
 INSERT INTO car (car_name, car_type_id) VALUES
('С', 1),
('О', 2),
('ПЛ.', 3),
('К.', 4),
('М.', 5),
('СВ.', 6);
 
-- типы вагонов:


  CREATE TABLE car_type (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  car_type_name VARCHAR(255) NOT NULL
  );
 
  INSERT INTO car_type (car_type_name) VALUES
('Вагон с местами для сидения'),
('Вагон открытого с местами для сидения (общий)'),
('Спальный пассажирский вагон открытого типа (плацкартный)'),
('Купейный с 4–х местными купе'),
('Мягкий с 2-х местными купе с ванной комнатой'),
('Мягкий с 2–х местными купе');

-- типы мест в вагоне.
 


  CREATE TABLE places_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  place_type_name VARCHAR(255) NOT NULL
  );
 
 INSERT INTO places_types (place_type_name) VALUES
('Сидячее место'),
('Плацкарт верх'),
('Плацкарт низ'),
('Плацкарт боковое верх'),
('Плацкарт боковое низ'),
('Купе вех'),
('Купе низ'),
('Мягкое купе');
 
-- связь мест и вагонов:



CREATE TABLE car_place (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  car_id INT UNSIGNED NOT NULL,
  place_type_id INT UNSIGNED NOT NULL,
  place_num INT UNSIGNED NOT NULL
  );
 
 INSERT INTO car_place (car_id, place_type_id, place_num) VALUES
(1, 1, 1), -- Вагон с местами для сидения
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(1, 1, 5),
(1, 1, 6), 
(1, 1, 7),
(1, 1, 8),
(1, 1, 9),
(1, 1, 10),
(1, 1, 11), 
(1, 1, 12),
(1, 1, 13),
(1, 1, 14),
(1, 1, 15),
(1, 1, 16), 
(1, 1, 17),
(1, 1, 18),
(1, 1, 19),
(1, 1, 20),
(1, 1, 21), 
(1, 1, 22),
(1, 1, 23),
(1, 1, 24),
(1, 1, 25),
(2, 1, 1), -- Вагон открытого с местами для сидения (общий)
(2, 1, 2),
(2, 1, 3),
(2, 1, 4),
(2, 1, 5),
(2, 1, 6), 
(2, 1, 7),
(2, 1, 8),
(2, 1, 9),
(2, 1, 10),
(2, 1, 11), 
(2, 1, 12),
(2, 1, 13),
(2, 1, 14),
(2, 1, 15),
(2, 1, 16), 
(2, 1, 17),
(2, 1, 18),
(2, 1, 19),
(2, 1, 20),
(2, 1, 21), 
(2, 1, 22),
(2, 1, 23),
(2, 1, 24),
(2, 1, 25),
(3, 2, 1), -- Спальный пассажирский вагон открытого типа (плацкартный)
(3, 3, 2),
(3, 2, 3),
(3, 3, 4),
(3, 4, 5),
(3, 5, 6), 
(3, 2, 7),
(3, 3, 8),
(3, 2, 9),
(3, 3, 10),
(3, 4, 11), 
(3, 5, 12),
(3, 2, 13),
(3, 3, 14),
(3, 2, 15),
(3, 3, 16), 
(3, 4, 17),
(3, 5, 18),
(3, 2, 19),
(3, 3, 20),
(3, 2, 21), 
(3, 3, 22),
(3, 4, 23),
(3, 5, 24),
(4, 6, 1), -- Купейный с 4–х местными купе
(4, 7, 2),
(4, 6, 3),
(4, 7, 4),
(4, 6, 5),
(4, 7, 6), 
(4, 6, 7),
(4, 7, 8),
(4, 6, 9),
(4, 7, 10),
(4, 6, 11), 
(4, 7, 12),
(4, 6, 13),
(4, 7, 14),
(4, 6, 15),
(4, 7, 16), 
(4, 6, 17),
(4, 7, 18),
(4, 6, 19),
(4, 7, 20),
(4, 6, 21), 
(4, 7, 22),
(4, 6, 23),
(4, 7, 24),
(4, 8, 1), -- Мягкий с 2-х местными купе с ванной комнатой
(4, 8, 2),
(4, 8, 3),
(4, 8, 4),
(4, 8, 5),
(4, 8, 6), 
(4, 8, 7),
(4, 8, 8),
(4, 8, 9),
(4, 8, 10),
(4, 8, 11), 
(4, 8, 12),
(4, 8, 13),
(4, 8, 14),
(4, 8, 15),
(4, 8, 16), 
(4, 8, 17),
(4, 8, 18),
(4, 8, 19),
(4, 8, 20),
(4, 8, 21), 
(4, 8, 22),
(4, 8, 23),
(4, 8, 24),
(4, 8, 1), -- Мягкий с 2–х местными купе
(4, 8, 2),
(4, 8, 3),
(4, 8, 4),
(4, 8, 5),
(4, 8, 6), 
(4, 8, 7),
(4, 8, 8),
(4, 8, 9),
(4, 8, 10),
(4, 8, 11), 
(4, 8, 12),
(4, 8, 13),
(4, 8, 14),
(4, 8, 15),
(4, 8, 16), 
(4, 8, 17),
(4, 8, 18),
(4, 8, 19),
(4, 8, 20),
(4, 8, 21), 
(4, 8, 22),
(4, 8, 23),
(4, 8, 24);


-- цена проезда одного километра.

  CREATE TABLE price (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  price_per_km INT UNSIGNED NOT NULL
  );
 
 
 INSERT INTO price (price_per_km) VALUES
(3);

-- цена за занятое место определенного типа:



   CREATE TABLE price_per_place_type (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  place_type_id INT UNSIGNED NOT NULL,
  price INT UNSIGNED NOT NULL,
  price_reduced INT UNSIGNED NOT NULL
  );
 
 INSERT INTO price_per_place_type (place_type_id, price, price_reduced) VALUES
(1, 100, 50),
(2, 200, 150),
(3, 210, 160),
(4, 150, 100),
(5, 150, 100),
(6, 250, 200),
(7, 250, 200),
(8, 500, 500);


-- таблица с платформами и путями:



CREATE TABLE platform_way (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  station_id INT UNSIGNED NOT NULL,
  way_id INT UNSIGNED NOT NULL,
  platform_number INT UNSIGNED NOT NULL,
  platform_type_id INT UNSIGNED NOT NULL
  );
 
  INSERT INTO platform_way (station_id, way_id, platform_number, platform_type_id) VALUES
(1, 1, 1, 1),
(1, 2, 1, 1),
(2, 1, 1, 1),
(2, 2, 1, 1),
(3, 1, 1, 1),
(3, 2, 1, 1),
(4, 1, 1, 1),
(4, 2, 1, 1),
(5, 1, 1, 1),
(5, 2, 1, 1),
(6, 1, 1, 1),
(6, 2, 1, 1),
(7, 1, 1, 1),
(7, 2, 1, 1),
(8, 1, 1, 1),
(8, 2, 1, 1),
(8, 1, 2, 1),
(8, 2, 2, 1),
(9, 1, 1, 1),
(9, 2, 1, 1),
(10, 1, 1, 1),
(10, 2, 1, 1),
(10, 1, 2, 1),
(10, 2, 2, 1),
(11, 1, 1, 1),
(11, 2, 1, 1),
(12, 1, 1, 1),
(12, 2, 1, 1),
(13, 1, 1, 1),
(13, 2, 1, 1),
(14, 1, 1, 1),
(14, 2, 1, 1),
(15, 1, 1, 1),
(15, 2, 1, 1),
(16, 1, 1, 1),
(16, 2, 1, 1),
(16, 1, 2, 1),
(16, 2, 2, 1),
(17, 1, 1, 1),
(17, 2, 1, 1),
(18, 1, 1, 1),
(18, 2, 1, 1),
(19, 1, 1, 1),
(19, 2, 1, 1),
(20, 1, 1, 1),
(20, 2, 1, 1),
(20, 1, 2, 1),
(20, 2, 2, 1),
(21, 1, 1, 1),
(21, 2, 1, 1),
(22, 1, 1, 1),
(22, 2, 1, 1),
(23, 1, 1, 1),
(23, 2, 1, 1),
(24, 1, 1, 1),
(24, 2, 1, 1),
(25, 1, 1, 1),
(25, 2, 1, 1),
(25, 1, 2, 1),
(25, 2, 2, 1),
(26, 1, 1, 1),
(26, 2, 1, 1),
(27, 1, 1, 1),
(27, 2, 1, 1),
(28, 1, 1, 1),
(28, 2, 1, 1),
(28, 1, 2, 1),
(28, 2, 2, 1);

 -- таблица с типами платформ:
 


     CREATE TABLE platforms_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  platform_type_name VARCHAR(255)
  );
 
 INSERT INTO platforms_types (platform_type_name) VALUES
('Верхняя'),
('Нижняя');
 
-- таблица с путями:



    CREATE TABLE ways (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  way_number INT UNSIGNED NOT NULL,
  way_name VARCHAR (255)
  );
 
 INSERT INTO ways (way_number, way_name) VALUES
(1, 'Первый путь'),
(2, 'Второй путь');
 
-- внешние ключи:

ALTER TABLE stations_line 
  ADD CONSTRAINT stations_line_railway_id_fk 
    FOREIGN KEY (railway_id) REFERENCES railways(id);

-- ----------------------------------------------------------------


   ALTER TABLE stations_line DROP FOREIGN KEY tr_stations_line_railway_id_fk;
     ALTER TABLE stations_line DROP FOREIGN KEY tr_stations_line_station_id_fk;



-- ----------------------------------------------------------------

   

ALTER TABLE train_time 
  ADD CONSTRAINT train_time_station_id_fk   -- !!
    FOREIGN KEY (station_id) REFERENCES stations_base(id),
  ADD CONSTRAINT train_time_platform_way_id_fk 
    FOREIGN KEY (platform_way_id) REFERENCES platform_way(id);
   
   
   ALTER TABLE train_time DROP FOREIGN KEY train_time_station_id_fk;
     ALTER TABLE train_time DROP FOREIGN KEY tr_train_time_platform_way_id_fk;


   
ALTER TABLE train_time 
  ADD CONSTRAINT train_time_train_id_fk 
    FOREIGN KEY (train_id) REFERENCES train(id),
  ADD CONSTRAINT train_stations_line_id_fk
    FOREIGN KEY (stations_line_id) REFERENCES stations_line(id);

   
                                    ALTER TABLE train_time DROP FOREIGN KEY tr_train_time_train_id_fk;
                                    ALTER TABLE train_time DROP FOREIGN KEY tr_train_stations_line_id_fk;

   
   ALTER TABLE platform_way  
  ADD CONSTRAINT platform_way_station_id_fk   -- !!
    FOREIGN KEY (station_id) REFERENCES stations_base(id),
  ADD CONSTRAINT stations_line_way_id_fk
    FOREIGN KEY (way_id) REFERENCES ways(id);
   
   
                                 ALTER TABLE platform_way DROP FOREIGN KEY platform_way_station_id_fk;

   
  ALTER TABLE platform_way
  ADD CONSTRAINT platform_way_platform_type_id_fk 
    FOREIGN KEY (platform_type_id) REFERENCES platforms_types(id);
   
                              ALTER TABLE platform_way DROP FOREIGN KEY tr_platform_way_platform_type_id_fk;

   
   
   ALTER TABLE train 
  ADD CONSTRAINT train_type_id_fk 
    FOREIGN KEY (type_id) REFERENCES train_type(id);
   
                           ALTER TABLE train DROP FOREIGN KEY train_train_type_id_fk;


      ALTER TABLE train 
  ADD CONSTRAINT train_train_feedback_id_fk 
    FOREIGN KEY (feedback_id) REFERENCES feedback(id);

                        ALTER TABLE train DROP FOREIGN KEY tr_train_train_feedback_id_fk;

   
   ALTER TABLE train_car 
  ADD CONSTRAINT train_car_train_id_fk 
    FOREIGN KEY (train_id) REFERENCES train(id),
  ADD CONSTRAINT train_car_car_id_fk 
    FOREIGN KEY (car_id) REFERENCES car(id);
    
                     ALTER TABLE train_car DROP FOREIGN KEY tr_train_car_train_id_fk;
                     ALTER TABLE train_car DROP FOREIGN KEY tr_train_car_car_id_fk;

   
   
   ALTER TABLE car 
  ADD CONSTRAINT car_car_type_id_fk 
    FOREIGN KEY (car_type_id) REFERENCES car_type(id);
   
   
                  ALTER TABLE car DROP FOREIGN KEY tr_car_car_type_id_fk;

   
   
   ALTER TABLE car_place 
  ADD CONSTRAINT car_place_type_id_fk 
    FOREIGN KEY (place_type_id) REFERENCES places_types(id),
  ADD CONSTRAINT car_place_car_id_fk
    FOREIGN KEY (car_id) REFERENCES car(id);
    
   
               ALTER TABLE car_place DROP FOREIGN KEY tr_car_place_car_id_fk;

   
      ALTER TABLE stations_line_stations_base    -- !!
  ADD CONSTRAINT stations_line_stations_base_stations_line_id_fk 
    FOREIGN KEY (stations_line_id) REFERENCES stations_line(id),
  ADD CONSTRAINT stations_line_stations_base_station_id_fk
    FOREIGN KEY (station_id) REFERENCES stations_base (id);
    
            ALTER TABLE stations_line_stations_base DROP FOREIGN KEY stations_line_stations_base_stations_line_id_fk;
            ALTER TABLE stations_line_stations_base DROP FOREIGN KEY stations_line_stations_base_station_id_fk;

   
   
        ALTER TABLE price_per_place_type 
  ADD CONSTRAINT price_per_place_type_place_type_id_fk 
    FOREIGN KEY (place_type_id) REFERENCES places_types(id);

  
         ALTER TABLE price_per_place_type DROP FOREIGN KEY tr_price_per_place_type_place_type_id_fk;

   
       ALTER TABLE feedback 
  ADD CONSTRAINT feedback_train_id_fk 
    FOREIGN KEY (train_id) REFERENCES train(id);
    
   
      ALTER TABLE feedback DROP FOREIGN KEY tr_feedback_train_id_fk;
     
     
     
--     -----------------------------------------------------------------------------------------
-- ЗАПРОСЫ
     
   
    -- раписание с поездами
    
     SELECT tr.name, tr_ty.train_type_name, date_time_arrive, stop_time, IF(express_flag = 1, 'Экспресс', 'Не экспресс') AS express,
     st.station_name, pl.platform_number AS platform, pl_ty.platform_type_name, w.way_name
    
     FROM train_time ti 
      LEFT JOIN train tr
      ON ti.train_id = tr.id 
      LEFT JOIN train_type tr_ty
      ON tr.id = tr_ty.id 
      LEFT JOIN stations_base st
      ON ti.station_id = st.id 
      LEFT JOIN platform_way pl
      ON ti.platform_way_id = pl.id
      LEFT JOIN platforms_types pl_ty
      ON pl.platform_type_id = pl_ty.id 
      LEFT JOIN ways w
      ON pl.way_id = w.id 
     ORDER BY date_time_arrive 
     ;
     
    -- посчитать количество остановок для 5 наибольших временых стоянок поезда во всем расписании для ЖД ветки на Сергиев-Посад
    
     SELECT COUNT(DISTINCT st.station_name) AS stops_number, stop_time, ANY_VALUE(st.station_name) AS station_name_example
    
     FROM train_time ti 
     LEFT JOIN stations_base st
     ON ti.station_id = st.id AND stations_line_id = (SELECT id FROM stations_line sl WHERE line_name = 'Сергиево-Посадская')
     GROUP BY stop_time
     ORDER BY stop_time DESC
     LIMIT 5
     ;
    
    -- посчитать стоимость проезда от Москвы до Сергиева-Посада (от начала до конца ветки) на всех типах мест
    
    
    SELECT pt.place_type_name, pppt.price +  -- price - цена на занятие места определенного типа в вагоне. place_type_name - тип места в вагоне
    
    (SELECT (SELECT price_per_km FROM price)*sb.distance AS price_for_ride_rub  -- считаем цену за проезд: умножаем цену за 1 км на количество км.
    
    FROM 
     
    stations_line_stations_base slsb
    JOIN stations_base sb
    ON slsb.station_id = sb.id 
	 
    WHERE station_number = (SELECT MAX(station_number) FROM stations_line_stations_base)  -- считаем конечную станцию на ветке
    
	AND stations_line_id = (SELECT id FROM stations_line sl WHERE line_name = 'Сергиево-Посадская')) AS price, -- получаем id ветки по ее названию
    
    
    pppt.price_reduced +  -- аналогично, но цена со скидкой
    
    (SELECT (SELECT price_per_km FROM price)*sb.distance AS price_for_ride_rub
    
    FROM 
     
    stations_line_stations_base slsb
     JOIN stations_base sb
     ON slsb.station_id = sb.id 
	 
    WHERE station_number = (SELECT MAX(station_number) FROM stations_line_stations_base)
    
	AND stations_line_id = (SELECT id FROM stations_line sl WHERE line_name = 'Сергиево-Посадская')) AS price_reduced
    
    FROM price_per_place_type pppt 
    JOIN places_types pt
    ON pppt.place_type_id = pt.id;

	-- рассчитать среднюю скорость движения поездa EL601
	 
   SELECT ROUND((
     
    SELECT distance FROM stations_base WHERE id = (SELECT MAX(station_number) FROM stations_line_stations_base WHERE 
      stations_line_id = (SELECT id FROM stations_line sl WHERE line_name = 'Сергиево-Посадская'))
     
    ) / (
    (
     SELECT TIMESTAMPDIFF(minute, (
     
     
     SELECT date_time_arrive FROM 
     train_time tt 
     JOIN train tr
     ON tt.train_id = tr.id AND tr.name = 'EL601' AND station_id = (
     
     SELECT MIN(station_number) FROM stations_line_stations_base WHERE 
      stations_line_id = (SELECT id FROM stations_line sl WHERE line_name = 'Сергиево-Посадская')
     
     )
     
     
     ), 
     (
     
     
          SELECT date_time_arrive FROM 
     train_time tt 
     JOIN train tr
     ON tt.train_id = tr.id AND tr.name = 'EL601' AND station_id = 
     
     (SELECT MAX(station_number) FROM stations_line_stations_base WHERE 
      stations_line_id = (SELECT id FROM stations_line sl WHERE line_name = 'Сергиево-Посадская'))

     )
     
     
     )
    ) / 60
     )) AS km_per_hour;
    
     
-- вывести поезда по среднему рейтингу в отзывах и по количеству вагонов в составе.

   SELECT   
   tr.name, ANY_VALUE(tt.train_type_name) AS train_type, COUNT(tc.car_num) AS car_num,
   AVG(fd.rate) AS average_rate
   FROM 
   feedback fd
   JOIN train tr
   ON fd.train_id = tr.id
   JOIN train_car tc 
   ON tc.train_id = tr.id
   JOIN train_type tt
   ON tt.id = tr.type_id 
   GROUP BY tr.name 
   ORDER BY average_rate DESC, car_num
   ;
   
  
  -- представление с названиями поездов, а также теми, кто оставил отзывы, их отзывами и рейтингом:
  
  CREATE VIEW feedbacks AS SELECT tr.name, (JSON_EXTRACT(feedback, '$.who')) AS who, rate,
  (JSON_EXTRACT(feedback, '$.text')) AS feed_text
    FROM 
  feedback fd
  JOIN train tr
   ON fd.train_id = tr.id
  ORDER BY rate
  ;
  
 -- в представлении найдем поезда с самым низким рейтингом, явно меньше 5ти:
 
 SELECT name, AVG(rate) AS avg_rate
  FROM 
   feedbacks 
 GROUP BY name
 HAVING AVG(rate) < 5 
 ORDER BY avg_rate ASC
  ;

 -- представление поездов с вагонами и местами в них:
 
 CREATE VIEW train_full AS
SELECT tr.name, tc.car_num, c.car_name, place_num, pt.place_type_name FROM 
train tr
JOIN train_car tc
ON tr.id = tc.train_id 
JOIN car c
ON c.id = tc.car_id 
JOIN car_place cp
ON cp.car_id = c.id 
JOIN places_types pt
ON pt.id = cp.place_type_id ;
 
-- посмотрим в каких поездах есть мягкие купе:

SELECT DISTINCT name FROM train_full 
WHERE place_type_name = 'Мягкое купе'
;

-- создадим представление, где будет расписание и поезда + места + вагоны + цены:

CREATE VIEW schedule_train_car_place_price AS 
SELECT DISTINCT ti.stations_line_id, ti.express_flag, ti.date_time_arrive, ti.stop_time, ti.station_id, 
tr.name, tc.car_num, c.car_name, cp.place_num, pt.place_type_name, pri.price  FROM 
train_time ti 
      LEFT JOIN train tr
      ON ti.train_id = tr.id 
      LEFT JOIN train_car tc
	  ON tr.id = tc.train_id 
	  LEFT JOIN car c
	  ON c.id = tc.car_id 
	  LEFT JOIN car_place cp
	  ON cp.car_id = c.id 
	  LEFT JOIN places_types pt
      ON pt.id = cp.place_type_id
      LEFT JOIN price_per_place_type pri
      ON pri.place_type_id = pt.id ;


-- посмотрим самый дешевый поезд, который останавливается на станции Софрино:

 
SELECT name, ROUND(AVG(price)) AS av_pr

FROM 

schedule_train_car_place_price vw
JOIN stations_base sb
ON vw.station_id = sb.id 
WHERE vw.station_id = 21  -- Софрино
GROUP BY vw.name
ORDER BY av_pr
LIMIT 1
;


