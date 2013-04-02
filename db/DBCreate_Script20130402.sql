SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `teamio` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `teamio` ;

-- -----------------------------------------------------
-- Table `teamio`.`Sportart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teamio`.`Sportart` ;

CREATE  TABLE IF NOT EXISTS `teamio`.`Sportart` (
  `idSportart` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idSportart`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teamio`.`Team`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teamio`.`Team` ;

CREATE  TABLE IF NOT EXISTS `teamio`.`Team` (
  `idTeam` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NOT NULL ,
  `Passwort` VARCHAR(45) NOT NULL ,
  `Vereinsname` VARCHAR(45) NULL ,
  `SportartID` INT NOT NULL ,
  PRIMARY KEY (`idTeam`) ,
  INDEX `fk_Team_Sportart1_idx` (`SportartID` ASC) ,
  CONSTRAINT `fk_Team_Sportart1`
    FOREIGN KEY (`SportartID` )
    REFERENCES `teamio`.`Sportart` (`idSportart` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teamio`.`Funktion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teamio`.`Funktion` ;

CREATE  TABLE IF NOT EXISTS `teamio`.`Funktion` (
  `idFunktion` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idFunktion`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teamio`.`Person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teamio`.`Person` ;

CREATE  TABLE IF NOT EXISTS `teamio`.`Person` (
  `idPerson` INT NOT NULL AUTO_INCREMENT COMMENT '	' ,
  `Name` VARCHAR(45) NOT NULL ,
  `Vorname` VARCHAR(45) NOT NULL ,
  `Email` VARCHAR(45) NULL ,
  `Handy` VARCHAR(15) NULL ,
  `Adresse` VARCHAR(45) NULL ,
  `Geburtsdatum` VARCHAR(45) NULL ,
  `TeamID` INT NOT NULL ,
  `FunktionID` INT NOT NULL ,
  PRIMARY KEY (`idPerson`) ,
  INDEX `fk_Person_Team1_idx` (`TeamID` ASC) ,
  INDEX `fk_Person_Funktion1_idx` (`FunktionID` ASC) ,
  CONSTRAINT `fk_Person_Team1`
    FOREIGN KEY (`TeamID` )
    REFERENCES `teamio`.`Team` (`idTeam` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Person_Funktion1`
    FOREIGN KEY (`FunktionID` )
    REFERENCES `teamio`.`Funktion` (`idFunktion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teamio`.`FileAttatch`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teamio`.`FileAttatch` ;

CREATE  TABLE IF NOT EXISTS `teamio`.`FileAttatch` (
  `idFileAttatch` INT NOT NULL AUTO_INCREMENT ,
  `Filename` VARCHAR(45) NOT NULL ,
  `Filesize` INT NOT NULL ,
  `Binary` BINARY NOT NULL ,
  PRIMARY KEY (`idFileAttatch`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teamio`.`EventKategorie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teamio`.`EventKategorie` ;

CREATE  TABLE IF NOT EXISTS `teamio`.`EventKategorie` (
  `idEventKategorie` INT NOT NULL ,
  `Name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idEventKategorie`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teamio`.`Event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teamio`.`Event` ;

CREATE  TABLE IF NOT EXISTS `teamio`.`Event` (
  `idEvent` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NOT NULL ,
  `DatumVon` DATETIME NOT NULL ,
  `DatumBis` DATETIME NOT NULL ,
  `Ort` VARCHAR(45) NOT NULL ,
  `Besammlungszeit` DATETIME NULL ,
  `Besammlungsort` VARCHAR(45) NULL ,
  `Bemerkung` VARCHAR(45) NULL ,
  `FileAttatchID` INT NOT NULL ,
  `TeamID` INT NOT NULL ,
  `EventKategorieID` INT NOT NULL ,
  PRIMARY KEY (`idEvent`) ,
  INDEX `fk_Event_FileAttatch1_idx` (`FileAttatchID` ASC) ,
  INDEX `fk_Event_Team1_idx` (`TeamID` ASC) ,
  INDEX `fk_Event_EventKategorie1_idx` (`EventKategorieID` ASC) ,
  CONSTRAINT `fk_Event_FileAttatch1`
    FOREIGN KEY (`FileAttatchID` )
    REFERENCES `teamio`.`FileAttatch` (`idFileAttatch` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Event_Team1`
    FOREIGN KEY (`TeamID` )
    REFERENCES `teamio`.`Team` (`idTeam` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Event_EventKategorie1`
    FOREIGN KEY (`EventKategorieID` )
    REFERENCES `teamio`.`EventKategorie` (`idEventKategorie` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teamio`.`UmfrageTyp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teamio`.`UmfrageTyp` ;

CREATE  TABLE IF NOT EXISTS `teamio`.`UmfrageTyp` (
  `idUmfrageTyp` INT NOT NULL ,
  `Name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idUmfrageTyp`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teamio`.`Umfrage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teamio`.`Umfrage` ;

CREATE  TABLE IF NOT EXISTS `teamio`.`Umfrage` (
  `idUmfrage` INT NOT NULL ,
  `Name` VARCHAR(45) NOT NULL ,
  `UmfrageTypID` INT NOT NULL ,
  `TeamID` INT NOT NULL ,
  PRIMARY KEY (`idUmfrage`) ,
  INDEX `fk_Umfrage_UmfrageTyp1_idx` (`UmfrageTypID` ASC) ,
  INDEX `fk_Umfrage_Team1_idx` (`TeamID` ASC) ,
  CONSTRAINT `fk_Umfrage_UmfrageTyp1`
    FOREIGN KEY (`UmfrageTypID` )
    REFERENCES `teamio`.`UmfrageTyp` (`idUmfrageTyp` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Umfrage_Team1`
    FOREIGN KEY (`TeamID` )
    REFERENCES `teamio`.`Team` (`idTeam` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teamio`.`UmfrageOptionen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teamio`.`UmfrageOptionen` ;

CREATE  TABLE IF NOT EXISTS `teamio`.`UmfrageOptionen` (
  `idUmfrageOptionen` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NOT NULL ,
  `Datum` DATETIME NULL ,
  `UmfrageID` INT NOT NULL ,
  PRIMARY KEY (`idUmfrageOptionen`) ,
  INDEX `fk_UmfrageOptionen_Umfrage1_idx` (`UmfrageID` ASC) ,
  CONSTRAINT `fk_UmfrageOptionen_Umfrage1`
    FOREIGN KEY (`UmfrageID` )
    REFERENCES `teamio`.`Umfrage` (`idUmfrage` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teamio`.`Statistik`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teamio`.`Statistik` ;

CREATE  TABLE IF NOT EXISTS `teamio`.`Statistik` (
  `idStatistik` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NOT NULL ,
  `EventID` INT NOT NULL ,
  PRIMARY KEY (`idStatistik`) ,
  INDEX `fk_Statistik_Event1_idx` (`EventID` ASC) ,
  CONSTRAINT `fk_Statistik_Event1`
    FOREIGN KEY (`EventID` )
    REFERENCES `teamio`.`Event` (`idEvent` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teamio`.`StatistikAttribut`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teamio`.`StatistikAttribut` ;

CREATE  TABLE IF NOT EXISTS `teamio`.`StatistikAttribut` (
  `idStatistikAttribut` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NOT NULL ,
  `FunktionID` INT NOT NULL ,
  PRIMARY KEY (`idStatistikAttribut`) ,
  INDEX `fk_StatistikWert_Funktion1_idx` (`FunktionID` ASC) ,
  CONSTRAINT `fk_StatistikWert_Funktion1`
    FOREIGN KEY (`FunktionID` )
    REFERENCES `teamio`.`Funktion` (`idFunktion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teamio`.`Statistik_StatistikAttribut`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teamio`.`Statistik_StatistikAttribut` ;

CREATE  TABLE IF NOT EXISTS `teamio`.`Statistik_StatistikAttribut` (
  `idStatistik_StatistikWert` INT NOT NULL AUTO_INCREMENT ,
  `StatistikID` INT NOT NULL ,
  `StatistikAttributID` INT NOT NULL ,
  PRIMARY KEY (`idStatistik_StatistikWert`) ,
  INDEX `fk_Statistik_StatistikWert_Statistik1_idx` (`StatistikID` ASC) ,
  INDEX `fk_Statistik_StatistikWert_StatistikWert1_idx` (`StatistikAttributID` ASC) ,
  CONSTRAINT `fk_Statistik_StatistikWert_Statistik1`
    FOREIGN KEY (`StatistikID` )
    REFERENCES `teamio`.`Statistik` (`idStatistik` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Statistik_StatistikWert_StatistikWert1`
    FOREIGN KEY (`StatistikAttributID` )
    REFERENCES `teamio`.`StatistikAttribut` (`idStatistikAttribut` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teamio`.`StatistikEintrag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teamio`.`StatistikEintrag` ;

CREATE  TABLE IF NOT EXISTS `teamio`.`StatistikEintrag` (
  `idStatistikEintrag` INT NOT NULL AUTO_INCREMENT ,
  `Counter` INT NOT NULL ,
  `StatistikID` INT NOT NULL ,
  `StatistikAttributID` INT NOT NULL ,
  `PersonID` INT NOT NULL ,
  PRIMARY KEY (`idStatistikEintrag`) ,
  INDEX `fk_StatistikEintrag_Statistik1_idx` (`StatistikID` ASC) ,
  INDEX `fk_StatistikEintrag_StatistikWert1_idx` (`StatistikAttributID` ASC) ,
  INDEX `fk_StatistikEintrag_Person1_idx` (`PersonID` ASC) ,
  CONSTRAINT `fk_StatistikEintrag_Statistik1`
    FOREIGN KEY (`StatistikID` )
    REFERENCES `teamio`.`Statistik` (`idStatistik` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StatistikEintrag_StatistikWert1`
    FOREIGN KEY (`StatistikAttributID` )
    REFERENCES `teamio`.`StatistikAttribut` (`idStatistikAttribut` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StatistikEintrag_Person1`
    FOREIGN KEY (`PersonID` )
    REFERENCES `teamio`.`Person` (`idPerson` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teamio`.`EventAnmeldung`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teamio`.`EventAnmeldung` ;

CREATE  TABLE IF NOT EXISTS `teamio`.`EventAnmeldung` (
  `idEvent_Person` INT NOT NULL AUTO_INCREMENT ,
  `Event_idEvent` INT NOT NULL ,
  `Person_idPerson` INT NOT NULL ,
  `Teilnahme` BIT NOT NULL ,
  `Mitfahrgelegenheit` BIT NULL ,
  `Plaetze` INT NULL ,
  PRIMARY KEY (`idEvent_Person`) ,
  INDEX `fk_Event_Person_Event1_idx` (`Event_idEvent` ASC) ,
  INDEX `fk_Event_Person_Person1_idx` (`Person_idPerson` ASC) ,
  CONSTRAINT `fk_Event_Person_Event1`
    FOREIGN KEY (`Event_idEvent` )
    REFERENCES `teamio`.`Event` (`idEvent` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Event_Person_Person1`
    FOREIGN KEY (`Person_idPerson` )
    REFERENCES `teamio`.`Person` (`idPerson` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `teamio` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
