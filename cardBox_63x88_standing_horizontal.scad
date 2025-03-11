module cardBox_63x88(x = 100, xholes = 2, yholes = 1) {
	y = 70;
	z = 97;

	radius = z * 0.3;
	diameter = radius * 2;

	material = 1.2;

	difference() {
		cube(size = [x, y, z]);
		
		translate([material, material, material])
			cube(size = [x - (material * 2), y - (material * 2), z - material]);
		
		if (xholes > 0) {
			for(i = [0: 1: xholes -1]) {
				rotate([90,0,0])
					translate([z * 0.5 + (i * (x / xholes)), z * 0.5, -material]) 
						cylinder(h = material, d = diameter);
			}
		}
		translate([0, y * 0.5, z * 0.7])
			rotate([0, 90, 0]) 
				cylinder(h = material, d = diameter);
	
		translate([0, (y - diameter) /2, z-radius]) 
			cube (size = [material, diameter, radius]);

		translate([x - material, y * 0.5, z * 0.7])
			rotate([0, 90, 0]) 
				cylinder(h = material, d = diameter);
	
		translate([x - material, (y-diameter) /2, z-radius]) 
			cube (size = [material, diameter, radius]);
	}
}

cardBox_63x88(x = 65, xholes = 0);