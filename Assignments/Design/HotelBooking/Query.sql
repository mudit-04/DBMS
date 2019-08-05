-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema HotelBooking
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema HotelBooking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `HotelBooking` DEFAULT CHARACTER SET utf8 ;
USE `HotelBooking` ;

-- -----------------------------------------------------
-- Table `HotelBooking`.`Hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HotelBooking`.`Hotel` (
  `Hotel_ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Ratings` VARCHAR(45) NULL,
  PRIMARY KEY (`Hotel_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HotelBooking`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HotelBooking`.`Customer` (
  `Customer_ID` INT NOT NULL,
  `First_Name` VARCHAR(45) NOT NULL,
  `Last_Name` VARCHAR(45) NULL,
  `Booking_ID` INT NULL,
  `First_Visit` TINYINT(1) NOT NULL,
  PRIMARY KEY (`Customer_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HotelBooking`.`Booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HotelBooking`.`Booking` (
  `Booking_ID` INT NOT NULL,
  `Room_Number` VARCHAR(45) NOT NULL,
  `CheckIn_Date` DATETIME NOT NULL,
  `Hotel_ID` INT NOT NULL,
  `Customer_ID` INT NOT NULL,
  PRIMARY KEY (`Booking_ID`),
  INDEX `fk_Booking_Hotel_idx` (`Hotel_ID` ASC),
  INDEX `fk_Booking_Customer1_idx` (`Customer_ID` ASC),
  CONSTRAINT `fk_Booking_Hotel`
    FOREIGN KEY (`Hotel_ID`)
    REFERENCES `HotelBooking`.`Hotel` (`Hotel_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_Customer1`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `HotelBooking`.`Customer` (`Customer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
