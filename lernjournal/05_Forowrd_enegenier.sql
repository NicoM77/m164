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
-- Table `Person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Person` ;

CREATE TABLE IF NOT EXISTS `Person` (
  `PS_Person_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(30) NULL,
  `Vorname` VARCHAR(15) NULL,
  `Grösse` DECIMAL(3) NULL,
  PRIMARY KEY (`PS_Person_ID`),
  UNIQUE INDEX `PS_Person_UNIQUE` (`PS_Person_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Kleidungsstück_NI`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Kleidungsstück_NI` ;

CREATE TABLE IF NOT EXISTS `Kleidungsstück_NI` (
  `PS_Kleidungsstück_ID` INT NOT NULL AUTO_INCREMENT,
  `Bezeichnung` VARCHAR(45) NOT NULL,
  `Grösse` VARCHAR(3) NULL,
  `Farbe` VARCHAR(10) NULL,
  PRIMARY KEY (`PS_Kleidungsstück_ID`),
  UNIQUE INDEX `PS_Kleidungsstück_ID_UNIQUE` (`PS_Kleidungsstück_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ausweis_I`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Ausweis_I` ;

CREATE TABLE IF NOT EXISTS `Ausweis_I` (
  `PS_Ausweis_ID` INT NOT NULL AUTO_INCREMENT,
  `Bezeichnung` VARCHAR(30) NULL,
  `Ausstellungsdatum` DATETIME NULL,
  `Nummer` VARCHAR(30) NULL,
  PRIMARY KEY (`PS_Ausweis_ID`),
  UNIQUE INDEX `PS_Kleidungsstück_ID_UNIQUE` (`PS_Ausweis_ID` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
