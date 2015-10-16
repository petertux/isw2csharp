-- MySQL Script generated by MySQL Workbench
-- 09/26/15 21:01:02
-- Model: New Model    Version: 1.0
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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`SECCION_BODEGA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SECCION_BODEGA` (
  `id_seccion_bodega` INT NOT NULL,
  `secc_bod_desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_seccion_bodega`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CATEGORIA_PRODUCTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CATEGORIA_PRODUCTO` (
  `id_categoria_producto` INT NOT NULL,
  `cat_descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_categoria_producto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TIPO_VENTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TIPO_VENTA` (
  `id_tipo_venta` INT NOT NULL,
  PRIMARY KEY (`id_tipo_venta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ROL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ROL` (
  `id_rol` INT NOT NULL,
  `rol_desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_rol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`USUARIO` (
  `id_usuario` INT NOT NULL,
  `usu_nombre` VARCHAR(20) NOT NULL,
  `usu_contra` VARCHAR(20) NOT NULL,
  `ROL_id_rol` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `usu_nombre_UNIQUE` (`usu_nombre` ASC),
  INDEX `fk_USUARIO_ROL1_idx` (`ROL_id_rol` ASC),
  CONSTRAINT `fk_USUARIO_ROL1`
    FOREIGN KEY (`ROL_id_rol`)
    REFERENCES `mydb`.`ROL` (`id_rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VENTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VENTA` (
  `id_venta` INT NOT NULL,
  `TIPO_VENTA_id_tipo_venta` INT NOT NULL,
  `vent_fech` DATETIME(10) NOT NULL,
  `USUARIO_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_venta`),
  INDEX `fk_VENTA_TIPO_VENTA1_idx` (`TIPO_VENTA_id_tipo_venta` ASC),
  INDEX `fk_VENTA_USUARIO1_idx` (`USUARIO_id_usuario` ASC),
  CONSTRAINT `fk_VENTA_TIPO_VENTA1`
    FOREIGN KEY (`TIPO_VENTA_id_tipo_venta`)
    REFERENCES `mydb`.`TIPO_VENTA` (`id_tipo_venta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENTA_USUARIO1`
    FOREIGN KEY (`USUARIO_id_usuario`)
    REFERENCES `mydb`.`USUARIO` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PRESENTACION_PRODUCTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PRESENTACION_PRODUCTO` (
  `id_presentacion_producto` INT NOT NULL,
  PRIMARY KEY (`id_presentacion_producto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PRODUCTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PRODUCTO` (
  `id_producto` INT NOT NULL,
  `CATEGORIA_PRODUCTO_id_categoria_producto` INT NOT NULL,
  `INVENTARIO_inventario` INT NOT NULL,
  `PRESENTACION_PRODUCTO_id_presentacion_producto` INT NOT NULL,
  `SECCION_BODEGA_id_seccion_bodega` INT NOT NULL,
  `precio_unit` DOUBLE NOT NULL,
  PRIMARY KEY (`id_producto`),
  INDEX `fk_PRODUCTO_CATEGORIA_PRODUCTO1_idx` (`CATEGORIA_PRODUCTO_id_categoria_producto` ASC),
  INDEX `fk_PRODUCTO_INVENTARIO1_idx` (`INVENTARIO_inventario` ASC),
  INDEX `fk_PRODUCTO_PRESENTACION_PRODUCTO1_idx` (`PRESENTACION_PRODUCTO_id_presentacion_producto` ASC),
  INDEX `fk_PRODUCTO_SECCION_BODEGA1_idx` (`SECCION_BODEGA_id_seccion_bodega` ASC),
  CONSTRAINT `fk_PRODUCTO_CATEGORIA_PRODUCTO1`
    FOREIGN KEY (`CATEGORIA_PRODUCTO_id_categoria_producto`)
    REFERENCES `mydb`.`CATEGORIA_PRODUCTO` (`id_categoria_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUCTO_INVENTARIO1`
    FOREIGN KEY (`INVENTARIO_inventario`)
    REFERENCES `mydb`.`VENTA` (`id_venta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUCTO_PRESENTACION_PRODUCTO1`
    FOREIGN KEY (`PRESENTACION_PRODUCTO_id_presentacion_producto`)
    REFERENCES `mydb`.`PRESENTACION_PRODUCTO` (`id_presentacion_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUCTO_SECCION_BODEGA1`
    FOREIGN KEY (`SECCION_BODEGA_id_seccion_bodega`)
    REFERENCES `mydb`.`SECCION_BODEGA` (`id_seccion_bodega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DEPARTAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DEPARTAMENTO` (
  `id_departamento` INT NOT NULL,
  `dep_nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_departamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MUNICIPIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MUNICIPIO` (
  `id_municipio` INT NOT NULL,
  `mun_nom` VARCHAR(45) NULL,
  `DEPARTAMENTO_id_departamento` INT NOT NULL,
  PRIMARY KEY (`id_municipio`),
  INDEX `fk_MUNICIPIO_DEPARTAMENTO1_idx` (`DEPARTAMENTO_id_departamento` ASC),
  CONSTRAINT `fk_MUNICIPIO_DEPARTAMENTO1`
    FOREIGN KEY (`DEPARTAMENTO_id_departamento`)
    REFERENCES `mydb`.`DEPARTAMENTO` (`id_departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PERSONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PERSONA` (
  `id_persona` INT NOT NULL,
  `per_primer_nombre` VARCHAR(45) NOT NULL,
  `per_seg_nombre` VARCHAR(45) NULL,
  `per_prim_apellido` VARCHAR(45) NOT NULL,
  `per_seg_apellido` VARCHAR(45) NULL,
  `per_num_tel` VARCHAR(8) NULL,
  `per_direcc` VARCHAR(60) NULL,
  `MUNICIPIO_id_municipio` INT NOT NULL,
  `numero_contribuyente` VARCHAR(45) NULL,
  PRIMARY KEY (`id_persona`),
  INDEX `fk_PERSONA_MUNICIPIO1_idx` (`MUNICIPIO_id_municipio` ASC),
  CONSTRAINT `fk_PERSONA_MUNICIPIO1`
    FOREIGN KEY (`MUNICIPIO_id_municipio`)
    REFERENCES `mydb`.`MUNICIPIO` (`id_municipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ORDEN_COMPRA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ORDEN_COMPRA` (
  `id_orden_compra` INT NOT NULL,
  `fecha_orden_compra` DATETIME NOT NULL,
  PRIMARY KEY (`id_orden_compra`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TIPO_NOTA_CREDITO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TIPO_NOTA_CREDITO` (
  `id_tipo_nota_credito` INT NOT NULL,
  PRIMARY KEY (`id_tipo_nota_credito`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`NOTA_CREDITO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`NOTA_CREDITO` (
  `id_nora_credito` INT NOT NULL,
  `FACTURACION_id_facturacion` INT NOT NULL,
  `TIPO_NOTA_CREDITO_id_tipo_nota_credito` INT NOT NULL,
  PRIMARY KEY (`id_nora_credito`),
  INDEX `fk_NOTA_CREDITO_TIPO_NOTA_CREDITO1_idx` (`TIPO_NOTA_CREDITO_id_tipo_nota_credito` ASC),
  CONSTRAINT `fk_NOTA_CREDITO_TIPO_NOTA_CREDITO1`
    FOREIGN KEY (`TIPO_NOTA_CREDITO_id_tipo_nota_credito`)
    REFERENCES `mydb`.`TIPO_NOTA_CREDITO` (`id_tipo_nota_credito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`COMPRA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`COMPRA` (
  `id_compra` INT NOT NULL,
  `PRODUCTO_id_producto` INT NOT NULL,
  `NOTA_CREDITO_id_nora_credito` INT NOT NULL,
  `USUARIO_id_usuario` INT NOT NULL,
  `cantidad_compra` INT NOT NULL,
  `ORDEN_COMPRA_id_orden_compra` INT NOT NULL,
  PRIMARY KEY (`id_compra`),
  INDEX `fk_COMPRA_PRODUCTO1_idx` (`PRODUCTO_id_producto` ASC),
  INDEX `fk_COMPRA_NOTA_CREDITO1_idx` (`NOTA_CREDITO_id_nora_credito` ASC),
  INDEX `fk_COMPRA_USUARIO1_idx` (`USUARIO_id_usuario` ASC),
  INDEX `fk_COMPRA_ORDEN_COMPRA1_idx` (`ORDEN_COMPRA_id_orden_compra` ASC),
  CONSTRAINT `fk_COMPRA_PRODUCTO1`
    FOREIGN KEY (`PRODUCTO_id_producto`)
    REFERENCES `mydb`.`PRODUCTO` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMPRA_NOTA_CREDITO1`
    FOREIGN KEY (`NOTA_CREDITO_id_nora_credito`)
    REFERENCES `mydb`.`NOTA_CREDITO` (`id_nora_credito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMPRA_USUARIO1`
    FOREIGN KEY (`USUARIO_id_usuario`)
    REFERENCES `mydb`.`USUARIO` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMPRA_ORDEN_COMPRA1`
    FOREIGN KEY (`ORDEN_COMPRA_id_orden_compra`)
    REFERENCES `mydb`.`ORDEN_COMPRA` (`id_orden_compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DETA_COMPRA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DETA_COMPRA` (
  `id_deta_compra` INT NOT NULL,
  `COMPRA_id_compra` INT NOT NULL,
  PRIMARY KEY (`id_deta_compra`),
  INDEX `fk_DETA_COMPRA_COMPRA1_idx` (`COMPRA_id_compra` ASC),
  CONSTRAINT `fk_DETA_COMPRA_COMPRA1`
    FOREIGN KEY (`COMPRA_id_compra`)
    REFERENCES `mydb`.`COMPRA` (`id_compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DETALLE_VENTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DETALLE_VENTA` (
  `id_detalle_venta` INT NOT NULL,
  `VENTA_id_venta` INT NOT NULL,
  `PRODUCTO_id_producto` INT NOT NULL,
  `cantidad_detalle_venta` INT NOT NULL,
  PRIMARY KEY (`id_detalle_venta`),
  INDEX `fk_DETALLE_VENTA_VENTA1_idx` (`VENTA_id_venta` ASC),
  INDEX `fk_DETALLE_VENTA_PRODUCTO1_idx` (`PRODUCTO_id_producto` ASC),
  CONSTRAINT `fk_DETALLE_VENTA_VENTA1`
    FOREIGN KEY (`VENTA_id_venta`)
    REFERENCES `mydb`.`VENTA` (`id_venta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DETALLE_VENTA_PRODUCTO1`
    FOREIGN KEY (`PRODUCTO_id_producto`)
    REFERENCES `mydb`.`PRODUCTO` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TIPO_PROVEEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TIPO_PROVEEDOR` (
  `id_tipo_prov` INT NOT NULL,
  `tip_prov_desc` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `id_tipo_prov_UNIQUE` (`id_tipo_prov` ASC),
  PRIMARY KEY (`id_tipo_prov`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PROVEEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PROVEEDOR` (
  `id_prov` INT NOT NULL,
  `prov_nombre` VARCHAR(45) NOT NULL,
  `prov_direccion` VARCHAR(45) NOT NULL,
  `prov_tel` VARCHAR(45) NOT NULL,
  `prov_nit` VARCHAR(45) NOT NULL,
  `prov_iva` VARCHAR(45) NOT NULL,
  `TIPO_PROVEEDOR_id_tipo_prov` INT NOT NULL,
  PRIMARY KEY (`id_prov`),
  INDEX `fk_PROVEEDOR_TIPO_PROVEEDOR1_idx` (`TIPO_PROVEEDOR_id_tipo_prov` ASC),
  CONSTRAINT `fk_PROVEEDOR_TIPO_PROVEEDOR1`
    FOREIGN KEY (`TIPO_PROVEEDOR_id_tipo_prov`)
    REFERENCES `mydb`.`TIPO_PROVEEDOR` (`id_tipo_prov`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`COMPRA_PROVEEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`COMPRA_PROVEEDOR` (
  `id_comp_prov` INT NOT NULL,
  `COMPRA_id_compra` INT NOT NULL,
  `PROVEEDOR_id_prov` INT NOT NULL,
  PRIMARY KEY (`id_comp_prov`),
  UNIQUE INDEX `id_comp_prov_UNIQUE` (`id_comp_prov` ASC),
  INDEX `fk_COMPRA_PROVEEDOR_COMPRA1_idx` (`COMPRA_id_compra` ASC),
  INDEX `fk_COMPRA_PROVEEDOR_PROVEEDOR1_idx` (`PROVEEDOR_id_prov` ASC),
  CONSTRAINT `fk_COMPRA_PROVEEDOR_COMPRA1`
    FOREIGN KEY (`COMPRA_id_compra`)
    REFERENCES `mydb`.`COMPRA` (`id_compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMPRA_PROVEEDOR_PROVEEDOR1`
    FOREIGN KEY (`PROVEEDOR_id_prov`)
    REFERENCES `mydb`.`PROVEEDOR` (`id_prov`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VENTA_PRODUCTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VENTA_PRODUCTO` (
  `id_vent_prod` INT NOT NULL,
  `PRODUCTO_id_producto` INT NOT NULL,
  `VENTA_id_venta` INT NOT NULL,
  `USUARIO_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_vent_prod`),
  UNIQUE INDEX `id_vent_prod_UNIQUE` (`id_vent_prod` ASC),
  INDEX `fk_VENTA_PRODUCTO_PRODUCTO1_idx` (`PRODUCTO_id_producto` ASC),
  INDEX `fk_VENTA_PRODUCTO_VENTA1_idx` (`VENTA_id_venta` ASC),
  INDEX `fk_VENTA_PRODUCTO_USUARIO1_idx` (`USUARIO_id_usuario` ASC),
  CONSTRAINT `fk_VENTA_PRODUCTO_PRODUCTO1`
    FOREIGN KEY (`PRODUCTO_id_producto`)
    REFERENCES `mydb`.`PRODUCTO` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENTA_PRODUCTO_VENTA1`
    FOREIGN KEY (`VENTA_id_venta`)
    REFERENCES `mydb`.`VENTA` (`id_venta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENTA_PRODUCTO_USUARIO1`
    FOREIGN KEY (`USUARIO_id_usuario`)
    REFERENCES `mydb`.`USUARIO` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SUCURSAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SUCURSAL` (
  `id_sucursal` INT NOT NULL,
  `suc_nombre` VARCHAR(45) NOT NULL,
  `suc_direccion` VARCHAR(60) NOT NULL,
  `suc_descripcion` VARCHAR(45) NOT NULL,
  `suc_telefono` VARCHAR(8) NULL,
  `MUNICIPIO_id_municipio` INT NOT NULL,
  PRIMARY KEY (`id_sucursal`),
  INDEX `fk_SUCURSAL_MUNICIPIO1_idx` (`MUNICIPIO_id_municipio` ASC),
  CONSTRAINT `fk_SUCURSAL_MUNICIPIO1`
    FOREIGN KEY (`MUNICIPIO_id_municipio`)
    REFERENCES `mydb`.`MUNICIPIO` (`id_municipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CAJA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CAJA` (
  `id_caja` INT NOT NULL,
  `nombre_caja` VARCHAR(45) NOT NULL,
  `SUCURSAL_id_sucursal` INT NOT NULL,
  PRIMARY KEY (`id_caja`),
  UNIQUE INDEX `id_caja_UNIQUE` (`id_caja` ASC),
  INDEX `fk_CAJA_SUCURSAL1_idx` (`SUCURSAL_id_sucursal` ASC),
  CONSTRAINT `fk_CAJA_SUCURSAL1`
    FOREIGN KEY (`SUCURSAL_id_sucursal`)
    REFERENCES `mydb`.`SUCURSAL` (`id_sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EMPLEADO` (
  `id_empleado` INT NOT NULL,
  `PERSONA_id_persona` INT NOT NULL,
  `USUARIO_id_usuario` INT NOT NULL,
  `SUCURSAL_id_sucursal` INT NOT NULL,
  PRIMARY KEY (`id_empleado`),
  INDEX `fk_EMPLEADO_PERSONA1_idx` (`PERSONA_id_persona` ASC),
  INDEX `fk_EMPLEADO_USUARIO1_idx` (`USUARIO_id_usuario` ASC),
  INDEX `fk_EMPLEADO_SUCURSAL1_idx` (`SUCURSAL_id_sucursal` ASC),
  CONSTRAINT `fk_EMPLEADO_PERSONA1`
    FOREIGN KEY (`PERSONA_id_persona`)
    REFERENCES `mydb`.`PERSONA` (`id_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLEADO_USUARIO1`
    FOREIGN KEY (`USUARIO_id_usuario`)
    REFERENCES `mydb`.`USUARIO` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLEADO_SUCURSAL1`
    FOREIGN KEY (`SUCURSAL_id_sucursal`)
    REFERENCES `mydb`.`SUCURSAL` (`id_sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PRODUCTO_SUCURSAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PRODUCTO_SUCURSAL` (
  `PRODUCTO_id_producto` INT NOT NULL,
  `SUCURSAL_id_sucursal` INT NOT NULL,
  `estado_producto` VARCHAR(45) NULL,
  INDEX `fk_PRODUCTO_SUCURSAL_PRODUCTO1_idx` (`PRODUCTO_id_producto` ASC),
  INDEX `fk_PRODUCTO_SUCURSAL_SUCURSAL1_idx` (`SUCURSAL_id_sucursal` ASC),
  PRIMARY KEY (`PRODUCTO_id_producto`, `SUCURSAL_id_sucursal`),
  CONSTRAINT `fk_PRODUCTO_SUCURSAL_PRODUCTO1`
    FOREIGN KEY (`PRODUCTO_id_producto`)
    REFERENCES `mydb`.`PRODUCTO` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUCTO_SUCURSAL_SUCURSAL1`
    FOREIGN KEY (`SUCURSAL_id_sucursal`)
    REFERENCES `mydb`.`SUCURSAL` (`id_sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
