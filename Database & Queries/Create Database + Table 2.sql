CREATE TABLE `laptop_store`.`ssd` (
  `laptop_model` VARCHAR(45) NOT NULL,
  `ssd_capaciry` INT(10) NOT NULL,
  `ssd_type` INT(11) NOT NULL,
  UNIQUE INDEX `laptop_model_UNIQUE` (`laptop_model` ASC) VISIBLE,
  INDEX `ssd_type_idx` (`ssd_type` ASC) VISIBLE,
  CONSTRAINT `ssd_laptop_model`
    FOREIGN KEY (`laptop_model`)
    REFERENCES `laptop_store`.`laptopmodel` (`laptop_model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ssd_type_id`
    FOREIGN KEY (`ssd_type`)
    REFERENCES `laptop_store`.`ssdtype` (`ssd_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE `laptop_store`.`laptop` 
ADD INDEX `fk_laptop_model_idx` (`laptop_model` ASC) VISIBLE,
ADD INDEX `os_id_idx` (`os_id` ASC) VISIBLE;
;
ALTER TABLE `laptop_store`.`laptop` 
ADD CONSTRAINT `fk_laptop_model`
  FOREIGN KEY (`laptop_model`)
  REFERENCES `laptop_store`.`laptopmodel` (`laptop_model`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `os_id`
  FOREIGN KEY (`os_id`)
  REFERENCES `laptop_store`.`operatingsystem` (`os_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
