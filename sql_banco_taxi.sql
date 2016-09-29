-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Motorista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Motorista` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cnh` VARCHAR(45) NULL,
  `nm_motorista` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nm_cliente` VARCHAR(45) NULL,
  `nr_cpf` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Local`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Local` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rua` VARCHAR(45) NULL,
  `complemento` VARCHAR(45) NULL,
  `cep` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Chamado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Chamado` (
  `idChamado` INT NOT NULL AUTO_INCREMENT,
  `dt_chamado` VARCHAR(45) NULL,
  `valor` FLOAT NULL,
  `idCliente` INT NOT NULL,
  `idLocal` INT NOT NULL,
  `idMotorista` INT NOT NULL,
  PRIMARY KEY (`idChamado`),
  INDEX `fk_Chamado_Pessoa1_idx` (`idCliente` ASC),
  INDEX `fk_Chamado_Local1_idx` (`idLocal` ASC),
  INDEX `fk_Chamado_Motorista1_idx` (`idMotorista` ASC),
  CONSTRAINT `fk_Chamado_Pessoa1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `mydb`.`Cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Chamado_Local1`
    FOREIGN KEY (`idLocal`)
    REFERENCES `mydb`.`Local` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Chamado_Motorista1`
    FOREIGN KEY (`idMotorista`)
    REFERENCES `mydb`.`Motorista` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'ChamadocolMotorista_idMotorista';


-- -----------------------------------------------------
-- Table `mydb`.`Ocorrencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ocorrencias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idLocal` INT NOT NULL,
  `idMotorista` INT NOT NULL,
  `tp_ocorrencia` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Ocorrencias_Local1_idx` (`idLocal` ASC),
  INDEX `fk_Ocorrencias_Motorista1_idx` (`idMotorista` ASC),
  CONSTRAINT `fk_Ocorrencias_Local1`
    FOREIGN KEY (`idLocal`)
    REFERENCES `mydb`.`Local` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ocorrencias_Motorista1`
    FOREIGN KEY (`idMotorista`)
    REFERENCES `mydb`.`Motorista` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Carros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Carros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `placa` VARCHAR(45) NULL,
  `idMotorista` INT NOT NULL,
  `modelo` VARCHAR(45) NULL,
  `cor` VARCHAR(45) NULL,
  `ano` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Carros_Motorista_idx` (`idMotorista` ASC),
  CONSTRAINT `fk_Carros_Motorista`
    FOREIGN KEY (`idMotorista`)
    REFERENCES `mydb`.`Motorista` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Feature_driver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Feature_driver` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `features` VARCHAR(45) NULL,
  `idMotorista` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Feature_driver_Motorista1_idx` (`idMotorista` ASC),
  CONSTRAINT `fk_Feature_driver_Motorista1`
    FOREIGN KEY (`idMotorista`)
    REFERENCES `mydb`.`Motorista` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Contato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Contato` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nr_celular` VARCHAR(45) NULL,
  `nr_telefone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `idCliente` INT NOT NULL,
  `idMotorista` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Contato_Pessoa1_idx` (`idCliente` ASC),
  INDEX `fk_Contato_Motorista1_idx` (`idMotorista` ASC),
  CONSTRAINT `fk_Contato_Pessoa1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `mydb`.`Cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contato_Motorista1`
    FOREIGN KEY (`idMotorista`)
    REFERENCES `mydb`.`Motorista` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
