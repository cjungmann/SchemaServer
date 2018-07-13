USE SchemaServer_Test;

SET default_storage_engine=InnoDB;

CREATE TABLE IF NOT EXISTS Person
(
   id        INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   fname     VARCHAR(20),
   lname     VARCHAR(80),
   dob       DATE,
   gender    ENUM('male', 'female', 'other')
);

CREATE TABLE IF NOT EXISTS Residence
(
   id        INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   address   VARCHAR(80),
   city      VARCHAR(40),
   state     CHAR(2)
);
