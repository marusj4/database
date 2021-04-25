-- В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
-- Допустимо присутствие обоих полей или одно из них. 
-- Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
-- Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
-- При попытке присвоить полям NULL-значение необходимо отменить операцию.

DROP TRIGGER IF EXISTS `shop`.`products_BEFORE_INSERT`;

DELIMITER $$
USE `shop`$$

CREATE DEFINER =`root`@`localhost` TRIGGER `products_BEFORE_INSERT`
    BEFORE INSERT
    ON `products`
    FOR EACH ROW
BEGIN
    IF LENGTH(IFNULL(NEW.`description`, '')) + LENGTH(IFNULL(NEW.`name`, '')) = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Поля description или name должны быть не пусты';
    END IF;
END$$
DELIMITER ;

-- trigger for updates
DROP TRIGGER IF EXISTS `shop`.`products_BEFORE_UPDATE`;

DELIMITER $$
USE `shop`$$
CREATE DEFINER =`root`@`localhost` TRIGGER `products_BEFORE_UPDATE`
    BEFORE UPDATE
    ON `products`
    FOR EACH ROW
BEGIN
    IF LENGTH(IFNULL(NEW.`description`, '')) + LENGTH(IFNULL(NEW.`name`, '')) = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Поля description или name должны быть не пусты';
    END IF;
END$$
DELIMITER ;