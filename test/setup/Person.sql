USE SchemaServer_Test;
DELIMITER $$

-- ----------------------------------------
DROP PROCEDURE IF EXISTS App_Person_List $$
CREATE PROCEDURE App_Person_List(id INT UNSIGNED)
BEGIN
SELECT t.id,
       t.fname,
       t.lname,
       t.dob,
       t.gender
  FROM Person t
 WHERE (id IS NULL OR t.id=id);
END  $$


-- ---------------------------------------
DROP PROCEDURE IF EXISTS App_Person_Add $$
CREATE PROCEDURE App_Person_Add(fname VARCHAR(20),
                                lname VARCHAR(80),
                                dob DATE,
                                gender VARCHAR(6))
BEGIN
  DECLARE newid INT UNSIGNED;

  INSERT INTO Person
       (fname, 
        lname, 
        dob, 
        gender)
VALUES (fname, 
        lname, 
        dob, 
        gender);

  IF ROW_COUNT() > 0 THEN
     SET newid = LAST_INSERT_ID();
     CALL App_Person_List(newid);
  END IF;
END  $$


-- ----------------------------------------
DROP PROCEDURE IF EXISTS App_Person_Read $$
CREATE PROCEDURE App_Person_Read(id INT UNSIGNED)
BEGIN
SELECT t.id,
       t.fname,
       t.lname,
       t.dob,
       t.gender
  FROM Person t
 WHERE (id IS NULL OR t.id=id);
END  $$


-- -----------------------------------------
DROP PROCEDURE IF EXISTS App_Person_Value $$
CREATE PROCEDURE App_Person_Value(id INT UNSIGNED)
BEGIN
SELECT id,
       fname,
       lname,
       dob,
       gender
  FROM Person t
 WHERE t.id = id;
END $$


-- ------------------------------------------
DROP PROCEDURE IF EXISTS App_Person_Update $$
CREATE PROCEDURE App_Person_Update(id INT UNSIGNED,
                                   fname VARCHAR(20),
                                   lname VARCHAR(80),
                                   dob DATE,
                                   gender VARCHAR(6))
BEGIN
  UPDATE Person t
   SET t.fname = fname,
       t.lname = lname,
       t.dob = dob,
       t.gender = gender
 WHERE t.id = id;

  IF ROW_COUNT() > 0 THEN
     CALL App_Person_List(id);
  END IF;
END $$



-- ------------------------------------------
DROP PROCEDURE IF EXISTS App_Person_Delete $$
CREATE PROCEDURE App_Person_Delete(id INT UNSIGNED)
BEGIN
  DELETE
    FROM t USING Person AS t
 WHERE t.id = id;

  SELECT ROW_COUNT() AS deleted;
END  $$

DELIMITER ;
