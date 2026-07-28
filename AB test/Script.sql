-- join user + events table
--filter for a specific timeframe(14 days)
--aggregate the data to the user level(one row - one user)
--calculate the necessary columns: user_id,variant_group, total_revenue, total_sessions,
-- and binary is_active flag (1 if the had > 0 sessions and, 0 otherwise)

SELECT u.user_id, 
	u.variant_group,
	SUM(e.revenue_generated ) AS total_revenue, 
	COUNT(e.event_date ) AS total_sessions,
	CASE
		WHEN COUNT(e.event_date) > 0 THEN 1
		ELSE 0
	END AS is_active	
FROM users AS u
LEFT JOIN events e ON u.user_id = e.user_id 
	AND e.event_date BETWEEN '2020-05-09' AND '2021-05-09' 
GROUP BY u.user_id, u.variant_group;