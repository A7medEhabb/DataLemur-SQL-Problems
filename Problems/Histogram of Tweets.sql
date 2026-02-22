WITH tweets_per_user AS(
  SELECT user_id, COUNT(tweet_id) AS tweet_bucket
  FROM tweets
  WHERE date_part('YEAR', tweet_date) = 2022
  GROUP BY user_id
)
SELECT 
  tweet_bucket,
  COUNT(*) AS user_num
FROM tweets_per_user
GROUP BY tweet_bucket
