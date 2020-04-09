CREATE DATABASE tutu;

USE tutu;

-- таблица вокзалов ЖД.

ALTER TABLE railways RENAME TO tr_railways;

CREATE TABLE railways (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  railway_name VARCHAR(255) NOT NULL
  );
select * from railways;
-- таблица с названиями станций и расстоянием до них, временем поездки до этой станции.
 
ALTER TABLE stations_base RENAME TO tr_stations_base;


CREATE TABLE stations_base (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  station_name VARCHAR(255) NOT NULL,
  distance INT UNSIGNED NOT NULL
  -- ride_time INT UNSIGNED NOT NULL
  );
 
 DROP TABLE stations_base;

 select * FROM stations_base;
 
-- таблица с ветками ЖД.

 DROP TABLE stations_line;
 
ALTER TABLE stations_line RENAME TO tr_stations_line;

CREATE TABLE stations_line (
  line_name VARCHAR(255) NOT NULL,
  id INT UNSIGNED NOT NULL PRIMARY KEY,  
  railway_id INT UNSIGNED NOT NULL,
  station_id VARCHAR(255) NOT NULL
  );
 
 ALTER TABLE tr_stations_line MODIFY COLUMN station_id INT UNSIGNED NOT NULL;

 
  select * FROM tr_stations_line;

 
-- таблица с расписанием поездов. От А до В. Дано только время отправления от начальной станции, дальше все рассчитывается по таблице
-- stations_line, где есть время движения до каждой станции.
 
 ALTER TABLE train_time RENAME TO tr_train_time;

 
 DROP TABLE train_time;
 
 CREATE TABLE train_time (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  stations_line_name VARCHAR(255) NOT NULL,
  train_name VARCHAR(255) NOT NULL,
  express_flag INT UNSIGNED NOT NULL,
  date_time_arrive DATETIME DEFAULT NOW(),
  stop_time TIME,
  station_id INT UNSIGNED NOT NULL,
  platform_id INT UNSIGNED NOT NULL
  );
 
SELECT * FROM train_time order by date_time_arrive;
 
ALTER TABLE train_time MODIFY COLUMN stations_line_name VARCHAR(255) NOT NULL;

ALTER TABLE train_time ADD COLUMN created_at DATETIME;
ALTER TABLE train_time ADD COLUMN updated_at DATETIME;


ALTER TABLE train_time RENAME COLUMN platform_id TO platform_way_id;

ALTER TABLE train_time DROP COLUMN way_id;

UPDATE train_time SET created_at = (NOW() - INTERVAL 1 WEEK);
UPDATE train_time SET updated_at = NOW();




SELECT * FROM platforms;
SELECT * FROM train_time order by date_time_arrive;



 
 -- станции, на которых поезд не останавливается.
 
-- DROP TABLE except_stations;

 -- CREATE TABLE except_stations (
 -- id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
 -- station_id INT UNSIGNED NOT NULL
 -- );
  
 -- связь станций исключения и расписания движения поездов.
 
 -- DROP TABLE except_stations_train_time;

  -- CREATE TABLE except_stations_train_time (
  -- id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  -- except_stations_id INT UNSIGNED NOT NULL,
  -- train_time_id INT UNSIGNED NOT NULL
  
 -- );
 
  -- модель поезда: ID поезда и номера его вагонов, тип вагона.
 
 DROP TABLE train;
 
 ALTER TABLE train RENAME TO tr_train;


  CREATE TABLE train (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  train_name VARCHAR(255) NOT NULL,
  train_time_id INT UNSIGNED NOT NULL,
  car_number INT UNSIGNED NOT NULL,
  car_id INT UNSIGNED NOT NULL
  );
 
 SELECT * FROM tr_train;
 -- модель вагонов: ID, номер места и его тип.
 
 DROP TABLE car;
 
 ALTER TABLE car RENAME TO tr_car;


  CREATE TABLE car (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  car_name VARCHAR(255) NOT NULL,
  place_type_id INT UNSIGNED NOT NULL,
  place_number INT UNSIGNED NOT NULL
  );
 
-- типы мест в вагоне.
 
 ALTER TABLE places_types RENAME TO tr_places_types;
 
  CREATE TABLE places_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,  
  place_type VARCHAR(255) NOT NULL
  );
 
-- цены в зависимости от типа места и расписания (поезда), цены даны только для типов мест, а не на каждое место.
 
 
 DROP TABLE price;
 

 ALTER TABLE price RENAME TO tr_price;


   CREATE TABLE price (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  train_time_id INT UNSIGNED NOT NULL,
  place_type_id INT UNSIGNED NOT NULL,
  price INT UNSIGNED NOT NULL,
  price_reduced INT UNSIGNED NOT NULL
  );
 
  ALTER TABLE platform_way RENAME TO tr_platform_way;

 SHOW TABLES;

   CREATE TABLE platforms (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  station_id INT UNSIGNED NOT NULL,
  way_id INT UNSIGNED NOT NULL,
  platform_number INT UNSIGNED NOT NULL,
  platform_type_id INT UNSIGNED NOT NULL
  );

 DROP TABLE platforms_types;

  ALTER TABLE platforms_types RENAME TO tr_platforms_types;


    CREATE TABLE platforms_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  platform_type_name VARCHAR(255)
  );
 
 
 INSERT INTO platforms_types (platform_type_name) VALUES
('Verhnyaya'),
('Nizhnyaya');
 
SELECT * FROM platforms_types;

DROP TABLE ways;

  ALTER TABLE ways RENAME TO tr_ways;


    CREATE TABLE ways (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  way_number INT UNSIGNED NOT NULL,
  way_name VARCHAR (255)
  );
 
 INSERT INTO ways (way_number, way_name) VALUES
(1, 'Pervji put'),
(2, 'Vtoroi put');
 
 SELECT * FROM ways;

DESCRIBE platforms;

ALTER TABLE platforms RENAME TO platform_way;


 INSERT INTO platforms (station_id, way_id, platform_number, platform_type_id) VALUES
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

SELECT * FROM platform_way;


 SHOW TABLES;

-- --------------------------------------------------------------------------------

  ALTER TABLE country RENAME TO hotel_country;


   CREATE TABLE country (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  city_name VARCHAR(255) NOT NULL
  );
 
 INSERT INTO country (city_name) VALUES

('Russia'),
('Turkey');
 
DROP TABLE city;

  ALTER TABLE city RENAME TO hotel_city;


   CREATE TABLE city (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  country_id INT UNSIGNED NOT NULL,
  city_name VARCHAR(255) NOT NULL
  );
 
 
 INSERT INTO city (country_id, city_name) VALUES

(1, 'Tver'),
(1, 'Moskva'),
(2, 'Istanbul');

SELECT * FROM city;

  ALTER TABLE district RENAME TO hotel_district;


   CREATE TABLE district (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  city_id INT UNSIGNED NOT NULL,
  district_name VARCHAR(255) NOT NULL
  );

  INSERT INTO district (city_id, district_name) VALUES
(1, 'Centralnji'),
(1, 'Zavolzhskii'),
(1, 'Moskovskii'),
(1, 'Proletarskii');

  INSERT INTO district (city_id, district_name) VALUES
(2, 'Bogorodkoe'),
(2, 'Preobrazhenskoe'),
(2, 'Sokolniki'),
(2, 'Basmannji'),
(2, 'Tverskoi');


SELECT * from district;
 
DROP TABLE metro_line;


  ALTER TABLE metro_line RENAME TO hotel_metro_line;


   CREATE TABLE metro_line (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  city_id INT UNSIGNED NOT NULL,
  line_number INT UNSIGNED NOT NULL,
  line_name VARCHAR(255) NOT NULL,
  metro_station_id INT UNSIGNED NOT NULL
  );
 
 
   INSERT INTO metro_line (city_id, line_number, line_name, metro_station_id) VALUES
(2, 1, 'Sokolnicheskaya liniya', 1),
(2, 1, 'Sokolnicheskaya liniya', 2),
(2, 1, 'Sokolnicheskaya liniya', 3),
(2, 1, 'Sokolnicheskaya liniya', 4),
(2, 1, 'Sokolnicheskaya liniya', 5),
(2, 1, 'Sokolnicheskaya liniya', 6),
(2, 1, 'Sokolnicheskaya liniya', 7),
(2, 1, 'Sokolnicheskaya liniya', 8),
(2, 1, 'Sokolnicheskaya liniya', 9),
(2, 1, 'Sokolnicheskaya liniya', 10); 
 
  SELECT * FROM metro_line;

  DROP TABLE metro_stations_base;

   ALTER TABLE metro_station RENAME TO hotel_metro_station;

 
   CREATE TABLE metro_station (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  city_id INT UNSIGNED NOT NULL,
  metro_line_id INT UNSIGNED NOT NULL,
  metro_station_name VARCHAR(255) NOT NULL
  );

  INSERT INTO metro_station (city_id, metro_line_id, metro_station_name) VALUES
(2, 1, 'Bulvar Rokossovskogo'),
(2, 1, 'Cherkizovskaya'),
(2, 1, 'Preopbrazhenkaya_plozhad'),
(2, 1, 'Sokolniki'),
(2, 1, 'Krasnoselskaya'),
(2, 1, 'Komsomolskaya'),
(2, 1, 'Krasnje vorota'),
(2, 1, 'Chistje prudj'),
(2, 1, 'Lubyanka'),
(2, 1, 'Ohotnji ryad');
 
 SELECT * FROM metro_station;

 
 
 DROP TABLE hotel;

 SELECT * FROM hotel;

    ALTER TABLE hotel RENAME TO hotel_hotel;

   CREATE TABLE hotel (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  hotel_name VARCHAR(255) NOT NULL,
  district_id  INT UNSIGNED NOT NULL,
  hotel_address VARCHAR(255) NOT NULL,
  city_id INT UNSIGNED NOT NULL,
  metro_line_id INT UNSIGNED NOT NULL,
  metro_station_id INT UNSIGNED NOT NULL,
  photo_link VARCHAR(255),
  stars INT UNSIGNED NOT NULL,
  services_description TEXT, -- !!! json
  tripadvisor_link VARCHAR(255),
  feedback_hotel_name VARCHAR(255),
  hotel_model_name VARCHAR(255),
  hotel_email VARCHAR(255) NOT NULL,
  hotel_phone VARCHAR(255) NOT NULL
  );

 
  INSERT INTO hotel (hotel_name, district_id, hotel_address, city_id, metro_line_id, metro_station_id, photo_link, stars, services_description, tripadvisor_link, feedback_hotel_name, hotel_model_name, hotel_email, hotel_phone) VALUES
('Otel Seliger', 1, 'Ul. Sovetskaya 38', 1, 0, 0, 'https://hotel.tutu.ru/rooms/seliger/?q=602260', 3, '{"wifi": "yes", "paking": "yes", "pool": "yes", "Bar and restaurant": "yes", "AC": "yes", "pets allowed": "yes", "spa services": "yes"}', 'https://www.tripadvisor.ru/Hotel_Review-g298487-d2704754-Reviews-Seliger_Hotel-Tver_Tver_Oblast_Central_Russia.html', 'tver_seliger', 'hotel_Tver_Seliger', 'info@hotel-seliger.ru', '+7 4822 1546544'),
('Mini otel Sitara', 1, '1st ul. Trusova 35', 1, 0, 0, 'https://hotel.tutu.ru/rooms/rumkomfort_hostel/?q=602260', 2, '{"wifi": "yes", "paking": "yes", "pool": "no", "Bar and restaurant": "yes", "AC": "no", "pets allowed": "no", "spa services": "yes"}', 'https://www.tripadvisor.ru/Hotel_Review-g298487-d5365646-Reviews-Sitara_Hotel-Tver_Tver_Oblast_Central_Russia.html', 'tver_sitara', 'hotel_Tver_Sitara', 'info@hotel-sitara.ru', '+7 4822 43465443'),
('Teremok Proletarskii', 1, 'Ul. Puhalskogo 25', 1, 0, 0, 'https://hotel.tutu.ru/rooms/teremok/?q=602260', 3, '{"wifi": "yes", "paking": "yes", "pool": "yes", "Bar and restaurant": "yes", "AC": "yes", "pets allowed": "no", "spa services": "yes"}', 'https://www.tripadvisor.ru/Hotel_Review-g298487-d2703433-Reviews-Teremok_Hotel-Tver_Tver_Oblast_Central_Russia.html', 'tver_teremok', 'hotel_Tver_Terem', 'info@hotel-terem.ru', '+7 4822 1544322'),
('Ladomir Apartment Khromova', 5, 'Khromova Street, 3', 2, 1, 3, 'https://hotel.tutu.ru/rooms/ladomir/?q=602260', 3, '{"wifi": "yes", "no": "yes", "pool": "no", "Bar and restaurant": "yes", "AC": "yes", "pets allowed": "no", "spa services": "no"}', 'https://www.tripadvisor.ru/Hotel_Review-g298487-d2704754-Reviews-SLadomir_Hotel-Moscow_Moscow_Oblast_Central_Russia.html', 'moskov_ladomir', 'hotel_Moscow_Ladomir', 'info@hotel-ladomir.ru', '+7 495 2346543'),
('InnZenBaum', 7, 'Fridrikha Engelsa st. 23, bldg. 3', 2, 1, 4, 'https://hotel.tutu.ru/rooms/innzenbaum/?q=2395', 3, '{"wifi": "yes", "paking": "no", "pool": "no", "Bar and restaurant": "yes", "AC": "yes", "pets allowed": "no", "spa services": "yes"}', 'https://www.tripadvisor.ru/Hotel_Review-g298487-d2704754-Reviews-Zen_Hotel-Moscow_Moscow_Oblast_Central_Russia.html', 'moskov_zen', 'hotel_Moscow_Zen', 'info@hotel-zen.ru', '+7 499 2766544');


 DROP TABLE feedback;

    ALTER TABLE feedback RENAME TO hotel_feedback;


  CREATE TABLE feedback (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  hotel_id INT UNSIGNED NOT NULL,
  guest VARCHAR(255),
  living_place VARCHAR(255),
  feedback_hotel_name VARCHAR(255),
  rate INT UNSIGNED,
  feedback VARCHAR(255),
  feedback_date DATETIME);

 INSERT INTO feedback (hotel_id, guest, living_place, feedback_hotel_name, rate, feedback, feedback_date) VALUES
(1, 'Oleg', 'Saint-Petersburg', 'tver_seliger', 5, 'Отличный отель, уютное метечко, хорошее расположение. Цены адекватные!', '2007-05-08 12:35:29'),
(2, 'Anastasia', 'Tver', 'tver_sitara', 4, 'Все понравилось, приеду еще!', '2018-06-15 18:00:05'),
(2, 'Max', 'MoskvAA', 'tver_sitara', 1, 'И обязательно так гадить??!!!! на клиентов плевать, да?!', '2020-03-15 17:00:05'),
(3, 'Misha', 'Omsk', 'tver_teremok', 5, 'Нормально все.', '2015-01-01 18:00:05'),
(1, 'Lena', 'Vologda', 'tver_seliger', 5, 'Замечательный номер, вкусный завтрак.', '2017-07-15 18:00:05'),
(4, '545444-RGER', 'Moscow-city', 'moskov_ladomir', 3, 'Как будто возвращаешься в начало 2000х, а так все супер!', '2014-02-15 14:00:05'),
(4, 'Andrei', 'USA, New-York', 'moskov_ladomir', 5, 'Один из лучших отелей Москвы. Прекрасная программа лояльности. Мы приехали очень рано и хотя заселение в 14.00 нас заселили через час после нашего раннего приезда.', '2018-08-04 15:00:05'),
(5, 'Koshka-Sashka', 'Msocow', 'moskov_zen', 5, 'Хочу выразить искреннюю благодарность за радушный прием и приятные впечатления, оставленные сотрудницей ресепшен Анастасией Балясниковой.', '2020-01-15 12:00:05'),
(5, 'Roma', 'Tver', 'moskov_zen', 3, 'был проездом, все понравилось кроме платной парковки. Какой то анахронизм. Парковка есть, пустая практически, цена 20 % от стоимости номера!!!!!', '2019-09-15 10:00:05'),
(5, 'Max', 'Saint-Petersburg', 'moskov_zen', 5, 'Отель + конференция. Проживали и совещались все очень удобно.', '2019-04-15 15:00:05');
  
SELECT * from feedback;

DROP TABLE hotel_model;
 
    CREATE TABLE hotel_model (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  hotel_model_name VARCHAR(255),
  floor_number INT UNSIGNED NOT NULL,
  room_number INT UNSIGNED NOT NULL,
  room_type_id INT UNSIGNED NOT NULL,
  booked_date_start DATETIME,
  booked_date_end DATETIME
  );
 
 DESCRIBE hotel_model;
 
SELECT * FROM hotel_model;

TRUNCATE table hotel_model; 

 INSERT INTO hotel_model (hotel_model_name, floor_number, room_number, room_type_id) VALUES
('hotel_Tver_Seliger', 1, 101, 1),
('hotel_Tver_Seliger', 1, 102, 1),
('hotel_Tver_Seliger', 1, 103, 1),
('hotel_Tver_Seliger', 1, 104, 1),
('hotel_Tver_Seliger', 1, 105, 1),
('hotel_Tver_Seliger', 1, 106, 1),
('hotel_Tver_Seliger', 1, 107, 1),
('hotel_Tver_Seliger', 1, 108, 1),
('hotel_Tver_Seliger', 1, 109, 1),
('hotel_Tver_Seliger', 1, 110, 2),
('hotel_Tver_Seliger', 1, 111, 2),
('hotel_Tver_Seliger', 1, 112, 3),
('hotel_Tver_Seliger', 1, 113, 3),
('hotel_Tver_Seliger', 1, 114, 4),
('hotel_Tver_Seliger', 1, 115, 4),
('hotel_Tver_Seliger', 2, 201, 1),
('hotel_Tver_Seliger', 2, 202, 1),
('hotel_Tver_Seliger', 2, 203, 1),
('hotel_Tver_Seliger', 2, 204, 1),
('hotel_Tver_Seliger', 2, 205, 1),
('hotel_Tver_Seliger', 2, 206, 1),
('hotel_Tver_Seliger', 2, 207, 1),
('hotel_Tver_Seliger', 2, 208, 1),
('hotel_Tver_Seliger', 2, 209, 1),
('hotel_Tver_Seliger', 2, 210, 2),
('hotel_Tver_Seliger', 2, 211, 2),
('hotel_Tver_Seliger', 2, 212, 3),
('hotel_Tver_Seliger', 2, 213, 3),
('hotel_Tver_Seliger', 2, 214, 4),
('hotel_Tver_Seliger', 2, 215, 4),
('hotel_Tver_Seliger', 3, 301, 1),
('hotel_Tver_Seliger', 3, 302, 1),
('hotel_Tver_Seliger', 3, 303, 1),
('hotel_Tver_Seliger', 3, 304, 1),
('hotel_Tver_Seliger', 3, 305, 1),
('hotel_Tver_Seliger', 3, 306, 1),
('hotel_Tver_Seliger', 3, 307, 1),
('hotel_Tver_Seliger', 3, 308, 1),
('hotel_Tver_Seliger', 3, 309, 1),
('hotel_Tver_Seliger', 3, 310, 2),
('hotel_Tver_Seliger', 3, 311, 2),
('hotel_Tver_Seliger', 3, 312, 3),
('hotel_Tver_Seliger', 3, 313, 3),
('hotel_Tver_Seliger', 3, 314, 4),
('hotel_Tver_Seliger', 3, 315, 4);
 

 INSERT INTO hotel_model (hotel_model_name, floor_number, room_number, room_type_id) VALUES
('hotel_Tver_Sitara', 1, 101, 2),
('hotel_Tver_Sitara', 1, 102, 2),
('hotel_Tver_Sitara', 1, 103, 2),
('hotel_Tver_Sitara', 1, 104, 2),
('hotel_Tver_Sitara', 1, 105, 2),
('hotel_Tver_Sitara', 1, 106, 1),
('hotel_Tver_Sitara', 1, 107, 1),
('hotel_Tver_Sitara', 1, 108, 1),
('hotel_Tver_Sitara', 1, 109, 1),
('hotel_Tver_Sitara', 1, 110, 1),
('hotel_Tver_Sitara', 2, 201, 2),
('hotel_Tver_Sitara', 2, 202, 2),
('hotel_Tver_Sitara', 2, 203, 2),
('hotel_Tver_Sitara', 2, 204, 2),
('hotel_Tver_Sitara', 2, 205, 2),
('hotel_Tver_Sitara', 2, 206, 1),
('hotel_Tver_Sitara', 2, 207, 1),
('hotel_Tver_Sitara', 2, 208, 1),
('hotel_Tver_Sitara', 2, 209, 1),
('hotel_Tver_Sitara', 3, 301, 2),
('hotel_Tver_Sitara', 3, 302, 2),
('hotel_Tver_Sitara', 3, 303, 2),
('hotel_Tver_Sitara', 3, 304, 2),
('hotel_Tver_Sitara', 3, 305, 2),
('hotel_Tver_Sitara', 3, 306, 1),
('hotel_Tver_Sitara', 3, 307, 1),
('hotel_Tver_Sitara', 3, 308, 1),
('hotel_Tver_Sitara', 3, 309, 1),
('hotel_Tver_Sitara', 3, 310, 1);


 INSERT INTO hotel_model (hotel_model_name, floor_number, room_number, room_type_id) VALUES
('hotel_Tver_Terem', 1, 101, 2),
('hotel_Tver_Terem', 1, 102, 2),
('hotel_Tver_Terem', 1, 103, 2),
('hotel_Tver_Terem', 1, 104, 2),
('hotel_Tver_Terem', 1, 105, 2),
('hotel_Tver_Terem', 1, 106, 1),
('hotel_Tver_Terem', 1, 107, 1),
('hotel_Tver_Terem', 1, 108, 1),
('hotel_Tver_Terem', 1, 109, 1),
('hotel_Tver_Terem', 1, 110, 1),
('hotel_Tver_Terem', 2, 201, 2),
('hotel_Tver_Terem', 2, 202, 2),
('hotel_Tver_Terem', 2, 203, 2),
('hotel_Tver_Terem', 2, 204, 2),
('hotel_Tver_Terem', 2, 205, 2),
('hotel_Tver_Terem', 2, 206, 1),
('hotel_Tver_Terem', 2, 207, 1),
('hotel_Tver_Terem', 2, 208, 1),
('hotel_Tver_Terem', 2, 209, 1),
('hotel_Tver_Terem', 3, 301, 2),
('hotel_Tver_Terem', 3, 302, 2),
('hotel_Tver_Terem', 3, 303, 2),
('hotel_Tver_Terem', 3, 304, 2),
('hotel_Tver_Terem', 3, 305, 2),
('hotel_Tver_Terem', 3, 306, 1),
('hotel_Tver_Terem', 3, 307, 1),
('hotel_Tver_Terem', 3, 308, 1),
('hotel_Tver_Terem', 3, 309, 1),
('hotel_Tver_Terem', 3, 310, 1),
('hotel_Tver_Terem', 4, 301, 2),
('hotel_Tver_Terem', 4, 302, 2),
('hotel_Tver_Terem', 4, 303, 2),
('hotel_Tver_Terem', 4, 304, 2),
('hotel_Tver_Terem', 4, 305, 2),
('hotel_Tver_Terem', 4, 306, 1),
('hotel_Tver_Terem', 4, 307, 1),
('hotel_Tver_Terem', 4, 308, 1),
('hotel_Tver_Terem', 4, 309, 1),
('hotel_Tver_Terem', 4, 310, 1);


 INSERT INTO hotel_model (hotel_model_name, floor_number, room_number, room_type_id) VALUES
('hotel_Moscow_Ladomir', 1, 101, 2),
('hotel_Moscow_Ladomir', 1, 102, 2),
('hotel_Moscow_Ladomir', 1, 103, 2),
('hotel_Moscow_Ladomir', 1, 104, 2),
('hotel_Moscow_Ladomir', 1, 105, 2),
('hotel_Moscow_Ladomir', 1, 106, 1),
('hotel_Moscow_Ladomir', 1, 107, 1),
('hotel_Moscow_Ladomir', 1, 108, 1),
('hotel_Moscow_Ladomir', 1, 109, 1),
('hotel_Moscow_Ladomir', 1, 110, 1),
('hotel_Moscow_Ladomir', 1, 111, 1),
('hotel_Moscow_Ladomir', 2, 201, 2),
('hotel_Moscow_Ladomir', 2, 202, 2),
('hotel_Moscow_Ladomir', 2, 203, 2),
('hotel_Moscow_Ladomir', 2, 204, 2),
('hotel_Moscow_Ladomir', 2, 205, 2),
('hotel_Moscow_Ladomir', 2, 206, 1),
('hotel_Moscow_Ladomir', 2, 207, 1),
('hotel_Moscow_Ladomir', 2, 208, 1),
('hotel_Moscow_Ladomir', 2, 209, 1),
('hotel_Moscow_Ladomir', 3, 301, 2),
('hotel_Moscow_Ladomir', 3, 302, 2),
('hotel_Moscow_Ladomir', 3, 303, 2),
('hotel_Moscow_Ladomir', 3, 304, 2),
('hotel_Moscow_Ladomir', 3, 305, 2),
('hotel_Moscow_Ladomir', 3, 306, 1),
('hotel_Moscow_Ladomir', 3, 307, 1),
('hotel_Moscow_Ladomir', 3, 308, 1),
('hotel_Moscow_Ladomir', 3, 309, 1),
('hotel_Moscow_Ladomir', 3, 310, 1);


 INSERT INTO hotel_model (hotel_model_name, floor_number, room_number, room_type_id) VALUES
('hotel_Moscow_Zen', 1, 101, 2),
('hotel_Moscow_Zen', 1, 102, 2),
('hotel_Moscow_Zen', 1, 103, 2),
('hotel_Moscow_Zen', 1, 104, 2),
('hotel_Moscow_Zen', 1, 105, 2),
('hotel_Moscow_Zen', 1, 106, 1),
('hotel_Moscow_Zen', 1, 107, 1),
('hotel_Moscow_Zen', 1, 108, 1),
('hotel_Moscow_Zen', 1, 109, 1),
('hotel_Moscow_Zen', 1, 110, 1),
('hotel_Moscow_Zen', 2, 201, 2),
('hotel_Moscow_Zen', 2, 202, 2),
('hotel_Moscow_Zen', 2, 203, 2),
('hotel_Moscow_Zen', 2, 204, 2),
('hotel_Moscow_Zen', 2, 205, 2),
('hotel_Moscow_Zen', 2, 206, 1),
('hotel_Moscow_Zen', 2, 207, 1),
('hotel_Moscow_Zen', 2, 208, 1),
('hotel_Moscow_Zen', 2, 209, 1),
('hotel_Moscow_Zen', 3, 301, 2),
('hotel_Moscow_Zen', 3, 302, 2),
('hotel_Moscow_Zen', 3, 303, 2),
('hotel_Moscow_Zen', 3, 304, 2),
('hotel_Moscow_Zen', 3, 305, 2),
('hotel_Moscow_Zen', 3, 306, 1),
('hotel_Moscow_Zen', 3, 307, 1),
('hotel_Moscow_Zen', 3, 308, 1),
('hotel_Moscow_Zen', 3, 309, 1),
('hotel_Moscow_Zen', 3, 310, 1);

 USE tutu;
 
 DROP TABLE room_type;
 
    ALTER TABLE room_type RENAME TO hotel_room_type;


  CREATE TABLE room_type (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  square_meters INT UNSIGNED NOT NULL,
  facilities BOOL NOT NULL,
  bed_number INT UNSIGNED NOT NULL,
  bed_id INT UNSIGNED NOT NULL,
  furniture TEXT -- !!! json  стол, стулья, зеркало, вешалка, чайник, письменные принадлежности.
  );

 INSERT INTO room_type (square_meters, facilities, bed_number, bed_id, furniture) VALUES
(30, False, 1, 1, '{"table": "1", "chair": "2", "mirror": "1", "hanger": "1", "pot": "1", "cup": "2", "writing instruments": "1"}'),
(45, True, 1, 2, '{"table": "1", "chair": "3", "mirror": "1", "hanger": "2", "pot": "1", "cup": "3", "writing instruments": "1"}'),
(60, True, 2, 1, '{"table": "1", "chair": "3", "mirror": "1", "hanger": "3", "pot": "1", "cup": "4", "writing instruments": "1"}'),
(65,  True, 1, 3, '{"table": "1", "chair": "4", "mirror": "2", "hanger": "3", "pot": "1", "cup": "5", "writing instruments": "1"}');

SELECT * FROM room_type;

ALTER TABLE room_type MODIFY COLUMN furniture JSON;

USE vk;

SELECT * FROM media;

    ALTER TABLE bed RENAME TO hotel_bed;


   CREATE TABLE bed (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  bed_persons INT UNSIGNED NOT NULL,
  bed_name VARCHAR(255)
  );

INSERT INTO bed (bed_persons, bed_name) VALUES
(1, 'single'),
(2, 'double'),
(3, 'king size');

SELECT * FROM bed;

   CREATE TABLE hotel_price (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  hotel_id INT UNSIGNED NOT NULL,
  room_type_id INT UNSIGNED NOT NULL,
  base_price INT UNSIGNED NOT NULL
  );

 USE tutu
 
 INSERT INTO hotel_price (hotel_id, room_type_id, base_price) VALUES
(1, 1, 1500),
(1, 2, 1600),
(1, 3, 1700),
(1, 4, 1800),
(2, 1, 2500),
(2, 2, 2600),
(2, 3, 2700),
(2, 4, 2800),
(3, 1, 3500),
(3, 2, 3600),
(3, 3, 3700),
(3, 4, 3800),
(4, 1, 4500),
(4, 2, 4600),
(4, 3, 4700),
(4, 4, 4800),
(5, 1, 5500),
(5, 2, 5600),
(5, 3, 5700),
(5, 4, 5800);
 
SELECT * FROM hotel_price;

 DROP TABLE price_seasonalcoefficient;
 

    ALTER TABLE price_seasonalcoefficient RENAME TO hotel_price_seasonalcoefficient;


   CREATE TABLE price_seasonalcoefficient (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  room_type_id INT UNSIGNED NOT NULL,
  coefficient FLOAT NOT NULL,
  date_start DATE NOT NULL,
  date_end DATE NOT NULL
  );

  INSERT INTO price_seasonalcoefficient (room_type_id, coefficient, date_start, date_end) VALUES
(1, 0.7, '2020-10-01', '2021-05-01'),
(1, 1.1, '2020-05-01', '2020-09-30'),
(2, 0.8, '2020-10-01', '2021-05-01'),
(2, 1.2, '2020-05-01', '2020-09-30'),
(3, 0.9, '2020-10-01', '2021-05-01'),
(3, 1.3, '2020-05-01', '2020-09-30'),
(4, 0.5, '2020-10-01', '2021-05-01'),
(4, 1.1, '2020-05-01', '2020-09-30');
 
SELECT * from price_seasonalcoefficient; 

-- отель - ссылки на фото. расстояние от центра, от метро. город. звезды. название.
-- номера, удобства. адрес. wifi, трансфер, подходит для детей. Ресторан, конференц-зал.
-- кондиционер. Можно ли курить. координаты отеля.
-- номера: этаж, количество комнат, удобства.
-- Ссылка на tripadvisor. 
-- отзывы (дата + текст), оценка.





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
 
 INSERT INTO stations_base (station_name, distance) VALUES
('Moskva Yaroslavskaya', 0),
('Moskva-3', 2100),
('Malenkovskaya', 3600),
('Yauza', 5100),
('Severyanin', 6900),
('Losinoostrovskaya', 8900),
('Los', 10700),
('Perlovskaya', 12200),
('Taininskaya', 14000),
('Mjtishi', 16000),
('Stroitel', 17500),
('Chelyuskinskaya', 19500),
('Tarasovskaya', 21300),
('Klyazma', 22800),
('Mamontovskaya', 24900),
('Pushkino', 26700),
('Zavetj Ilicha', 28500),
('Pravda', 30500),
('Zelenogradskaya', 32000),
('43km', 34000),
('Sofrino', 35800),
('Ashukinskaya', 37800),
('Kalistovo', 39300),
('Radonezh', 41400),
('Abramcevo', 43200),
('Hotkovo', 45000),
('Semhoz', 47000),
('Sergiev Pasad', 49100);
 
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


 
 INSERT INTO train_time (stations_line_name, train_name, express_flag, date_time_arrive, stop_time, station_id, platform_way_id) VALUES
('Sergiev Posad', 'EL542', 0, '2011-02-12 08:25:00', '00:01:00', 1, 1),
('Sergiev Posad', 'EL542', 0, '2011-02-12 08:28:00', '00:01:00', 2, 3),
('Sergiev Posad', 'EL542', 0, '2011-02-12 08:33:00', '00:01:00', 3, 5),
('Sergiev Posad', 'EL542', 0, '2011-02-12 08:37:00', '00:02:00', 4, 7),
('Sergiev Posad', 'EL542', 0, '2011-02-12 08:42:00', '00:03:00', 5, 9),
('Sergiev Posad', 'EL542', 0, '2011-02-12 08:50:00', '00:01:00', 6, 11),
('Sergiev Posad', 'EL542', 0, '2011-02-12 08:54:00', '00:01:00', 7, 13),
('Sergiev Posad', 'EL542', 0, '2011-02-12 08:58:00', '00:01:00', 8, 15),
('Sergiev Posad', 'EL542', 0, '2011-02-12 09:02:00', '00:01:00', 9, 19),
('Sergiev Posad', 'EL542', 0, '2011-02-12 09:04:00', '00:02:00', 10, 21),
('Sergiev Posad', 'EL542', 0, '2011-02-12 09:10:00', '00:01:00', 11, 25),
('Sergiev Posad', 'EL542', 0, '2011-02-12 09:13:00', '00:01:00', 12, 27),
('Sergiev Posad', 'EL542', 0, '2011-02-12 09:17:00', '00:01:00', 13, 29),
('Sergiev Posad', 'EL542', 0, '2011-02-12 09:20:00', '00:02:00', 14, 31),
('Sergiev Posad', 'EL542', 0, '2011-02-12 09:25:00', '00:02:00', 15, 33),
('Sergiev Posad', 'EL542', 0, '2011-02-12 09:30:00', '00:01:00', 16, 35),
('Sergiev Posad', 'EL542', 0, '2011-02-12 09:33:00', '00:01:00', 17, 39),
('Sergiev Posad', 'EL542', 0, '2011-02-12 09:37:00', '00:01:00', 18, 41),
('Sergiev Posad', 'EL542', 0, '2011-02-12 09:41:00', '00:01:00', 19, 43),
('Sergiev Posad', 'EL542', 0, '2011-02-12 09:44:00', '00:02:00', 20, 45),
('Sergiev Posad', 'EL542', 0, '2011-02-12 09:47:00', '00:01:00', 21, 49),
('Sergiev Posad', 'EL542', 0, '2011-02-12 09:50:00', '00:05:00', 22, 51),
('Sergiev Posad', 'EL542', 0, '2011-02-12 09:58:00', '00:01:00', 23, 53),
('Sergiev Posad', 'EL542', 0, '2011-02-12 10:01:00', '00:01:00', 24, 55),
('Sergiev Posad', 'EL542', 0, '2011-02-12 10:04:00', '00:02:00', 25, 57),
('Sergiev Posad', 'EL542', 0, '2011-02-12 10:08:00', '00:01:00', 26, 61),
('Sergiev Posad', 'EL542', 0, '2011-02-12 10:10:00', '00:01:00', 27, 63),
('Sergiev Posad', 'EL542', 0, '2011-02-12 10:15:00', '00:20:00', 28, 65);
 

SELECT * FROM train_time;

 INSERT INTO train_time (stations_line_name, train_name, express_flag, date_time_arrive, stop_time, station_id, platform_way_id) VALUES
('Sergiev Posad', 'EL545', 0, '2011-02-12 11:25:00', '00:01:00', 1, 1),
('Sergiev Posad', 'EL545', 0, '2011-02-12 11:28:00', '00:01:00', 2, 3),
('Sergiev Posad', 'EL545', 0, '2011-02-12 11:33:00', '00:01:00', 3, 5),
('Sergiev Posad', 'EL545', 0, '2011-02-12 11:37:00', '00:02:00', 4, 7),
('Sergiev Posad', 'EL545', 0, '2011-02-12 11:42:00', '00:03:00', 5, 9),
('Sergiev Posad', 'EL545', 0, '2011-02-12 11:50:00', '00:01:00', 6, 11),
('Sergiev Posad', 'EL545', 0, '2011-02-12 11:54:00', '00:01:00', 7, 13),
('Sergiev Posad', 'EL545', 0, '2011-02-12 11:58:00', '00:01:00', 8, 15),
('Sergiev Posad', 'EL545', 0, '2011-02-12 12:02:00', '00:01:00', 9, 19),
('Sergiev Posad', 'EL545', 0, '2011-02-12 12:04:00', '00:02:00', 10, 21),
('Sergiev Posad', 'EL545', 0, '2011-02-12 12:10:00', '00:01:00', 11, 25),
('Sergiev Posad', 'EL545', 0, '2011-02-12 12:13:00', '00:01:00', 12, 27),
('Sergiev Posad', 'EL545', 0, '2011-02-12 12:17:00', '00:01:00', 13, 29),
('Sergiev Posad', 'EL545', 0, '2011-02-12 12:20:00', '00:02:00', 14, 31),
('Sergiev Posad', 'EL545', 0, '2011-02-12 12:25:00', '00:02:00', 15, 33), -- !!!
('Sergiev Posad', 'EL545', 0, '2011-02-12 12:30:00', '00:01:00', 16, 35),
('Sergiev Posad', 'EL545', 0, '2011-02-12 12:33:00', '00:01:00', 17, 39),
('Sergiev Posad', 'EL545', 0, '2011-02-12 12:37:00', '00:01:00', 18, 41),
('Sergiev Posad', 'EL545', 0, '2011-02-12 12:41:00', '00:01:00', 19, 43),
('Sergiev Posad', 'EL545', 0, '2011-02-12 12:44:00', '00:02:00', 20, 45),
('Sergiev Posad', 'EL545', 0, '2011-02-12 12:47:00', '00:01:00', 21, 49),
('Sergiev Posad', 'EL545', 0, '2011-02-12 12:50:00', '00:05:00', 22, 51),
('Sergiev Posad', 'EL545', 0, '2011-02-12 12:58:00', '00:01:00', 23, 53),
('Sergiev Posad', 'EL545', 0, '2011-02-12 13:01:00', '00:01:00', 24, 55),
('Sergiev Posad', 'EL545', 0, '2011-02-12 13:04:00', '00:02:00', 25, 57),
('Sergiev Posad', 'EL545', 0, '2011-02-12 13:08:00', '00:01:00', 26, 61),
('Sergiev Posad', 'EL545', 0, '2011-02-12 13:10:00', '00:01:00', 27, 63),
('Sergiev Posad', 'EL545', 0, '2011-02-12 13:15:00', '00:20:00', 28, 65);


 INSERT INTO train_time (stations_line_name, train_name, express_flag, date_time_arrive, stop_time, station_id, platform_way_id) VALUES
('Sergiev Posad', 'EKS001', 1, '2011-02-12 12:25:00', '00:01:00', 1, 1),
('Sergiev Posad', 'EKS001', 1, '2011-02-12 12:28:00', '00:01:00', 2, 3),
('Sergiev Posad', 'EKS001', 1, '2011-02-12 12:33:00', '00:01:00', 3, 5),
('Sergiev Posad', 'EKS001', 1, '2011-02-12 12:37:00', '00:02:00', 4, 7),
('Sergiev Posad', 'EKS001', 1, '2011-02-12 12:42:00', '00:03:00', 5, 9),
('Sergiev Posad', 'EKS001', 1, '2011-02-12 12:50:00', '00:01:00', 6, 11),
('Sergiev Posad', 'EKS001', 1, '2011-02-12 12:54:00', '00:01:00', 7, 13),
('Sergiev Posad', 'EKS001', 1, '2011-02-12 12:58:00', '00:01:00', 8, 15),
('Sergiev Posad', 'EKS001', 1, '2011-02-12 13:02:00', '00:01:00', 9, 19),
('Sergiev Posad', 'EKS001', 1, '2011-02-12 13:25:00', '00:02:00', 20, 45),
('Sergiev Posad', 'EKS001', 1, '2011-02-12 13:29:00', '00:01:00', 21, 49),
('Sergiev Posad', 'EKS001', 1, '2011-02-12 13:33:00', '00:05:00', 22, 51),
('Sergiev Posad', 'EKS001', 1, '2011-02-12 13:40:00', '00:01:00', 23, 53),
('Sergiev Posad', 'EKS001', 1, '2011-02-12 13:43:00', '00:01:00', 24, 55),
('Sergiev Posad', 'EKS001', 1, '2011-02-12 13:45:00', '00:02:00', 25, 57),
('Sergiev Posad', 'EKS001', 1, '2011-02-12 13:50:00', '00:01:00', 26, 61),
('Sergiev Posad', 'EKS001', 1, '2011-02-12 13:54:00', '00:01:00', 27, 63),
('Sergiev Posad', 'EKS001', 1, '2011-02-12 14:00:00', '00:20:00', 28, 65);


 INSERT INTO train_time (stations_line_name, train_name, express_flag, date_time_arrive, stop_time, station_id, platform_way_id) VALUES
('Sergiev Posad', 'EKS002', 1, '2011-02-12 14:25:00', '00:01:00', 1, 1),
('Sergiev Posad', 'EKS002', 1, '2011-02-12 14:28:00', '00:01:00', 2, 3),
('Sergiev Posad', 'EKS002', 1, '2011-02-12 14:33:00', '00:01:00', 3, 5),
('Sergiev Posad', 'EKS002', 1, '2011-02-12 14:37:00', '00:02:00', 4, 7),
('Sergiev Posad', 'EKS002', 1, '2011-02-12 14:42:00', '00:03:00', 5, 9),
('Sergiev Posad', 'EKS002', 1, '2011-02-12 14:50:00', '00:01:00', 6, 11),
('Sergiev Posad', 'EKS002', 1, '2011-02-12 14:54:00', '00:01:00', 7, 13),
('Sergiev Posad', 'EKS002', 1, '2011-02-12 14:58:00', '00:01:00', 8, 15),
('Sergiev Posad', 'EKS002', 1, '2011-02-12 15:02:00', '00:01:00', 9, 19),
('Sergiev Posad', 'EKS002', 1, '2011-02-12 15:40:00', '00:02:00', 25, 57),
('Sergiev Posad', 'EKS002', 1, '2011-02-12 15:44:00', '00:01:00', 26, 61),
('Sergiev Posad', 'EKS002', 1, '2011-02-12 15:47:00', '00:01:00', 27, 63),
('Sergiev Posad', 'EKS002', 1, '2011-02-12 15:50:00', '00:20:00', 28, 65);


 INSERT INTO train_time (stations_line_name, train_name, express_flag, date_time_arrive, stop_time, station_id, platform_way_id) VALUES
('Sergiev Posad', 'EL742', 0, '2011-02-12 17:25:00', '00:01:00', 1, 1),
('Sergiev Posad', 'EL742', 0, '2011-02-12 17:28:00', '00:01:00', 2, 3),
('Sergiev Posad', 'EL742', 0, '2011-02-12 17:33:00', '00:01:00', 3, 5),
('Sergiev Posad', 'EL742', 0, '2011-02-12 17:37:00', '00:02:00', 4, 7),
('Sergiev Posad', 'EL742', 0, '2011-02-12 17:42:00', '00:03:00', 5, 9),
('Sergiev Posad', 'EL742', 0, '2011-02-12 17:50:00', '00:01:00', 6, 11),
('Sergiev Posad', 'EL742', 0, '2011-02-12 17:54:00', '00:01:00', 7, 13),
('Sergiev Posad', 'EL742', 0, '2011-02-12 17:58:00', '00:01:00', 8, 15),
('Sergiev Posad', 'EL742', 0, '2011-02-12 18:02:00', '00:01:00', 9, 19),
('Sergiev Posad', 'EL742', 0, '2011-02-12 18:04:00', '00:02:00', 10, 21),
('Sergiev Posad', 'EL742', 0, '2011-02-12 18:10:00', '00:01:00', 11, 25),
('Sergiev Posad', 'EL742', 0, '2011-02-12 18:13:00', '00:01:00', 12, 27),
('Sergiev Posad', 'EL742', 0, '2011-02-12 18:17:00', '00:01:00', 13, 29),
('Sergiev Posad', 'EL742', 0, '2011-02-12 18:20:00', '00:02:00', 14, 31),
('Sergiev Posad', 'EL742', 0, '2011-02-12 18:25:00', '00:02:00', 15, 33),
('Sergiev Posad', 'EL742', 0, '2011-02-12 18:30:00', '00:01:00', 16, 35),
('Sergiev Posad', 'EL742', 0, '2011-02-12 18:33:00', '00:01:00', 17, 39),
('Sergiev Posad', 'EL742', 0, '2011-02-12 18:37:00', '00:01:00', 18, 41),
('Sergiev Posad', 'EL742', 0, '2011-02-12 18:41:00', '00:01:00', 19, 43),
('Sergiev Posad', 'EL742', 0, '2011-02-12 18:44:00', '00:02:00', 20, 45),
('Sergiev Posad', 'EL742', 0, '2011-02-12 18:47:00', '00:01:00', 21, 49),
('Sergiev Posad', 'EL742', 0, '2011-02-12 18:50:00', '00:05:00', 22, 51),
('Sergiev Posad', 'EL742', 0, '2011-02-12 18:58:00', '00:01:00', 23, 53),
('Sergiev Posad', 'EL742', 0, '2011-02-12 19:01:00', '00:01:00', 24, 55),
('Sergiev Posad', 'EL742', 0, '2011-02-12 19:04:00', '00:02:00', 25, 57),
('Sergiev Posad', 'EL742', 0, '2011-02-12 19:08:00', '00:01:00', 26, 61),
('Sergiev Posad', 'EL742', 0, '2011-02-12 19:10:00', '00:01:00', 27, 63),
('Sergiev Posad', 'EL742', 0, '2011-02-12 19:15:00', '00:20:00', 28, 65);



ALTER TABLE train_time CHANGE date_time_stop time_stop TIME;

 SELECT * FROM train_time order by date_time_arrive;
 
 SELECT * FROM train;

-- DESCRIBE except_stations;
 
-- INSERT INTO except_stations (station_id) VALUES
-- (5),
-- (6),
-- (7),
-- (8),
-- (9);
 
-- SELECT * FROM except_stations;

-- DESCRIBE except_stations_train_time;

-- INSERT INTO except_stations_train_time (except_stations_id, train_time_id) VALUES
-- (1, 3),
-- (2, 3),
-- (3, 3),
-- (4, 3),
-- (5, 3),
-- (1, 4),
-- (2, 4),
-- (3, 4),
-- (4, 4),
-- (5, 4);

-- SELECT * FROM except_stations_train_time;

DESCRIBE train;

DROP TABLE train;

TRUNCATE TABLE train; 

INSERT INTO train (train_name, train_time_id, car_number, car_id) VALUES
('EL542', 1, 1, 1),
('EL542', 1, 2, 1),
('EL542', 1, 3, 1),

('EL545', 2, 1, 1),
('EL545', 2, 2, 1),

('EKS001', 3, 1, 2),
('EKS001', 3, 2, 2),
('EKS001', 3, 3, 2),

('EKS002', 4, 1, 2),
('EKS002', 4, 2, 2),
('EKS002', 4, 3, 2),

('EL742', 5, 1, 1),
('EL742', 5, 2, 1),
('EL742', 5, 3, 1);

SELECT * FROM tr_train;

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

SHOW TABLES;




ALTER TABLE tr_stations_line 
  ADD CONSTRAINT tr_stations_line_railway_id_fk 
    FOREIGN KEY (railway_id) REFERENCES tr_railways(id),
  ADD CONSTRAINT tr_stations_line_station_id_fk
    FOREIGN KEY (station_id) REFERENCES tr_stations_base(id);


ALTER TABLE tr_train_time 
  ADD CONSTRAINT tr_train_time_station_id_fk 
    FOREIGN KEY (station_id) REFERENCES tr_stations_base(id),
  ADD CONSTRAINT tr_train_time_platform_way_id_fk 
    FOREIGN KEY (platform_way_id) REFERENCES tr_platform_way(id);
   
ALTER TABLE tr_train_time 
  ADD CONSTRAINT tr_train_time_train_name_fk 
    FOREIGN KEY (train_name) REFERENCES tr_train(train_name),
  ADD CONSTRAINT tr_train_stations_line_name_fk 
    FOREIGN KEY (stations_line_name) REFERENCES tr_stations_line(line_name);
   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   
   ALTER TABLE tr_stations_line 
  ADD CONSTRAINT tr_stations_line_railway_id_fk 
    FOREIGN KEY (railway_id) REFERENCES tr_railways(id),
  ADD CONSTRAINT tr_stations_line_station_id_fk
    FOREIGN KEY (station_id) REFERENCES tr_stations_base(id);
   
   ALTER TABLE tr_stations_line 
  ADD CONSTRAINT tr_stations_line_railway_id_fk 
    FOREIGN KEY (railway_id) REFERENCES tr_railways(id),
  ADD CONSTRAINT tr_stations_line_station_id_fk
    FOREIGN KEY (station_id) REFERENCES tr_stations_base(id);
    
   ALTER TABLE tr_stations_line 
  ADD CONSTRAINT tr_stations_line_railway_id_fk 
    FOREIGN KEY (railway_id) REFERENCES tr_railways(id),
  ADD CONSTRAINT tr_stations_line_station_id_fk
    FOREIGN KEY (station_id) REFERENCES tr_stations_base(id);
    
   
   ALTER TABLE tr_stations_line 
  ADD CONSTRAINT tr_stations_line_railway_id_fk 
    FOREIGN KEY (railway_id) REFERENCES tr_railways(id),
  ADD CONSTRAINT tr_stations_line_station_id_fk
    FOREIGN KEY (station_id) REFERENCES tr_stations_base(id);