USE laptop_store;

INSERT INTO integratedgpu (igpu_id, igpu_name) VALUES ('UHD 630','Intel UHD Graphics 630');
INSERT INTO cpumodel (cpu_model, core, thread, cpu_base_freq, cpu_max_freq, cache, igpu_id) VALUES ('8750H',6,12,2.2,4.1,9,'UHD 630');
INSERT INTO cpu (cpu_brand_id, cpu_modifier, cpu_model) VALUES (1,'Core i7','8750H');

INSERT INTO gpu (gpu_brand_id, gpu_modifier, gpu_model, gpu_capacity1, gpu_capacity2, gpu_bus_type) VALUES (1,'GeForce GTX','1080 Max-Q',8,NULL,'GDDR5X');

INSERT INTO operatingsystem (os_id, os_name) VALUES (1,'Windows 10 Home');

INSERT INTO laptopbrand (laptop_brand_id, laptop_brand_name) VALUES (1,'Dell');
INSERT INTO brandseries (brand_series_id, laptop_brand_id, brand_series_name) VALUES (4,1,'XPS');

INSERT INTO laptopmodel (laptop_model, cpu_model, gpu_model, gpu_option) 							VALUES ('300 PH315-51-759Y','8750H','1060',2);
INSERT INTO laptop 		(brand_series_id, laptop_model, os_id, laptop_price, date_released, image) 	VALUES (3,'300 PH315-51-759Y',4,40999000,NULL,'Laptop-Acer-Predator-Helios-300-G3-572-50XL-2.jpg');
INSERT INTO ram 		(laptop_model, ram_generation, ram_capacity, ram_bus) 						VALUES ('300 PH315-51-759Y','DDR4',16,2666);
INSERT INTO hdd 		(laptop_model, hdd_capacity, rpm) 											VALUES ('300 PH315-51-759Y',1024,5400);
INSERT INTO ssd 		(laptop_model, ssd_capacity, ssd_type_id) 									VALUES ('5 SF5 (NX.H7HSV.002)',256,3);
INSERT INTO display 	(laptop_model, screen_size, resolution, refresh_rate)						VALUES ('300 PH315-51-759Y',15.6,'1920x1080',60);
INSERT INTO battery 	(laptop_model, cell, battery_capacity, power_unit) 							VALUES ('300 PH315-51-759Y',4,3220,'mAh');