-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema IRCTC
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema IRCTC
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `IRCTC` DEFAULT CHARACTER SET utf8 ;
USE `IRCTC` ;

-- -----------------------------------------------------
-- Table `IRCTC`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IRCTC`.`Customer` (
  `Customer_ID` INT NOT NULL,
  `First_Name` VARCHAR(45) NOT NULL,
  `Last_Name` VARCHAR(45) NULL,
  `Age` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Customer_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IRCTC`.`Train`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IRCTC`.`Train` (
  `Train_ID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Start_Station` VARCHAR(45) NOT NULL,
  `End_Station` VARCHAR(45) NOT NULL,
  `Arrival_Time` DATETIME NOT NULL,
  PRIMARY KEY (`Train_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IRCTC`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IRCTC`.`Ticket` (
  `Ticket_ID` INT NOT NULL,
  `Status` TINYINT(1) NOT NULL,
  `Price` INT(11) NULL,
  `Seat_Number` VARCHAR(45) NULL,
  `Train_ID` INT NOT NULL,
  `Customer_Customer_ID` INT NOT NULL,
  PRIMARY KEY (`Ticket_ID`),
  INDEX `fk_Ticket_Train_idx` (`Train_ID` ASC),
  INDEX `fk_Ticket_Customer1_idx` (`Customer_Customer_ID` ASC),
  CONSTRAINT `fk_Ticket_Train`
    FOREIGN KEY (`Train_ID`)
    REFERENCES `IRCTC`.`Train` (`Train_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ticket_Customer1`
    FOREIGN KEY (`Customer_Customer_ID`)
    REFERENCES `IRCTC`.`Customer` (`Customer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
