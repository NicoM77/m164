CREATE TABLE tbl_fahrer (
    ID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(45) NOT NULL,
    Vorname VARCHAR(45) NOT NULL,
    Telefonnummer VARCHAR(45) NOT NULL,
    PRIMARY KEY (ID)
) CHARSET=utf8mb4;

CREATE TABLE tbl_disponent (
    ID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(45) NOT NULL,
    Vorname VARCHAR(45) NOT NULL,
    Telefonnummer VARCHAR(45) NOT NULL,
    PRIMARY KEY (ID)
) CHARSET=utf8mb4;


CREATE TABLE tbl_Mitarbeiter (
    MA_ID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Vorname VARCHAR(30) NOT NULL,
    Geburtsdatum DATETIME NOT NULL,
    Telefonnummer VARCHAR(12) NOT NULL,
    Einkommen FLOAT(10,2) NOT NULL,
    PRIMARY KEY (MA_ID)
) CHARSET=utf8mb4;

-- Create tbl_fahrer
CREATE TABLE tbl_fahrer (
    ID INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (ID)
) CHARSET=utf8mb4;

-- Create tbl_disponent
CREATE TABLE tbl_disponent (
    ID INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (ID)
) CHARSET=utf8mb4;

-- Create tbl_Mitarbeiter
CREATE TABLE tbl_Mitarbeiter (
    MA_ID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Vorname VARCHAR(30) NOT NULL,
    Geburtsdatum DATETIME NOT NULL,
    Telefonnummer VARCHAR(12) NOT NULL,
    Einkommen FLOAT(10,2) NOT NULL,
    PRIMARY KEY (MA_ID)
) CHARSET=utf8mb4;

-- Alter charset of Name and Vorname to latin1
ALTER TABLE tbl_Mitarbeiter
    MODIFY Name VARCHAR(50) CHARACTER SET latin1,
    MODIFY Vorname VARCHAR(30) CHARACTER SET latin1;

-- Drop columns from tbl_fahrer and tbl_disponent
ALTER TABLE tbl_fahrer
    DROP COLUMN Name,
    DROP COLUMN Vorname,
    DROP COLUMN Telefonnummer;

ALTER TABLE tbl_disponent
    DROP COLUMN Name,
    DROP COLUMN Vorname
