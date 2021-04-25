ALTER TABLE `vk`.`profiles` 
ADD COLUMN `is_active` INT UNSIGNED NOT NULL DEFAULT 1 AFTER `hometown`;
