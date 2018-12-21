DROP DATABASE IF EXISTS openTableReservations;

CREATE DATABASE openTableReservations;

USE openTableReservations;

/* Create other tables and define schemas for them here! */

CREATE TABLE restaurants (
  id int NOT NULL AUTO_INCREMENT,
  restaurantName varchar(40),
  PRIMARY KEY (id)
);

CREATE TABLE reservations (
  id int NOT NULL AUTO_INCREMENT,
  restaurantID int NOT NULL,
  dateToReserve int(6) UNSIGNED ZEROFILL NOT NULL,
  timeToReserve int(4) UNSIGNED ZEROFILL NOT NULL,
  partySize int(2) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (restaurantID) REFERENCES restaurants(id)
);

INSERT INTO restaurants (restaurantName) VALUES ('The Saratoga');
INSERT INTO reservations (restaurantID, dateToReserve, timeToReserve, partySize) VALUES (1, 021319, 1530, 4);
INSERT INTO reservations (restaurantID, dateToReserve, timeToReserve, partySize) VALUES (1, 021319, 1230, 2);

/*  Execute this file from the command line by typing:
 *    mysql -u root -p < server/schema.sql
 *  to create the database and the tables.*/

