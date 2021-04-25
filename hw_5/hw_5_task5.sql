
-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.
SELECT
	DAYNAME(CONCAT(YEAR(NOW()), RIGHT(birthday, 6))) AS day_name,
	COUNT(*) as count
FROM
	`profiles`
GROUP BY
	day_name