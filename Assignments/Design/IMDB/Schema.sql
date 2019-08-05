-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema IMDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema IMDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `IMDB` DEFAULT CHARACTER SET utf8 ;
USE `IMDB` ;

-- -----------------------------------------------------
-- Table `IMDB`.`Movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMDB`.`Movie` (
  `Movie_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Reslease_Date` DATE NOT NULL,
  PRIMARY KEY (`Movie_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`Actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMDB`.`Actor` (
  `Actor_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Age` VARCHAR(45) NOT NULL,
  `Awards` INT NULL,
  PRIMARY KEY (`Actor_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`TV_Series`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMDB`.`TV_Series` (
  `Tv_Series_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Release_Date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Tv_Series_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`Movie_Actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMDB`.`Movie_Actor` (
  `Movie_Movie_ID` INT NOT NULL,
  `Actor_Actor_ID` INT NOT NULL,
  INDEX `fk_Movie_has_Actor_Actor1_idx` (`Actor_Actor_ID` ASC),
  INDEX `fk_Movie_has_Actor_Movie_idx` (`Movie_Movie_ID` ASC),
  CONSTRAINT `fk_Movie_has_Actor_Movie`
    FOREIGN KEY (`Movie_Movie_ID`)
    REFERENCES `IMDB`.`Movie` (`Movie_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movie_has_Actor_Actor1`
    FOREIGN KEY (`Actor_Actor_ID`)
    REFERENCES `IMDB`.`Actor` (`Actor_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`Actor_TVSeries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMDB`.`Actor_TVSeries` (
  `Actor_ID` INT NOT NULL,
  `TvSeries_ID` INT NOT NULL,
  INDEX `fk_Actor_has_TV_Series_TV_Series1_idx` (`TvSeries_ID` ASC),
  INDEX `fk_Actor_has_TV_Series_Actor1_idx` (`Actor_ID` ASC),
  CONSTRAINT `fk_Actor_has_TV_Series_Actor1`
    FOREIGN KEY (`Actor_ID`)
    REFERENCES `IMDB`.`Actor` (`Actor_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actor_has_TV_Series_TV_Series1`
    FOREIGN KEY (`TvSeries_ID`)
    REFERENCES `IMDB`.`TV_Series` (`Tv_Series_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
