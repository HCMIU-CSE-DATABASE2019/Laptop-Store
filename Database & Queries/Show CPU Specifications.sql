USE laptop_store;
SELECT 
	cpubrand.cpu_brand_name AS `Brand`, 
    cpu.cpu_modifier AS `Modifier`,
    cpu.cpu_model AS `Model`,
    cpumodel.core AS `Core(s)`,
    cpumodel.thread AS `Thread(s)`,
    cpumodel.cpu_base_freq AS `Base frequency (GHz)`,
    cpumodel.cpu_max_freq AS `Max frequency (GHz)`,
    cpumodel.cache AS `L3 cache (MB)`,
	integratedgpu.igpu_name AS `Integrated GPU`
FROM cpubrand, cpu, cpumodel, integratedgpu
WHERE
	cpubrand.cpu_brand_id = cpu.cpu_brand_id AND
    cpu.cpu_model = cpumodel.cpu_model AND
    cpumodel.integrated_gpu = integratedgpu.igpu_id;