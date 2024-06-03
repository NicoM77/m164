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



-- -----------------------------------------------------
-- Table `Fahrzeug`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fahrzeug` ;

CREATE TABLE IF NOT EXISTS `Fahrzeug` (
  `Fahrzeugkennzeichner` VARCHAR(45) NOT NULL,
  `Sitz_Plaetze` VARCHAR(45) NOT NULL,
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
  `FK_Vorgesetzter` INT NULL,
  PRIMARY KEY (`Mitarbeiter_id`),
  INDEX `fk_Mitarbeiter_Vorgesetzter_idx` (`FK_Vorgesetzter` ASC),
  CONSTRAINT `fk_Mitarbeiter_Vorgesetzter`
    FOREIGN KEY (`FK_Vorgesetzter`)
    REFERENCES `Mitarbeiter` (`Mitarbeiter_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
-- Table `Fahrer_Disponent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fahrer_Disponent` ;

CREATE TABLE IF NOT EXISTS `Fahrer_Disponent` (
  `Fahrer_id` INT NOT NULL,
  `Disponent_id` INT NOT NULL,
  PRIMARY KEY (`Fahrer_id`, `Disponent_id`),
  INDEX `fk_Fahrer_Disponent_Fahrer_idx` (`Fahrer_id` ASC),
  INDEX `fk_Fahrer_Disponent_Disponent_idx` (`Disponent_id` ASC),
  CONSTRAINT `fk_Fahrer_Disponent_Fahrer`
    FOREIGN KEY (`Fahrer_id`)
    REFERENCES `Fahrer` (`Fahrer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fahrer_Disponent_Disponent`
    FOREIGN KEY (`Disponent_id`)
    REFERENCES `Disponent` (`Disponent_id`)
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

DROP TABLE IF EXISTS `Station` ;

CREATE TABLE IF NOT EXISTS `Station` (
  `Station_id` INT NOT NULL,
  `Tour_id` INT NOT NULL,
  `Station_name` TEXT NULL,
  `FK_Ortschaft` INT NOT NULL,
  `Parent_Station_id` INT NULL,
  PRIMARY KEY (`Station_id`, `FK_Ortschaft`),
  INDEX `fk_Station_Ortschaft1_idx` (`FK_Ortschaft` ASC),
  INDEX `fk_Station_Parent_Station_idx` (`Parent_Station_id` ASC),
  INDEX `fk_Station_Tour_idx` (`Tour_id` ASC),
  CONSTRAINT `fk_Station_Ortschaft1`
    FOREIGN KEY (`FK_Ortschaft`)
    REFERENCES `Ortschaft` (`Ortschaft_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Station_Parent_Station`
    FOREIGN KEY (`Parent_Station_id`)
    REFERENCES `Station` (`Station_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Station_Tour`
    FOREIGN KEY (`Tour_id`)
    REFERENCES `Tour` (`Tour_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Stop_in_tour`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Stop_in_tour` ;

SELECT 
    t.Tour_id AS `Tour-Nummer`,
    (SELECT CONCAT(SUBSTRING_INDEX(s.Station_Name, ' ', 1), ', ', o.PLZ, ' ', o.Beschriftung)
     FROM Station s
     JOIN Ortschaft o ON s.FK_Ortschaft = o.Ortschaft_id
     WHERE s.Tour_Id = t.Tour_id
     ORDER BY s.Station_id
     LIMIT 1) AS `Start-Ort`,
    (SELECT CONCAT(SUBSTRING_INDEX(s.Station_Name, ' ', 1), ', ', o.PLZ, ' ', o.Beschriftung)
     FROM Station s
     JOIN Ortschaft o ON s.FK_Ortschaft = o.Ortschaft_id
     WHERE s.Tour_Id = t.Tour_id
     ORDER BY s.Station_id DESC
     LIMIT 1) AS `Ziel-Ort`,
    GROUP_CONCAT(CONCAT(SUBSTRING_INDEX(s.Station_Name, ' ', 1), ', ', o.PLZ, ' ', o.Beschriftung) ORDER BY s.Station_id SEPARATOR ' ') AS `Via`
FROM 
    Tour t
JOIN 
    Station s ON t.Tour_id = s.Tour_Id
JOIN 
    Ortschaft o ON s.FK_Ortschaft = o.Ortschaft_id
GROUP BY 
    t.Tour_id;