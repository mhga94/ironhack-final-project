-- Grain dashboard creation

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema grain_dash
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema grain_dash
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `grain_dash` DEFAULT CHARACTER SET utf8mb3 ;
USE `grain_dash` ;

-- -----------------------------------------------------
-- Table `grain_dash`.`climate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grain_dash`.`climate` (
  `climate_id` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(45) NOT NULL,
  `country_id` INT NOT NULL DEFAULT '0',
  `index_value` INT NOT NULL,
  `index_rank` INT NOT NULL,
  PRIMARY KEY (`climate_id`),
  INDEX `country_id5` (`country_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 184
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grain_dash`.`container`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grain_dash`.`container` (
  `container_id` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(45) NOT NULL,
  `country_id` INT NULL DEFAULT '0',
  `year` YEAR NULL DEFAULT NULL,
  `value` INT NULL DEFAULT NULL,
  PRIMARY KEY (`container_id`),
  INDEX `country_id4` (`country_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 40659
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grain_dash`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grain_dash`.`country` (
  `country_id` INT NOT NULL AUTO_INCREMENT,
  `country_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE INDEX `countrycol_UNIQUE` (`country_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 264
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grain_dash`.`doing_business`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grain_dash`.`doing_business` (
  `business_id` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(70) NULL DEFAULT NULL,
  `country_id` INT NOT NULL DEFAULT '0',
  `year` YEAR NULL DEFAULT NULL,
  `db_rank` INT NULL DEFAULT NULL,
  PRIMARY KEY (`business_id`),
  INDEX `country_id6` (`country_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 191
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grain_dash`.`wheat_export`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grain_dash`.`wheat_export` (
  `export_id` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(45) NOT NULL,
  `country_id` INT NOT NULL DEFAULT '0',
  `year` YEAR NULL DEFAULT NULL,
  `value` INT NULL DEFAULT NULL,
  PRIMARY KEY (`export_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2081
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grain_dash`.`wheat_production`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grain_dash`.`wheat_production` (
  `wheat_production_id` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(45) NOT NULL,
  `country_id` INT NOT NULL DEFAULT '0',
  `year` YEAR NOT NULL,
  `value` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`wheat_production_id`),
  INDEX `country_id` (`country_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 7056
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grain_dash`.`wheat_yield`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grain_dash`.`wheat_yield` (
  `wheat_yield_id` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(45) NOT NULL,
  `country_id` INT NOT NULL DEFAULT '0',
  `year` YEAR NULL DEFAULT NULL,
  `value` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`wheat_yield_id`),
  INDEX `country_id2` (`country_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6815
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grain_dash`.`wto_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grain_dash`.`wto_status` (
  `WTO_id` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(45) NOT NULL,
  `country_id` INT NOT NULL DEFAULT '0',
  `status` VARCHAR(45) NULL DEFAULT 'NON-MEMBER',
  `accession` VARCHAR(70) NULL DEFAULT NULL,
  PRIMARY KEY (`WTO_id`),
  INDEX `country_id3` (`country_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 190
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;