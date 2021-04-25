-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
-- в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
-- с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", 
-- с 00:00 до 6:00 — "Доброй ночи".

DROP PROCEDURE IF EXISTS hello;

DELIMITER //
CREATE PROCEDURE hello()
BEGIN
    DECLARE currenttime TIME;
    DECLARE message VARCHAR(50);

    SET currenttime = TIME(NOW());

    CASE
        WHEN currenttime BETWEEN '06:00' AND '12:00' THEN SELECT "Доброе утро" INTO message;
        WHEN currenttime BETWEEN '12:00' AND '18:00' THEN SELECT "Добрый день" INTO message;
        WHEN currenttime BETWEEN '18:00' AND '23:59' THEN SELECT "Добрый вечер" INTO message;
        ELSE SELECT "Доброй ночи" INTO message;
	END CASE;

    SELECT message;
END//
DELIMITER ;

CALL hello();