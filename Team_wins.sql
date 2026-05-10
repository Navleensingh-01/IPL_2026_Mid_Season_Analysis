-- How many matches a single team wins ?

SELECT
  match_winner AS team,
  COUNT(*) AS total_wins
FROM `IPL_2026.Clean_Matches`
WHERE match_winner IS NOT NULL
GROUP BY match_winner
ORDER BY total_wins DESC;