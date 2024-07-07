USE grain_dash;

-- Load data from CSVs in data/ using import wizard and matching to appropriate columns.

SELECT DISTINCT country_id FROM grain_dash.country
ORDER BY country_id DESC;

-- Insert Belgium-Luxembourg
INSERT INTO grain_dash.country (country_name, country_id)
VALUES ('Belgium-Luxembourg', 264);

-- Insert Taiwan
INSERT INTO grain_dash.country (country_name, country_id)
VALUES ('Taiwan', 265);

-- Insert Palestine
INSERT INTO grain_dash.country (country_name, country_id)
VALUES ('Palestine', 266);

-- Insert Serbia & Montengro
INSERT INTO grain_dash.country (country_name, country_id)
VALUES ('Serbia and Montenegro', 267);

-- Insert USSR
INSERT INTO grain_dash.country (country_name, country_id)
VALUES ('USSR', 268);

-- Insert Yugoslav SFR
INSERT INTO grain_dash.country (country_name, country_id)
VALUES ('Yugoslav SFR', 269);

-- Insert Holy See
INSERT INTO grain_dash.country (country_name, country_id)
VALUES ('Holy See', 270);

-- Insert Serbia & Montenegro
INSERT INTO grain_dash.country (country_name, country_id)
VALUES ('Holy See', 270);

--- CLIMATE

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
SELECT * FROM grain_dash.container
WHERE country_id = 0;

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
SELECT * FROM grain_dash.doing_business;

UPDATE grain_dash.doing_business
SET country = "Cote d'Ivoire"
WHERE business_id = 41;

UPDATE grain_dash.doing_business
SET country = "Czechia"
WHERE business_id = 44;

UPDATE grain_dash.doing_business
SET country = "Sao Tome and Principe"
WHERE business_id = 144;

UPDATE grain_dash.doing_business
SET country = "Viet Nam"
WHERE business_id = 186;

UPDATE grain_dash.doing_business
SET country = "Turkiye"
WHERE business_id = 176;

UPDATE grain_dash.doing_business
SET country = "Taiwan"
WHERE business_id = 167;

UPDATE grain_dash.doing_business AS db 
JOIN (
SELECT c.country_name, c.country_id 
FROM grain_dash.country AS c     
JOIN grain_dash.doing_business AS db_inner     
ON c.country_name = db_inner.country 
) AS temp 
ON db.country = temp.country_name 
SET db.country_id = temp.country_id;

--- WHEAT PRODUCTION
SELECT * FROM grain_dash.wheat_production
WHERE country_id = 0;

UPDATE grain_dash.wheat_production AS wp
JOIN (
SELECT c.country_name, c.country_id 
FROM grain_dash.country AS c     
JOIN grain_dash.wheat_production AS wp_inner     
ON c.country_name = wp_inner.country 
) AS temp 
ON wp.country = temp.country_name 
SET wp.country_id = temp.country_id;

-- Update country_id values
UPDATE grain_dash.wheat_production
SET country_id = CASE
	WHEN country = 'Bolivia (Plurinational State of)' THEN "30"
	WHEN country = 'China, mainland' THEN "42"
	WHEN country = 'China, Taiwan Province of' THEN "265"
	WHEN country = 'Czechoslovakia' THEN "56"
	WHEN country = 'Democratic People\'s Republic of Korea' THEN "193"
	WHEN country = 'Democratic Republic of the Congo' THEN "45"
	WHEN country = 'Egypt' THEN "69"
	WHEN country = 'Ethiopia PDR' THEN "74"
	WHEN country = 'Iran (Islamic Republic of)' THEN "114"
	WHEN country = 'Kyrgyzstan' THEN "124"
	WHEN country = 'Netherlands (Kingdom of the)' THEN "176"
	WHEN country = 'Palestine' THEN "266"
	WHEN country = 'Republic of Korea' THEN "128"
	WHEN country = 'Republic of Moldova' THEN "151"
	WHEN country = 'Serbia and Montenegro' THEN "267"
    WHEN country = 'Slovakia' THEN "221"
	WHEN country = 'Sudan (former)' THEN "206"
	WHEN country = 'TÃ¼rkiye' THEN "242"
	WHEN country = 'United Republic of Tanzania' THEN "244"
	WHEN country = 'United States of America' THEN "249"
	WHEN country = 'Venezuela (Bolivarian Republic of)' THEN" 252"
	WHEN country = 'Yemen' THEN "260"
    ELSE country_id 
END;

-- Update country names
UPDATE grain_dash.wheat_production
SET country = CASE
	WHEN country = 'Bolivia (Plurinational State of)' THEN "Bolivia"
	WHEN country = 'China, mainland' THEN "China"
	WHEN country = 'China, Taiwan Province of' THEN "Taiwan"
	WHEN country = 'Czechoslovakia' THEN "Czechia"
	WHEN country = 'Democratic People\'s Republic of Korea' THEN "Korea, Dem. People's Rep."
	WHEN country = 'Democratic Republic of the Congo' THEN "Congo, Dem. Rep."
	WHEN country = 'Egypt' THEN "Egypt, Arab Rep."
	WHEN country = 'Ethiopia PDR' THEN "Ethiopia"
	WHEN country = 'Iran (Islamic Republic of)' THEN "Iran, Islamic Rep."
	WHEN country = 'Kyrgyzstan' THEN "Kyrgyz Republic"
	WHEN country = 'Netherlands (Kingdom of the)' THEN "Netherlands"
	WHEN country = 'Palestine' THEN "Palestine"
	WHEN country = 'Republic of Korea' THEN "Korea, Rep."
	WHEN country = 'Republic of Moldova' THEN "Moldova"
	WHEN country = 'Serbia and Montenegro' THEN "Serbia and Montenegro"
	WHEN country = 'Slovakia' THEN "Slovak Republic"
	WHEN country = 'Sudan (former)' THEN "Sudan"
	WHEN country = 'TÃ¼rkiye' THEN "Turkiye"
	WHEN country = 'United Republic of Tanzania' THEN "Tanzania"
	WHEN country = 'United States of America' THEN "United States"
	WHEN country = 'Venezuela (Bolivarian Republic of)' THEN" Venezuela, RB"
	WHEN country = 'Yemen' THEN "Yemen, Rep."
    ELSE country 
END;

SELECT country, ROUND(AVG(value),2) AS average_value
FROM grain_dash.wheat_production
WHERE year > 2014
GROUP BY country
ORDER BY average_value DESC
LIMIT 10;



--- WHEAT YIELD
SELECT * FROM grain_dash.wheat_yield
WHERE country_id = 0;

UPDATE grain_dash.wheat_yield AS wy
JOIN (
SELECT c.country_name, c.country_id 
FROM grain_dash.country AS c     
JOIN grain_dash.wheat_yield AS wy_inner     
ON c.country_name = wy_inner.country 
) AS temp 
ON wy.country = temp.country_name 
SET wy.country_id = temp.country_id;

-- Update country_id values
UPDATE grain_dash.wheat_yield
SET country_id = CASE
	WHEN country = 'Bolivia (Plurinational State of)' THEN "30"
	WHEN country = 'China, mainland' THEN "42"
	WHEN country = 'China, Taiwan Province of' THEN "265"
	WHEN country = 'Czechoslovakia' THEN "56"
	WHEN country = 'Democratic People\'s Republic of Korea' THEN "193"
	WHEN country = 'Democratic Republic of the Congo' THEN "45"
	WHEN country = 'Egypt' THEN "69"
	WHEN country = 'Ethiopia PDR' THEN "74"
	WHEN country = 'Iran (Islamic Republic of)' THEN "114"
	WHEN country = 'Kyrgyzstan' THEN "124"
	WHEN country = 'Netherlands (Kingdom of the)' THEN "176"
	WHEN country = 'Palestine' THEN "266"
	WHEN country = 'Republic of Korea' THEN "128"
	WHEN country = 'Republic of Moldova' THEN "151"
	WHEN country = 'Serbia and Montenegro' THEN "267"
    WHEN country = 'Slovakia' THEN "221"
	WHEN country = 'Sudan (former)' THEN "206"
	WHEN country = 'TÃ¼rkiye' THEN "242"
	WHEN country = 'United Republic of Tanzania' THEN "244"
	WHEN country = 'United States of America' THEN "249"
	WHEN country = 'Venezuela (Bolivarian Republic of)' THEN" 252"
	WHEN country = 'Yemen' THEN "260"
    ELSE country_id 
END;

-- Update country names
UPDATE grain_dash.wheat_yield
SET country = CASE
	WHEN country = 'Bolivia (Plurinational State of)' THEN "Bolivia"
	WHEN country = 'China, mainland' THEN "China"
	WHEN country = 'China, Taiwan Province of' THEN "Taiwan"
	WHEN country = 'Czechoslovakia' THEN "Czechia"
	WHEN country = 'Democratic People\'s Republic of Korea' THEN "Korea, Dem. People's Rep."
	WHEN country = 'Democratic Republic of the Congo' THEN "Congo, Dem. Rep."
	WHEN country = 'Egypt' THEN "Egypt, Arab Rep."
	WHEN country = 'Ethiopia PDR' THEN "Ethiopia"
	WHEN country = 'Iran (Islamic Republic of)' THEN "Iran, Islamic Rep."
	WHEN country = 'Kyrgyzstan' THEN "Kyrgyz Republic"
	WHEN country = 'Netherlands (Kingdom of the)' THEN "Netherlands"
	WHEN country = 'Palestine' THEN "Palestine"
	WHEN country = 'Republic of Korea' THEN "Korea, Rep."
	WHEN country = 'Republic of Moldova' THEN "Moldova"
	WHEN country = 'Serbia and Montenegro' THEN "Serbia and Montenegro"
	WHEN country = 'Slovakia' THEN "Slovak Republic"
	WHEN country = 'Sudan (former)' THEN "Sudan"
	WHEN country = 'TÃ¼rkiye' THEN "Turkiye"
	WHEN country = 'United Republic of Tanzania' THEN "Tanzania"
	WHEN country = 'United States of America' THEN "United States"
	WHEN country = 'Venezuela (Bolivarian Republic of)' THEN" Venezuela, RB"
	WHEN country = 'Yemen' THEN "Yemen, Rep."
    ELSE country 
END;

--- WTO STATUS
SELECT * FROM grain_dash.wto_status
WHERE country_id NOT IN (
SELECT country_id FROM grain_dash.country);

UPDATE grain_dash.wto_status
SET country = "Sao Tome and Principe"
WHERE WTO_id = 181;

UPDATE grain_dash.wto_status
SET country = "Curaçao"
WHERE WTO_id = 173;

UPDATE grain_dash.wto_status
SET country = "Syrian Arab Republic"
WHERE WTO_id = 186;

UPDATE grain_dash.wto_status
SET country = "Iran, Islamic Rep."
WHERE WTO_id = 177;

UPDATE grain_dash.wto_status
SET country = "Bahamas, The"
WHERE WTO_id = 168;

UPDATE grain_dash.wto_status
SET country = "Czechia"
WHERE WTO_id = 38;

UPDATE grain_dash.wto_status
SET country = "Brunei Darussalam"
WHERE WTO_id = 18;

UPDATE grain_dash.wto_status
SET country_id = 270
WHERE WTO_id = 176;

UPDATE grain_dash.wto_status AS wto
JOIN (
SELECT c.country_name, c.country_id 
FROM grain_dash.country AS c     
JOIN grain_dash.wto_status AS wto_inner     
ON c.country_name = wto_inner.country 
) AS temp 
ON wto.country = temp.country_name 
SET wto.country_id = temp.country_id;

-- WHEAT EXPORT
SELECT * FROM grain_dash.wheat_export
WHERE country_id = 0;

UPDATE grain_dash.wheat_export
SET country = CASE
	WHEN country = 'Bahamas' THEN "Bahamas, The"
    WHEN country = 'Bolivia (Plurinational State of)' THEN "Bolivia"
	WHEN country = 'China, mainland' THEN "China"
	WHEN country = 'China, Taiwan Province of' THEN "Taiwan"
    WHEN country = 'China, Hong Kong SAR' THEN "Hong Kong SAR, China"
    WHEN country = 'China, Macao SAR' THEN "Macao SAR, China"
    WHEN country = "CÃ´te d\'Ivoire" THEN "Cote d'Ivoire"
	WHEN country = 'Czechoslovakia' THEN "Czechia"
	WHEN country = 'Congo' THEN "Congo, Rep."
    WHEN country = 'Congo Rep.' THEN "Congo, Rep."
    WHEN country = 'Democratic People\'s Republic of Korea' THEN "Korea, Dem. People's Rep."
	WHEN country = 'Democratic Republic of the Congo' THEN "Congo, Dem. Rep."
	WHEN country = 'Egypt' THEN "Egypt, Arab Rep."
	WHEN country = 'Ethiopia PDR' THEN "Ethiopia"
    WHEN country = 'Gambia' THEN "Gambia, The"
	WHEN country = 'Iran (Islamic Republic of)' THEN "Iran, Islamic Rep."
	WHEN country = 'Kyrgyzstan' THEN "Kyrgyz Republic"
    WHEN country = "Lao People's Democratic Republic" THEN "Lao PDR"
    WHEN country = 'Micronesia' THEN "Micronesia Fed. Sts."
	WHEN country = 'Micronesia (Federated States of)' THEN "Micronesia, Fed. Sts."
    WHEN country = 'Micronesia Fed. Sts.' THEN "Micronesia, Fed. Sts."
    WHEN country = 'Netherlands (Kingdom of the)' THEN "Netherlands"
	WHEN country = 'Palestine' THEN "Palestine"
	WHEN country = 'Republic of Korea' THEN "Korea, Rep."
	WHEN country = 'Republic of Moldova' THEN "Moldova"
	WHEN country = 'Serbia and Montenegro' THEN "Serbia and Montenegro"
	WHEN country = 'Slovakia' THEN "Slovak Republic"
    WHEN country = 'Saint Kitts and Nevis' THEN "St. Kitts and Nevis"
    WHEN country = 'Saint Lucia' THEN "St. Lucia"
    WHEN country = 'Saint Vincent and the Grenadines' THEN "St. Vincent and the Grenadines"
	WHEN country = 'Sudan (former)' THEN "Sudan"
	WHEN country = 'TÃ¼rkiye' THEN "Turkiye"
	WHEN country = 'United Republic of Tanzania' THEN "Tanzania"
	WHEN country = 'United States of America' THEN "United States"
	WHEN country = 'Venezuela (Bolivarian Republic of)' THEN "Venezuela, RB"
    WHEN country = ' Venezuela, RB' THEN 'Venezuela, RB'
	WHEN country = 'Yemen' THEN "Yemen, Rep."
    ELSE country 
END;

UPDATE grain_dash.wheat_export AS we
JOIN (
SELECT c.country_name, c.country_id 
FROM grain_dash.country AS c     
JOIN grain_dash.wheat_export AS we_inner     
ON c.country_name = we_inner.country 
) AS temp 
ON we.country = temp.country_name 
SET we.country_id = temp.country_id;


-- Add foreign keys
ALTER TABLE `grain_dash`.`climate` 
ADD CONSTRAINT `climate_fk`
  FOREIGN KEY (`country_id`)
  REFERENCES `grain_dash`.`country` (`country_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
ALTER TABLE `grain_dash`.`container` 
ADD CONSTRAINT `container_fk`
  FOREIGN KEY (`country_id`)
  REFERENCES `grain_dash`.`country` (`country_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `grain_dash`.`doing_business` 
ADD CONSTRAINT `db_fk`
  FOREIGN KEY (`country_id`)
  REFERENCES `grain_dash`.`country` (`country_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `grain_dash`.`wheat_export` 
ADD CONSTRAINT `we_fk`
  FOREIGN KEY (`country_id`)
  REFERENCES `grain_dash`.`country` (`country_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `grain_dash`.`wheat_production` 
ADD CONSTRAINT `wp_fk`
  FOREIGN KEY (`country_id`)
  REFERENCES `grain_dash`.`country` (`country_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `grain_dash`.`wheat_yield` 
ADD CONSTRAINT `wy_fk`
  FOREIGN KEY (`country_id`)
  REFERENCES `grain_dash`.`country` (`country_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `grain_dash`.`wto_status` 
ADD CONSTRAINT `wto_fk`
  FOREIGN KEY (`country_id`)
  REFERENCES `grain_dash`.`country` (`country_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;