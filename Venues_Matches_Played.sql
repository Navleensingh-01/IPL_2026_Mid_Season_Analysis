--How many teams played at the each venue ? 

SELECT
  venue,
  ROUND(AVG(first_ings_score), 2) AS avg_first_innings_score,
  ROUND(AVG(second_ings_score), 2) AS avg_second_innings_score,
  COUNT(*) AS matches_played
FROM `IPL_2026.Clean_Matches`
GROUP BY venue
ORDER BY avg_first_innings_score DESC;