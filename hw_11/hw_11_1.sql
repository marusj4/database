-- Создайте таблицу logs типа Archive. 
-- Пусть при каждом создании записи в таблицах users, 
-- catalogs и products в таблицу logs помещается время и дата создания записи, 
-- название таблицы, идентификатор первичного ключа и содержимое поля name.

DROP TABLE IF EXISTS `shop`.`logs`;

CREATE TABLE `shop`.`logs`
(
    `id`                 INT         NOT NULL AUTO_INCREMENT,
    `write_at`           DATETIME    NOT NULL,
    `table_name`         VARCHAR(45) NOT NULL,
    `update_primary_key` VARCHAR(45) NULL,
    `update_name`        VARCHAR(45) NULL,
    PRIMARY KEY (`id`)
)
ENGINE = ARCHIVE;


DROP TRIGGER IF EXISTS `shop`.`users_AFTER_INSERT`;

DELIMITER //
USE `shop`//
CREATE DEFINER = CURRENT_USER TRIGGER `shop`.`users_AFTER_INSERT`
    AFTER INSERT
    ON `users`
    FOR EACH ROW
BEGIN
    INSERT INTO `shop`.`logs`
        (`write_at`, `table_name`, `update_primary_key`, `update_name`)
        VALUE (NOW(), 'users', NEW.`id`, NEW.`name`);
END//
DELIMITER ;

DROP TRIGGER IF EXISTS `shop`.`catalogs_AFTER_INSERT`;

DELIMITER //
USE `shop`//
CREATE DEFINER = CURRENT_USER TRIGGER `shop`.`catalogs_AFTER_INSERT`
    AFTER INSERT
    ON `catalogs`
    FOR EACH ROW
BEGIN
    INSERT INTO `shop`.`logs`
        (`write_at`, `table_name`, `update_primary_key`, `update_name`)
        VALUE (NOW(), 'catalogs', NEW.`id`, NEW.`name`);
END//
DELIMITER ;

DROP TRIGGER IF EXISTS `shop`.`products_AFTER_INSERT`;


DELIMITER //
USE `shop`//
CREATE DEFINER = CURRENT_USER TRIGGER `shop`.`products_AFTER_INSERT`
    AFTER INSERT
    ON `products`
    FOR EACH ROW
BEGIN
    INSERT INTO `shop`.`logs`
        (`write_at`, `table_name`, `update_primary_key`, `update_name`)
        VALUE (NOW(), 'products', NEW.`id`, NEW.`name`);
END//
DELIMITER ;