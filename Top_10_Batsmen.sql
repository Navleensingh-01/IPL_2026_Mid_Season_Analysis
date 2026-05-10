--Top 10 Batsmen. 

SELECT
  striker AS batsman,
  batting_team AS team,
  SUM(runs_of_bat) AS total_runs,
  SUM(is_four) AS fours,
  SUM(is_six) AS sixes,
  SUM(legal_ball) AS balls_faced,
  ROUND(SUM(runs_of_bat) * 100 / NULLIF(SUM(legal_ball), 0), 2) AS strike_rate
FROM `IPL_2026.Clean_deliveries`
GROUP BY striker, batting_team
ORDER BY total_runs DESC
LIMIT 10;