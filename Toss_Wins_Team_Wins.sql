--Matches wins by the teams when they won the toss.

SELECT
  COUNT(*) AS total_completed_matches,
  SUM(CASE WHEN toss_winner = match_winner THEN 1 ELSE 0 END) AS toss_winner_won,
  ROUND(
    SUM(CASE WHEN toss_winner = match_winner THEN 1 ELSE 0 END) * 100 / COUNT(*),
    2
  ) AS toss_win_match_win_percentage
FROM `IPL_2026.Clean_Matches`
WHERE match_result = 'completed';