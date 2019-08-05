-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Paytm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Paytm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Paytm` DEFAULT CHARACTER SET utf8 ;
USE `Paytm` ;

-- -----------------------------------------------------
-- Table `Paytm`.`Branches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Paytm`.`Branches` (
  `Branch_ID` INT NOT NULL,
  `Branch_Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Contact` INT NOT NULL,
  PRIMARY KEY (`Branch_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Paytm`.`Accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Paytm`.`Accounts` (
  `Account_ID` INT NOT NULL,
  `Account_Type` VARCHAR(45) NOT NULL,
  `Balance` MEDIUMTEXT NOT NULL,
  `Branche_ID` INT NOT NULL,
  PRIMARY KEY (`Account_ID`),
  INDEX `fk_Accounts_Branches_idx` (`Branche_ID` ASC),
  CONSTRAINT `fk_Accounts_Branches`
    FOREIGN KEY (`Branche_ID`)
    REFERENCES `Paytm`.`Branches` (`Branch_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Paytm`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Paytm`.`Customer` (
  `Customer_ID` INT NOT NULL,
  `First_Name` VARCHAR(45) NOT NULL,
  `Last_Name` VARCHAR(45) NULL,
  PRIMARY KEY (`Customer_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Paytm`.`Accounts_has_Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Paytm`.`Accounts_has_Customer` (
  `Accounts_Account_ID` INT NOT NULL,
  `Customer_Customer_ID` INT NOT NULL,
  INDEX `fk_Accounts_has_Customer_Customer1_idx` (`Customer_Customer_ID` ASC),
  INDEX `fk_Accounts_has_Customer_Accounts1_idx` (`Accounts_Account_ID` ASC),
  PRIMARY KEY (`Accounts_Account_ID`, `Customer_Customer_ID`),
  CONSTRAINT `fk_Accounts_has_Customer_Accounts1`
    FOREIGN KEY (`Accounts_Account_ID`)
    REFERENCES `Paytm`.`Accounts` (`Account_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Accounts_has_Customer_Customer1`
    FOREIGN KEY (`Customer_Customer_ID`)
    REFERENCES `Paytm`.`Customer` (`Customer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
