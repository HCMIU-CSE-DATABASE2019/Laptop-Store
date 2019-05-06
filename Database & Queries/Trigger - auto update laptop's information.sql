CREATE DEFINER=`root`@`localhost` TRIGGER `laptopmodel_AFTER_UPDATE` AFTER UPDATE ON `laptopmodel` FOR EACH ROW BEGIN
	UPDATE laptopmodel, laptop, ram, hdd, ssd, battery, screen
    SET 
		laptop.laptop_model = laptopmodel.laptop_model,
		ram.laptop_model = laptopmodel.laptop_model,
        hdd.laptop_model = IF (EXISTS (SELECT laptopmodel.laptop_model
										FROM laptopmodel, hdd
										WHERE laptopmodel.laptop_model = hdd.laptop_model), 
							laptopmodel.laptop_model, 
                            null),
		ssd.laptop_model = IF (EXISTS (SELECT laptopmodel.laptop_model
										FROM laptopmodel, ssd
										WHERE laptopmodel.laptop_model = ssd.laptop_model), 
							laptopmodel.laptop_model, 
                            null),
        screen.laptop_model = laptopmodel.laptop_model,
        battery.laptop_model = laptopmodel.laptop_model;
END