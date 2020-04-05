CREATE DATABASE tutu;

USE tutu;

-- таблица вокзалов ∆ƒ.

CREATE TABLE railways (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  railway_name VARCHAR(255) NOT NULL
  );

-- таблица с названи€ми станций и рассто€нием до них, временем поездки до этой станции.
 
CREATE TABLE stations_base (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  station_name VARCHAR(255) NOT NULL,
  distance INT UNSIGNED NOT NULL,
  ride_time INT UNSIGNED NOT NULL
  );
 
-- таблица с ветками ∆ƒ.

 DROP TABLE stations_line;
 
CREATE TABLE stations_line (
  line_name VARCHAR(255) NOT NULL,
  id INT UNSIGNED NOT NULL PRIMARY KEY,  
  railway_id INT UNSIGNED NOT NULL,
  station_id VARCHAR(255) NOT NULL
  );
 
-- таблица с расписанием поездов. ќт ј до ¬. ƒано только врем€ отправлени€ от начальной станции, дальше все рассчитываетс€ по таблице
-- stations_line, где есть врем€ движени€ до каждой станции.
 
 CREATE TABLE train_time (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  stations_line_name INT UNSIGNED NOT NULL,
  express_flag INT UNSIGNED NOT NULL,
  journey_date_time DATETIME DEFAULT NOW(),
  A_stations_line_id INT UNSIGNED NOT NULL,
  B_stations_line_id INT UNSIGNED NOT NULL
  );
 
 ALTER TABLE train_time MODIFY COLUMN stations_line_name VARCHAR(255) NOT NULL;
 
 -- станции, на которых поезд не останавливаетс€.
 
DROP TABLE except_stations;

  CREATE TABLE except_stations (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  station_id INT UNSIGNED NOT NULL
  );
  
 -- св€зь станций исключени€ и расписани€ движени€ поездов.
 
 DROP TABLE except_stations_train_time;

  CREATE TABLE except_stations_train_time (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  except_stations_id INT UNSIGNED NOT NULL,
  train_time_id INT UNSIGNED NOT NULL
  
  );
 
  -- модель поезда: ID поезда и номера его вагонов, тип вагона.
 
 DROP TABLE train;
 
  CREATE TABLE train (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  train_name VARCHAR(255) NOT NULL,
  train_time_id INT UNSIGNED NOT NULL,
  car_number INT UNSIGNED NOT NULL,
  car_id INT UNSIGNED NOT NULL
  );
 
 -- модель вагонов: ID, номер места и его тип.
 
 DROP TABLE car;
 
  CREATE TABLE car (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  car_name VARCHAR(255) NOT NULL,
  place_type_id INT UNSIGNED NOT NULL,
  place_number INT UNSIGNED NOT NULL
  );
 
-- типы мест в вагоне.
 
  CREATE TABLE places_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  place_type VARCHAR(255) NOT NULL
  );
 
-- цены в зависимости от типа места и расписани€ (поезда), цены даны только дл€ типов мест, а не на каждое место.
 
 DROP TABLE price;
 
   CREATE TABLE price (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  train_time_id INT UNSIGNED NOT NULL,
  place_type_id INT UNSIGNED NOT NULL,
  price INT UNSIGNED NOT NULL,
  price_reduced INT UNSIGNED NOT NULL
  );
 
 SHOW TABLES;

DESCRIBE railways;

INSERT INTO railways (railway_name) VALUES
('Leningradskii'),
('Yaroslavskii'),
('Kazanskii'),
('Belorusskii'),
('Kurskii'),
('Kievskii'),
('Rizhskii');

SELECT * FROM railways;
 
 DESCRIBE stations_base;
 
 INSERT INTO stations_base (station_name, distance, ride_time) VALUES
('Moskva Yaroslavskaya', 0, 0),
('Moskva-3', 2100, 6),
('Malenkovskaya', 1500, 3),
('Yauza', 1500, 3),
('Severyanin', 1800, 4),
('Losinoostrovskaya', 2000, 5),
('Los', 1800, 4),
('Perlovskaya', 1500, 3),
('Taininskaya', 1800, 4),
('Mjtishi', 2000, 5),
('Stroitel', 1500, 3),
('Chelyuskinskaya', 2000, 5),
('Tarasovskaya', 1800, 4),
('Klyazma', 1500, 3),
('Mamontovskaya', 2100, 6),
('Pushkino', 1800, 4),
('Zavetj Ilicha', 1800, 4),
('Pravda', 2000, 5),
('Zelenogradskaya', 1500, 3),
('43km', 2000, 5),
('Sofrino', 1800, 4),
('Ashukinskaya', 2000, 5),
('Kalistovo', 1500, 3),
('Radonezh', 2100, 6),
('Abramcevo', 1800, 4),
('Hotkovo', 1800, 4),
('Semhoz', 2000, 5),
('Sergiev Pasad', 2100, 6);
 
 SELECT * FROM stations_base;
 
DESCRIBE stations_line; 

 INSERT INTO stations_line (line_name, id, railway_id, station_id) VALUES
('Sergiev Posad', 1, 2, 1),
('Sergiev Posad', 2, 2, 2),
('Sergiev Posad', 3, 2, 3),
('Sergiev Posad', 4, 2, 4),
('Sergiev Posad', 5, 2, 5),
('Sergiev Posad', 6, 2, 6),
('Sergiev Posad', 7, 2, 7),
('Sergiev Posad', 8, 2, 8),
('Sergiev Posad', 9, 2, 9),
('Sergiev Posad', 10, 2, 10),
('Sergiev Posad', 11, 2, 11),
('Sergiev Posad', 12, 2, 12),
('Sergiev Posad', 13, 2, 13),
('Sergiev Posad', 14, 2, 14),
('Sergiev Posad', 15, 2, 15),
('Sergiev Posad', 16, 2, 16),
('Sergiev Posad', 17, 2, 17),
('Sergiev Posad', 18, 2, 18),
('Sergiev Posad', 19, 2, 19),
('Sergiev Posad', 20, 2, 20),
('Sergiev Posad', 21, 2, 21),
('Sergiev Posad', 22, 2, 22),
('Sergiev Posad', 23, 2, 23),
('Sergiev Posad', 24, 2, 24),
('Sergiev Posad', 25, 2, 25),
('Sergiev Posad', 26, 2, 26),
('Sergiev Posad', 27, 2, 27),
('Sergiev Posad', 28, 2, 28);


SELECT * FROM stations_line;
 
 
 DESCRIBE train_time;
 
 INSERT INTO train_time (stations_line_name, express_flag, journey_date_time, A_stations_line_id, B_stations_line_id) VALUES
('Sergiev Posad', 0, '2011-02-12 08:25:00', 1, 28),
('Sergiev Posad', 0, '2011-02-12 10:25:00', 1, 27),
('Sergiev Posad', 1, '2011-02-12 12:25:00', 1, 28),
('Sergiev Posad', 1, '2011-02-12 14:25:00', 1, 15),
('Sergiev Posad', 0, '2011-02-12 16:25:00', 1, 28);
 
 SELECT * FROM train_time;
 
 DESCRIBE except_stations;
 
 INSERT INTO except_stations (station_id) VALUES
(5),
(6),
(7),
(8),
(9);
 
 SELECT * FROM except_stations;

DESCRIBE except_stations_train_time;

 INSERT INTO except_stations_train_time (except_stations_id, train_time_id) VALUES
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4);

 SELECT * FROM except_stations_train_time;

DESCRIBE train;


INSERT INTO train (train_name, train_time_id, car_number, car_id) VALUES
('EL542', 1, 1, 1),
('EL542', 1, 2, 1),
('EL542', 1, 3, 1),

('EL545', 2, 1, 1),
('EL545', 2, 2, 1),

('EKS001', 3, 1, 2),
('EKS001', 3, 2, 2),
('EKS001', 3, 3, 2),

('EKS001', 4, 1, 2),
('EKS001', 4, 2, 2),
('EKS001', 4, 3, 2),

('EL742', 5, 1, 1),
('EL742', 5, 2, 1),
('EL742', 5, 3, 1);

SELECT * FROM train;

DESCRIBE car;

INSERT INTO car (car_name, place_type_id, place_number) VALUES
('VAG_TIP1', 1, 1),
('VAG_TIP1', 1, 2),
('VAG_TIP1', 1, 3),
('VAG_TIP1', 1, 4),
('VAG_TIP1', 1, 5),
('VAG_TIP1', 1, 6),
('VAG_TIP1', 1, 7),
('VAG_TIP1', 1, 8),
('VAG_TIP1', 1, 9),
('VAG_TIP1', 1, 10),
('VAG_TIP1', 1, 11),
('VAG_TIP1', 1, 12),
('VAG_TIP1', 1, 13),
('VAG_TIP1', 1, 14),
('VAG_TIP1', 1, 15),
('VAG_TIP1', 1, 16),
('VAG_TIP1', 1, 17),
('VAG_TIP1', 1, 18),
('VAG_TIP1', 1, 19),
('VAG_TIP1', 1, 20),
('VAG_TIP1', 1, 21),
('VAG_TIP1', 1, 22),
('VAG_TIP1', 1, 23),
('VAG_TIP1', 1, 24),
('VAG_TIP1', 1, 25),

('VAG_TIP2', 2, 1),
('VAG_TIP2', 2, 2),
('VAG_TIP2', 3, 3),
('VAG_TIP2', 3, 4),
('VAG_TIP2', 4, 5),
('VAG_TIP2', 5, 6),
('VAG_TIP2', 2, 7),
('VAG_TIP2', 2, 8),
('VAG_TIP2', 3, 9),
('VAG_TIP2', 3, 10),
('VAG_TIP2', 4, 11),
('VAG_TIP2', 5, 12),
('VAG_TIP2', 2, 13),
('VAG_TIP2', 2, 14),
('VAG_TIP2', 3, 15),
('VAG_TIP2', 3, 16),
('VAG_TIP2', 4, 17),
('VAG_TIP2', 5, 18),
('VAG_TIP2', 2, 19),
('VAG_TIP2', 2, 20),
('VAG_TIP2', 3, 21),
('VAG_TIP2', 3, 22),
('VAG_TIP2', 4, 23),
('VAG_TIP2', 5, 24);

SELECT * FROM car;


DESCRIBE places_types;

INSERT INTO places_types (place_type) VALUES
('Sidyachee_mesto'),
('Plackart_verhnee'),
('Plackart_nizhnee'),
('Plackart_bokovoe_verh'),
('Plackart_bokovoe_niz');

SELECT * FROM places_types;

DESCRIBE price;

INSERT INTO price (train_time_id, place_type_id, price, price_reduced) VALUES
(1, 1, 500, 400),
(2, 1, 500, 400),
(3, 2, 1000, 900),
(3, 3, 800, 700),
(3, 4, 600, 500),
(3, 5, 600, 500),
(4, 2, 1000, 900),
(4, 3, 800, 700),
(4, 4, 600, 500),
(4, 5, 600, 500),
(5, 1, 450, 350);

SELECT * FROM price;
