SELECT 
      EXTRACT(MONTH FROM DATE(partition_date)) AS mes,
      EXTRACT(YEAR FROM DATE(partition_date)) AS ano,
      brand,
      midia,
      depto,
      device,
      SUM(visitas) as visitas,
FROM `seo-analytics-219818.evaluated_navigation.visitas_hits` 
WHERE partition_date between "2019-01-01" AND "2021-11-30"
  AND brand = "ACOM"
      AND depto IN ("INFORMÁTICA E ACESSÓRIOS (60)", "GERAL")
      #AND depto = "GERAL"
      AND origem = "adobe"
GROUP BY 1,2,3,4,5,6
ORDER BY 2,1,3,5 ASC
