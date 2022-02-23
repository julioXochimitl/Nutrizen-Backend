-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema NutriZen
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema NutriZen
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `NutriZen` DEFAULT CHARACTER SET utf8 ;
USE `NutriZen` ;

-- -----------------------------------------------------
-- Table `NutriZen`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NutriZen`.`usuarios` (
  `id_usuario` INT(200) NOT NULL,
  `correo` VARCHAR(50) NOT NULL,
  `contraseña` VARCHAR(50) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(50) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NutriZen`.`pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NutriZen`.`pagos` (
  `id_pagos` INT(200) NOT NULL,
  `id_usuario` INT(200) NOT NULL,
  `dir_factura` VARCHAR(200) NOT NULL,
  `num_tarjeta` VARCHAR(20) NOT NULL,
  `cuenta_paypal` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_pagos`),
  CONSTRAINT `fk_pagos_usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `NutriZen`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NutriZen`.`carrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NutriZen`.`carrito` (
  `id_carrito` INT(200) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `precio` FLOAT(10) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `imagen` VARCHAR(50) NULL,
  `id_usuario` INT(200) NOT NULL,
  `id_servicio` INT(200) NOT NULL,
  `id_producto` INT(200) NOT NULL,
  `id_pagos` INT(200) NOT NULL,
  PRIMARY KEY (`id_carrito`),
  UNIQUE INDEX `id_usuario_UNIQUE` (`id_usuario` ASC) VISIBLE,
  INDEX `fk_carrito_pagos1_idx` (`id_pagos` ASC) VISIBLE,
  CONSTRAINT `fk_carrito_usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `NutriZen`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carrito_pagos1`
    FOREIGN KEY (`id_pagos`)
    REFERENCES `NutriZen`.`pagos` (`id_pagos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NutriZen`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NutriZen`.`categorias` (
  `id_categorias` INT(200) NOT NULL,
  `nomb_categoria` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_categorias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NutriZen`.`subcategorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NutriZen`.`subcategorias` (
  `id_subcat` INT(200) NOT NULL,
  `id_categorias` INT(200) NOT NULL,
  `nombre_subcategoria` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_subcat`),
  INDEX `fk_subcategorias_categorias1_idx` (`id_categorias` ASC) VISIBLE,
  CONSTRAINT `fk_subcategorias_categorias1`
    FOREIGN KEY (`id_categorias`)
    REFERENCES `NutriZen`.`categorias` (`id_categorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NutriZen`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NutriZen`.`productos` (
  `id_productos` INT(200) NOT NULL,
  `id_subcategoria` INT(200) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `precio` FLOAT(10) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `imagen` VARCHAR(50) NOT NULL,
  `id_carrito` INT(200) NOT NULL,
  INDEX `fk_productos_subcategorias1_idx` (`id_subcategoria` ASC) VISIBLE,
  PRIMARY KEY (`id_productos`),
  CONSTRAINT `fk_productos_subcategorias1`
    FOREIGN KEY (`id_subcategoria`)
    REFERENCES `NutriZen`.`subcategorias` (`id_subcat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_carrito1`
    FOREIGN KEY (`id_carrito`)
    REFERENCES `NutriZen`.`carrito` (`id_carrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NutriZen`.`servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NutriZen`.`servicios` (
  `id_servicios` INT(200) NOT NULL,
  `id_subcategoria` INT(200) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `precio` FLOAT(10) NOT NULL,
  `id_carrito` INT(200) NOT NULL,
  PRIMARY KEY (`id_servicios`),
  INDEX `fk_servicios_subcategorias1_idx` (`id_subcategoria` ASC) VISIBLE,
  INDEX `fk_servicios_carrito1_idx` (`id_carrito` ASC) VISIBLE,
  CONSTRAINT `fk_servicios_subcategorias1`
    FOREIGN KEY (`id_subcategoria`)
    REFERENCES `NutriZen`.`subcategorias` (`id_subcat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicios_carrito1`
    FOREIGN KEY (`id_carrito`)
    REFERENCES `NutriZen`.`carrito` (`id_carrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
