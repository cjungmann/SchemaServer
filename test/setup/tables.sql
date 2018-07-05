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

