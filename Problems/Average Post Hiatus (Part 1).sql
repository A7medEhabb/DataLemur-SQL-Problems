SELECT 
    user_id,
    DATE_PART('DAY',MAX(post_date) - MIN(post_date)) as days_between
FROM posts
WHERE DATE_PART('year', post_date) =2021
GROUP BY user_id
HAVING COUNT(*) >= 2

