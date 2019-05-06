USE laptop_store;
SELECT 
    CONCAT(cpubrand.cpu_brand_name, ' ', 
			cpu.cpu_modifier, ' ', 
			cpu.cpu_model, ' (',
            cpumodel.core, ' Cores ',
            cpumodel.thread, ' Threads, ',
            cpumodel.cpu_base_freq, ' GHz',
            if(cpumodel.cpu_max_freq is not null , CONCAT(' up to ', cpumodel.cpu_max_freq, ' GHz'), ''), ', ',
            cpumodel.cache, ' MB cache)') AS `Laptop CPU`
FROM
    cpubrand,
    cpu,
    cpumodel
WHERE
    cpubrand.cpu_brand_id = cpu.cpu_brand_id
        AND cpu.cpu_model = cpumodel.cpu_model;