CREATE DATABASE LaptopProject;

CREATE TABLE CPU_Model (
	cpu_id char(30) UNIQUE NOT NULL, 
    PRIMARY KEY (cpu_id),
    
	core_thread char(10) NOT NULL,
    cpu_base_freq int,
    cpu_max_freq int,
    cpu_cache int,
    gpu char(30)
);

CREATE TABLE CPU (
	cpu_brand char(30) NOT NULL,
	cpu_modifier char(30) NOT NULL,
	cpu_id char(30) UNIQUE NOT NULL
);

CREATE TABLE GPU_Model (
	gpu_id char(30) UNIQUE NOT NULL, 
    PRIMARY KEY (gpu_id),
    
    gpu_base_freq int,
    gpu_max_freq int,
    gpu_mem_size int
);

CREATE TABLE GPU (
	gpu_brand char(30) NOT NULL,
	gpu_modifier char(30) NOT NULL,
	gpu_id char(30) UNIQUE NOT NULL
);

CREATE TABLE RAM (
	ram_id char(50),
    PRIMARY KEY (ram_id),
    
	ram_gen char(10),
    ram_mem_size int,
    ram_bus int
);

CREATE TABLE HDD (
	hdd_id char(50),
    PRIMARY KEY (hdd_id),
    
    hdd_capacity int,
    hdd_rpm int
);

CREATE TABLE SSD (
	ssd_id char(50),
    PRIMARY KEY (ssd_id),
    
    ssd_type char(20),
    ssd_capacity int
);

CREATE TABLE Screen (
	screen_id char(50),
    PRIMARY KEY (screen),
    
    resolution char(20),
    refresh_rate int
);

CREATE TABLE Battery (
	battery_id char(50),
    PRIMARY KEY (battery_id),
    
    cell int,
    battery_capacity char(10) # Sometime unit can be Wh or mAh
)