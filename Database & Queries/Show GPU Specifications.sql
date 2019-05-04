SELECT 
    gpubrand.gpu_brand_name AS `Brand`,
	gpu.gpu_modifier AS `Modifier`,
	gpu.gpu_model AS `model`,
	gpu.gpu_capacity1 AS `Memory capacity 1 (GB)`,
	gpu.gpu_capacity2 AS `Memory capacity 2 (GB)`,
	gpu.gpu_bus_type AS `Bus type`
FROM
    gpubrand,
    gpu
WHERE
    gpubrand.gpu_brand_id = gpu.gpu_brand;