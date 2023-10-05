-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`games` (
  `idgames` INT NOT NULL,
  `valorant` VARCHAR(45) NULL,
  `Call Of Duty` VARCHAR(45) NULL,
  `League of Legends` VARCHAR(45) NULL,
  `Minecraft` VARCHAR(45) NULL,
  PRIMARY KEY (`idgames`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`username`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`username` (
  `idusername` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `games_idgames` INT NOT NULL,
  PRIMARY KEY (`idusername`),
  INDEX `fk_username_games1_idx` (`games_idgames` ASC) VISIBLE,
  CONSTRAINT `fk_username_games1`
    FOREIGN KEY (`games_idgames`)
    REFERENCES `mydb`.`games` (`idgames`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`all achievements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`all achievements` (
  `idall achievements` INT NOT NULL,
  `sniper` VARCHAR(45) NULL,
  `one shot` VARCHAR(45) NULL,
  `mercinary` VARCHAR(45) NULL,
  `hot head` VARCHAR(45) NULL,
  `username_idusername` INT NOT NULL,
  PRIMARY KEY (`idall achievements`),
  INDEX `fk_all achievements_username_idx` (`username_idusername` ASC) VISIBLE,
  CONSTRAINT `fk_all achievements_username`
    FOREIGN KEY (`username_idusername`)
    REFERENCES `mydb`.`username` (`idusername`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`achieved achievements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`achieved achievements` (
  `idachieved achievements` INT NOT NULL,
  `sniper` VARCHAR(45) NULL,
  `hot head` VARCHAR(45) NULL,
  `username_idusername` INT NOT NULL,
  PRIMARY KEY (`idachieved achievements`),
  INDEX `fk_achieved achievements_username1_idx` (`username_idusername` ASC) VISIBLE,
  CONSTRAINT `fk_achieved achievements_username1`
    FOREIGN KEY (`username_idusername`)
    REFERENCES `mydb`.`username` (`idusername`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`played games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`played games` (
  `idplayed games` INT NOT NULL,
  `valorant` VARCHAR(45) NULL,
  `username_idusername` INT NOT NULL,
  PRIMARY KEY (`idplayed games`),
  INDEX `fk_played games_username1_idx` (`username_idusername` ASC) VISIBLE,
  CONSTRAINT `fk_played games_username1`
    FOREIGN KEY (`username_idusername`)
    REFERENCES `mydb`.`username` (`idusername`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
