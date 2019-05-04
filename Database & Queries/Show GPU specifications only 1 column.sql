SELECT 
    CONCAT(gpubrand.gpu_brand_name, ' ', 
			gpu.gpu_modifier, ' ', 
			gpu.gpu_model, ' ',
            gpu.gpu_capacity1,
            if(gpu.gpu_capacity2 is not null , CONCAT(' / ', gpu.gpu_capacity2), ''), ' GB ',
            gpu.gpu_bus_type) AS `Laptop CPU`
FROM
    gpubrand,
    gpu
WHERE
    gpubrand.gpu_brand_id = gpu.gpu_brand;