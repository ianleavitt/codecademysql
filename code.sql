/* This is a code depository /*

SELECT *
FROM survey
LIMIT 10;

SELECT question,
COUNT(DISTINCT user_id)
FROM survey
GROUP BY 1;

SELECT * 
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;

SELECT q.user_id,
	h.user_id IS NOT NULL AS 'is_home_try_on',
  h.number_of_pairs,
  p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz q
LEFT JOIN home_try_on h
	ON q.user_id = h.user_id
LEFT JOIN purchase p
	ON p.user_id = q.user_id
  LIMIT 10;

WITH quiz_results AS(
SELECT q.user_id,
	h.user_id IS NOT NULL AS 'is_home_try_on',
  h.number_of_pairs,
  p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz q
LEFT JOIN home_try_on h
	ON q.user_id = h.user_id
LEFT JOIN purchase p
	ON p.user_id = q.user_id
  )
  
  SELECT COUNT(*) AS 'num_browse',
  SUM(is_home_try_on) AS 'num_try_on',
  SUM(is_purchase) AS 'num_purchase',
  1.0 * SUM(is_home_try_on) / COUNT(user_id),
  1.0 * SUM(is_purchase) / SUM(is_home_try_on)
  FROM quiz_results;
  
