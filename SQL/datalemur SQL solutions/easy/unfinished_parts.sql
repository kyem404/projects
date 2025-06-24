SELECT part, assembly_step FROM parts_assembly
where finish_date is null and assembly_step > 2;
