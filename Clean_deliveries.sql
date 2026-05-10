--cleaning and creating a new table for deliveries.

CREATE OR REPLACE TABLE `IPL_2026.Clean_deliveries` AS
SELECT 
  CAST(match_no AS INT64) AS match_id,
  PARSE_DATE('%b %d, %Y',date) AS match_date,
  CASE
    WHEN LOWER(stage) LIKE '%league%' THEN 'League'
    ELSE TRIM(stage)
  END AS stage,
  TRIM(venue) AS venue,
  TRIM(batting_team) AS batting_team,
  TRIM(bowling_team) AS bowling_team,
  CAST(innings AS INT64) AS innings,
  CAST(FLOOR(CAST(`over` AS FLOAT64)) AS INT64) AS over_no,
  CAST(ROUND((CAST(`over` AS FLOAT64) - FLOOR(CAST(`over` AS FLOAT64))) * 10) AS INT64) AS ball_no,
  TRIM(striker) AS striker,
  TRIM(bowler) AS bowler,
  CAST(runs_of_bat AS INT64) AS runs_of_bat,
  CAST(extras AS INT64) AS extras,
  CAST(wide AS INT64) AS wide,
  CAST(legbyes AS INT64) AS legbyes,
  CAST(byes AS INT64) AS byes,
  CAST(noballs AS INT64) AS noballs,
  NULLIF(TRIM(wicket_type), '') AS wicket_type,
  NULLIF(TRIM(player_dismissed), '') AS player_dismissed,
  NULLIF(TRIM(fielder), '') AS fielder,

  CAST(runs_of_bat AS INT64) + CAST(extras AS INT64) AS total_runs,

  CASE WHEN CAST(runs_of_bat AS INT64) = 4 THEN 1 ELSE 0 END AS is_four,
  CASE WHEN CAST(runs_of_bat AS INT64) = 6 THEN 1 ELSE 0 END AS is_six,

  CASE
    WHEN NULLIF(TRIM(player_dismissed), '') IS NOT NULL THEN 1
    ELSE 0
  END AS is_wicket,

  CASE
    WHEN CAST(wide AS INT64) = 0 THEN 1
    ELSE 0
  END AS legal_ball

  FROM `my-project02-495123.IPL_2026.raw_deliveries`;