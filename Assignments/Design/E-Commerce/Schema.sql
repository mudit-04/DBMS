-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Ecommerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ecommerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ecommerce` DEFAULT CHARACTER SET utf8 ;
USE `Ecommerce` ;

-- -----------------------------------------------------
-- Table `Ecommerce`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Supplier` (
  `Supplier_ID` INT NOT NULL AUTO_INCREMENT,
  `Address` VARCHAR(45) NOT NULL,
  `Contact` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Supplier_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Customer` (
  `Customer_ID` INT NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Contact` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Customer_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Order` (
  `Order_ID` INT NOT NULL,
  `Shipping_Date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Order_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Item` (
  `Item_ID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Price` INT NOT NULL,
  `Rating` INT NULL,
  `Brand` VARCHAR(45) NOT NULL,
  `Supplier_Supplier_ID` INT NOT NULL,
  `Order_Order_ID` INT NOT NULL,
  `Customer_Customer_ID` INT NOT NULL,
  PRIMARY KEY (`Item_ID`),
  INDEX `fk_Item_Supplier_idx` (`Supplier_Supplier_ID` ASC),
  INDEX `fk_Item_Order1_idx` (`Order_Order_ID` ASC),
  INDEX `fk_Item_Customer1_idx` (`Customer_Customer_ID` ASC),
  CONSTRAINT `fk_Item_Supplier`
    FOREIGN KEY (`Supplier_Supplier_ID`)
    REFERENCES `Ecommerce`.`Supplier` (`Supplier_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Item_Order1`
    FOREIGN KEY (`Order_Order_ID`)
    REFERENCES `Ecommerce`.`Order` (`Order_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Item_Customer1`
    FOREIGN KEY (`Customer_Customer_ID`)
    REFERENCES `Ecommerce`.`Customer` (`Customer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
