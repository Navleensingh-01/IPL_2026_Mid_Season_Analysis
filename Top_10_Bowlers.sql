--Top 10 Bowler. 

SELECT
  bowler,
  bowling_team AS team,
  SUM(
    CASE 
      WHEN wicket_type IS NOT NULL
      AND wicket_type NOT IN ('run out', 'retired hurt', 'retired out')
      THEN 1 ELSE 0
    END
  ) AS wickets,
  SUM(CASE WHEN runs_of_bat = 0 AND extras = 0 THEN 1 ELSE 0 END) AS dot_balls,
  ROUND(SUM(total_runs) * 6 / NULLIF(SUM(legal_ball), 0), 2) AS economy
FROM `IPL_2026.Clean_deliveries`
GROUP BY bowler, bowling_team
ORDER BY wickets DESC
LIMIT 10;