DELIMITER $$


DROP PROCEDURE IF EXISTS ssys_test_ssys_session_procedures $$

CREATE PROCEDURE ssys_test_ssys_session_procedures()
BEGIN
   DECLARE session_id INT UNSIGNED;
   DECLARE session_hash CHAR(32);

   SET session_hash = 'abcdefghijklmnopqrstuvwxyz012345';

   SELECT 'Calling ssys_seed_session_string() to prepare for test' AS '';
   CALL ssys_seed_session_string(session_hash);

   SELECT 'About to call ssys_session_create() to test App_Session_Start() override' AS '';
   SET session_id = ssys_session_create();

   SELECT 'About to call App_Session_Restore() to test validity.' AS '';
   CALL App_Session_Restore(session_id);

   SELECT 'About to call App_Session_Abandon() to test validity.' AS '';
   CALL App_Session_Abandon(session_id);
END $$

CALL ssys_test_ssys_session_procedures();

DROP PROCEDURE IF EXISTS ssys_test_ssys_session_procedures $$

DELIMITER ;
