UPDATE `vk`.`profiles`
SET
`is_active` = 0
WHERE YEAR(CURRENT_TIMESTAMP) - YEAR(birthday) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(birthday, 5)) < 18;


select * from profiles;