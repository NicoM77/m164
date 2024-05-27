-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `Ortschaft`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Ortschaft` ;

CREATE TABLE IF NOT EXISTS `Ortschaft` (
  `Ortschaft_id` INT NOT NULL,
  `PLZ` VARCHAR(45) NOT NULL,
  `Beschriftung` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Ortschaft_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Station`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Station` ;

CREATE TABLE IF NOT EXISTS `Station` (
  `Station_id` INT NOT NULL,
  `FK_Ortschaft` INT NOT NULL,
  PRIMARY KEY (`Station_id`, `FK_Ortschaft`),
  INDEX `fk_Station_Ortschaft1_idx` (`FK_Ortschaft` ASC),
  CONSTRAINT `fk_Station_Ortschaft1`
    FOREIGN KEY (`FK_Ortschaft`)
    REFERENCES `Ortschaft` (`Ortschaft_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fahrzeug`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fahrzeug` ;

CREATE TABLE IF NOT EXISTS `Fahrzeug` (
  `Fahrzeugkennzeichner` VARCHAR(45) NOT NULL,
  `Sitz_Plaeze` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Fahrzeugkennzeichner`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mitarbeiter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mitarbeiter` ;

CREATE TABLE IF NOT EXISTS `Mitarbeiter` (
  `Mitarbeiter_id` INT NOT NULL,
  `Vorname` VARCHAR(45) NOT NULL,
  `Nachname` VARCHAR(45) NOT NULL,
  `Telefonnummer` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Mitarbeiter_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Disponent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Disponent` ;

CREATE TABLE IF NOT EXISTS `Disponent` (
  `Disponent_id` INT NOT NULL,
  `FK_Mitarbeiter` INT NOT NULL,
  `Disponentennummer` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Disponent_id`, `FK_Mitarbeiter`),
  INDEX `fk_Disponent_Mitarbeiter1_idx` (`FK_Mitarbeiter` ASC),
  CONSTRAINT `fk_Disponent_Mitarbeiter1`
    FOREIGN KEY (`FK_Mitarbeiter`)
    REFERENCES `Mitarbeiter` (`Mitarbeiter_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tour`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tour` ;

CREATE TABLE IF NOT EXISTS `Tour` (
  `Tour_id` INT NOT NULL,
  `FK_Fahrzeug` VARCHAR(45) NOT NULL,
  `FK_Disponent` INT NOT NULL,
  PRIMARY KEY (`Tour_id`),
  INDEX `fk_Tour_Fahrzeug1_idx` (`FK_Fahrzeug` ASC),
  INDEX `fk_Tour_Disponent1_idx` (`FK_Disponent` ASC),
  CONSTRAINT `fk_Tour_Fahrzeug1`
    FOREIGN KEY (`FK_Fahrzeug`)
    REFERENCES `Fahrzeug` (`Fahrzeugkennzeichner`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tour_Disponent1`
    FOREIGN KEY (`FK_Disponent`)
    REFERENCES `Disponent` (`Disponent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fahrer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fahrer` ;

CREATE TABLE IF NOT EXISTS `Fahrer` (
  `Fahrer_id` INT NOT NULL,
  `FK_Mitarbeiter` INT NOT NULL,
  `Fahrernummer` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Fahrer_id`, `FK_Mitarbeiter`),
  INDEX `fk_Fahrer_Mitarbeiter_idx` (`FK_Mitarbeiter` ASC),
  CONSTRAINT `fk_Fahrer_Mitarbeiter`
    FOREIGN KEY (`FK_Mitarbeiter`)
    REFERENCES `Mitarbeiter` (`Mitarbeiter_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stop_in_tour`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Stop_in_tour` ;

CREATE TABLE IF NOT EXISTS `Stop_in_tour` (
  `FK_Tour` INT NOT NULL,
  `FK_Station` INT NOT NULL,
  `FK_Fahrer` INT NOT NULL,
  PRIMARY KEY (`FK_Tour`, `FK_Station`),
  INDEX `fk_Tour_has_Station_Station1_idx` (`FK_Station` ASC),
  INDEX `fk_Tour_has_Station_Tour1_idx` (`FK_Tour` ASC),
  INDEX `fk_Stop_in_tour_Fahrer1_idx` (`FK_Fahrer` ASC),
  CONSTRAINT `fk_Tour_has_Station_Tour1`
    FOREIGN KEY (`FK_Tour`)
    REFERENCES `Tour` (`Tour_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tour_has_Station_Station1`
    FOREIGN KEY (`FK_Station`)
    REFERENCES `Station` (`Station_id`)
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Stop_in_tour_Fahrer1`
    FOREIGN KEY (`FK_Fahrer`)
    REFERENCES `Fahrer` (`Fahrer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
