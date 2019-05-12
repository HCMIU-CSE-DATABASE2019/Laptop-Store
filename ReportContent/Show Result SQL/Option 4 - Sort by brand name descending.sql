USE laptop_store;
SELECT
	laptop.image AS `Image`,
    
    CONCAT(
		laptopbrand.laptop_brand_name, ' ',
        brandseries.brand_series_name, ' ',
        laptop.laptop_model
	) AS `Laptop`,
    
	CONCAT(
		cpubrand.cpu_brand_name, ' ', 
		cpu.cpu_modifier, ' ', 
		cpu.cpu_model, ' (',
		cpumodel.core, ' Cores ',
		cpumodel.thread, ' Threads, ',
		cpumodel.cpu_base_freq, ' GHz',
		IF(cpumodel.cpu_max_freq IS NOT NULL , 
			CONCAT(' up to ', cpumodel.cpu_max_freq, ' GHz'),
            ''
		), ', ',        
		cpumodel.cache, ' MB cache)'
	) AS `CPU`,
    
	CONCAT(
		ram.ram_capacity, ' GB ',
        ram.ram_generation, ' ',
        IF (ram.ram_bus IS NOT NULL, 
			CONCAT(ram.ram_bus, ' MHz'),
            ''
		)
	) AS `RAM`,

	CONCAT(
		CASE
			WHEN laptopmodel.gpu_model IS NOT NULL AND laptopmodel.gpu_option = 1 THEN
				CONCAT(
					gpubrand.gpu_brand_name, ' ',
					gpu.gpu_modifier, ' ',
					gpu.gpu_model, ' ',
					gpu.gpu_capacity1, ' GB / '
				)
			WHEN laptopmodel.gpu_model IS NOT NULL AND laptopmodel.gpu_option = 2 THEN
				CONCAT(
					gpubrand.gpu_brand_name, ' ',
					gpu.gpu_modifier, ' ',
					gpu.gpu_model, ' ',
					gpu.gpu_capacity2, ' GB / '
				)
			ELSE ''
		END 
		, integratedgpu.igpu_name) AS `GPU`,

	IF (hdd.laptop_model IS NOT NULL,
		CONCAT(
			IF(hdd.hdd_capacity % 1024 = 0, 
				CONCAT(ROUND(hdd.hdd_capacity / 1024, 0), ' TB'), 
				CONCAT(hdd.hdd_capacity, ' GB')
			), ' ',
			IF(hdd.rpm IS NOT NULL ,
				CONCAT(hdd.rpm, ' rpm'),
				''
			)
		),
		null
    ) AS `HDD`,
 
	IF (ssd.laptop_model IS NOT NULL,
		CONCAT(
			IF(ssd.ssd_capacity % 1024 = 0, 
				CONCAT(ROUND(ssd.ssd_capacity / 1024, 0), ' TB'), 
				CONCAT(ssd.ssd_capacity, ' GB')
			), ' ',
            IF(ssdtype.ssd_type_name IS NOT NULL,
				ssdtype.ssd_type_name,
                ''
			)
		),
		null
    ) AS `SSD`,
    
    CONCAT(
		display.screen_size, ' inch ',
		display.resolution, ' ',
        display.refresh_rate, ' Hz'
	) AS `Display`,
    
    CONCAT(
		IF (battery.cell IS NOT NULL,
			CONCAT(battery.cell, ' cells '),
            ''
		),
        IF (battery.battery_capacity IS NOT NULL AND battery.power_unit IS NOT NULL,
			CONCAT(battery.battery_capacity, ' ', battery.power_unit),
            ''
		)			 
	) AS `Battery`,
    
   IF (laptop.os_id IS NOT NULL,
		operatingsystem.os_name,
		'Free DOS')
	AS `OS`,
    
    # Use this to display price with comma on UI
    CONCAT(FORMAT(laptop.laptop_price, 0), ' VND') AS `Price`
    
    # Use this to sorting by price
	# CONCAT(laptop.laptop_price, ' VND') AS `Price`
    
FROM
    laptopbrand,
    brandseries,
    laptop,
    operatingsystem,
    laptopmodel

LEFT JOIN cpu 			ON laptopmodel.cpu_model = cpu.cpu_model
LEFT JOIN cpumodel 		ON cpu.cpu_model = cpumodel.cpu_model
LEFT JOIN cpubrand 		ON cpu.cpu_brand_id = cpubrand.cpu_brand_id
LEFT JOIN integratedgpu ON cpumodel.igpu_id = integratedgpu.igpu_id
LEFT JOIN ram 			ON laptopmodel.laptop_model = ram.laptop_model
LEFT JOIN gpu 			ON laptopmodel.gpu_model = gpu.gpu_model
LEFT JOIN gpubrand 		ON gpu.gpu_brand_id = gpubrand.gpu_brand_id
LEFT JOIN ssd 			ON laptopmodel.laptop_model = ssd.laptop_model
LEFT JOIN ssdtype		ON ssd.ssd_type_id = ssdtype.ssd_type_id
LEFT JOIN hdd 			ON laptopmodel.laptop_model = hdd.laptop_model
LEFT JOIN display 		ON laptopmodel.laptop_model = display.laptop_model
LEFT JOIN battery 		ON laptopmodel.laptop_model = battery.laptop_model
    
WHERE 
	laptopbrand.laptop_brand_id = brandseries.laptop_brand_id AND
	brandseries.brand_series_id = laptop.brand_series_id AND
    laptop.laptop_model = laptopmodel.laptop_model AND
    operatingsystem.os_id = laptop.os_id
    
ORDER BY laptopbrand.laptop_brand_name DESC