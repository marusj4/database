-- Подсчитать общее количество лайков, которые получили пользователи младше 10 лет

SELECT
    SUM(IFNULL(likes_sum, 0)) AS sum_of_likes
FROM 
(SELECT 
    user_id,
    (SELECT 
        SUM(media_likes.cnt)
     FROM
           (SELECT
            id,
            (SELECT COUNT(*) FROM likes WHERE likes.media_id = media.id) AS cnt
             FROM media
             WHERE
             user_id = profiles.user_id
            ) AS media_likes
    ) AS likes_sum
   
FROM 
    profiles
WHERE
    TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10
) AS result;