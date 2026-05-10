SELECT
  COUNT(DISTINCT match_id) AS total_matches,
  SUM(total_runs) AS total_runs,
  SUM(is_wicket) AS total_wickets,
  SUM(is_four) AS total_fours,
  SUM(is_six) AS total_sixes
FROM `your_project_id.ipl_2026.deliveries_clean`; 