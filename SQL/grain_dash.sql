USE grain_dash;

ALTER TABLE grain_dash.climate DROP CONSTRAINT country_id5;
ALTER TABLE grain_dash.container DROP CONSTRAINT country_id4;
ALTER TABLE grain_dash.container_long DROP CONSTRAINT country_id1;
ALTER TABLE grain_dash.wheat_production DROP CONSTRAINT country_id;
ALTER TABLE grain_dash.wheat_yield DROP CONSTRAINT country_id2;
ALTER TABLE grain_dash.wto_status DROP CONSTRAINT country_id3;


SELECT c.country_id, c.country_name FROM grain_dash.country AS c
JOIN grain_dash.climate AS clim
ON c.country_name = clim.country;

SELECT * FROM grain_dash.country
WHERE country_name IN (('Cabo Verde'),('Chinese Taipei'),("Cote d'Ivoire"),('Czechia'),('Congo, Dem. Rep.'),('Timor-Leste'),('Egypt, Arab Rep.'),('Afghanistan'),('Iran, Islamic Rep.'),('Korea, Rep.'),('Lao PDR'),('Micronesia, Fed. Sts.'),('Congo, Rep.'),('Yemen, Rep.'),('Russian Federation'),('St. Vincent and the Grenadines'),('Bahamas, The'),('Gambia, The'),('Turkiye'),('Venezuela, RB'),('Viet Nam'))
ORDER BY FIELD(country_name,('Cabo Verde'),('Chinese Taipei'),("Cote d'Ivoire"),('Czechia'),('Congo, Dem. Rep.'),('Timor-Leste'),('Egypt, Arab Rep.'),('Afghanistan'),('Iran, Islamic Rep.'),('Korea, Rep.'),('Lao PDR'),('Micronesia, Fed. Sts.'),('Congo, Rep.'),('Yemen, Rep.'),('Russian Federation'),('St. Vincent and the Grenadines'),('Bahamas, The'),('Gambia, The'),('Turkiye'),('Venezuela, RB'),('Viet Nam'));

--- Update individual numbers 
UPDATE grain_dash.climate
SET country_id = 49  
WHERE country = ('Cape Verde');

UPDATE grain_dash.climate
SET country_id = 184  
WHERE country = ('Chinese Taipei');

--- Update country names and ids
UPDATE grain_dash.climate AS clim
SET country = ("Viet Nam"), country_id = 255
WHERE climate_id = 181;

--- Check for compliance
SELECT * FROM grain_dash.climate
WHERE country_id = 0;

--- CONTAINER
SELECT * FROM grain_dash.container;

UPDATE grain_dash.container AS con 
JOIN (
SELECT c.country_name, c.country_id 
FROM grain_dash.country AS c     
JOIN grain_dash.container AS con_inner     
ON c.country_name = con_inner.country 
) AS temp 
ON con.country = temp.country_name 
SET con.country_id = temp.country_id;

--- DOING BUSINESS
SELECT * FROM grain_dash.doing_business

