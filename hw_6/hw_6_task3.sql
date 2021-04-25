-- Определить кто больше поставил лайков (всего): мужчины или женщины.

SELECT
    userlike_gender.gender,
    COUNT(userlike_gender.gender)
FROM
    (SELECT 
        user_id,
        (SELECT
            gender
         FROM
            profiles
         WHERE
            user_id = likes.user_id) AS gender
    FROM 
        likes) AS userlike_gender
GROUP BY
    gender;