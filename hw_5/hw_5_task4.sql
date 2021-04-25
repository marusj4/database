-- *** 1. Подсчитайте средний возраст пользователей в таблице profiles. ***
SELECT 
	FLOOR(AVG((TO_DAYS(NOW()) - TO_DAYS(birthday)) / 365.25)) AS average_age 
FROM
	`profiles`;

