USE laptop_store;
SELECT
    CONCAT(laptopbrand.laptop_brand_name, ' ', brandseries.laptop_series_name, ' ', laptop.laptop_model) AS `Laptop`,
    CONCAT(cpubrand.cpu_brand_name, ' ', 
			cpu.cpu_modifier, ' ', 
			cpu.cpu_model, ' (',
            cpumodel.core, ' Cores ',
            cpumodel.thread, ' Threads, ',
            cpumodel.cpu_base_freq, ' GHz',
            IF(cpumodel.cpu_max_freq IS NOT NULL , CONCAT(' up to ', cpumodel.cpu_max_freq, ' GHz'), ''), ', ',
            cpumodel.cache, ' MB cache)') AS `CPU`,
	CONCAT(ram.ram_capacity, ' GB ', ram.ram_generation, ' ', ram.ram_bus, ' MHz') AS `RAM`,
    CASE
		WHEN laptopmodel.laptop_gpu_model IS NOT NULL AND laptopmodel.laptop_gpu_option = 1 THEN
			CONCAT(gpubrand.gpu_brand_name, ' ', gpu.gpu_modifier, ' ', gpu.gpu_model, ' ', gpu.gpu_capacity1, ' ', gpu.gpu_bus_type)
		WHEN laptopmodel.laptop_gpu_model IS NOT NULL AND laptopmodel.laptop_gpu_option = 2 THEN
			CONCAT(gpubrand.gpu_brand_name, ' ', gpu.gpu_modifier, ' ', gpu.gpu_model, ' ', gpu.gpu_capacity2, ' ', gpu.gpu_bus_type)
		ELSE 
			CONCAT(integratedgpu.igpu_name, '')
	END AS `GPU`,
	CONCAT(' ', ' ') AS `HDD`,
    CONCAT(' ', ' ') AS `SSD`,
    CONCAT(' ', ' ') AS `Display`,
    CONCAT(' ', ' ') AS `Battery`
FROM
    laptopbrand,
    brandseries,
    laptop,
    laptopmodel,
    cpubrand,
    cpu,
    cpumodel,
    integratedgpu,
    ram,
    gpu,
    gpubrand
WHERE 
	laptopbrand.laptop_brand_id = brandseries.laptop_brand_id AND
	brandseries.brand_series_id = laptop.brand_series_id AND
    laptop.laptop_model = laptopmodel.laptop_model AND
    
    laptopmodel.laptop_cpu_model = cpu.cpu_model AND
	cpubrand.cpu_brand_id = cpu.cpu_brand_id AND
    cpu.cpu_model = cpumodel.cpu_model AND
    cpumodel.integrated_gpu IN (SELECT DISTINCT  cpumodel.integrated_gpu
								FROM cpumodel, integratedgpu
                                WHERE cpumodel.integrated_gpu = integratedgpu.igpu_id)  AND
    
    laptopmodel.laptop_model = ram.laptop_model;
    
    #laptopmodel.laptop_gpu_model = gpu.gpu_model;
    #gpu.gpu_brand = gpubrand.gpu_brand_id;
    