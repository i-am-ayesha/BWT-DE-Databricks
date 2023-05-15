-- Databricks notebook source
-- MAGIC %python
-- MAGIC html = """<h1 style="color:Black;text-align:center;font-family:Arial">Report on Dominant Formula 1 Drivers</h1>"""
-- MAGIC displayHTML(html)

-- COMMAND ----------

CREATE OR REPLACE TEMP VIEW v_dominant_drivers
AS
SELECT driver_name,
COUNT(1) AS total_races,
AVG(calculated_points) AS avg_points,
RANK() OVER(ORDER BY  AVG(calculated_points) DESC) driver_rank,
SUM(calculated_points) AS total_points 
FROM  f1_presentation.calculated_race_results
GROUP BY driver_name
HAVING COUNT(1) >=50
ORDER BY avg_points DESC

-- COMMAND ----------

SELECT driver_name,race_year,
COUNT(1) AS total_races,
AVG(calculated_points) AS avg_points,
SUM(calculated_points) AS total_points 
FROM  f1_presentation.calculated_race_results
WHERE driver_name IN (SELECT driver_name FROM v_dominant_drivers WHERE driver_rank <=10)
GROUP BY driver_name,race_year
ORDER BY race_year, avg_points DESC

-- COMMAND ----------

SELECT driver_name,race_year,
COUNT(1) AS total_races,
AVG(calculated_points) AS avg_points,
SUM(calculated_points) AS total_points 
FROM  f1_presentation.calculated_race_results
WHERE driver_name IN (SELECT driver_name FROM v_dominant_drivers WHERE driver_rank <=10)
GROUP BY driver_name,race_year
ORDER BY race_year, avg_points DESC

-- COMMAND ----------

SELECT driver_name,race_year,
COUNT(1) AS total_races,
AVG(calculated_points) AS avg_points,
SUM(calculated_points) AS total_points 
FROM  f1_presentation.calculated_race_results
WHERE driver_name IN (SELECT driver_name FROM v_dominant_drivers WHERE driver_rank <=10)
GROUP BY driver_name,race_year
ORDER BY race_year, avg_points DESC

-- COMMAND ----------

