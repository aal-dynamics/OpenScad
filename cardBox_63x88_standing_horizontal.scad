module cardBox_63x88(x = 100, xholes = 2, yholes = 1) {
	y = 97;
	z = 70;

	radius = z * 0.3;
	diameter = r * 2;

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

		// rotate([0, -90,0])
		// 	translate([y * 0.5 + r, z * 0.5 + r, -material]) 
		// 		cylinder(h = material, d = diameter);
	}
}

cardBox_63x88(x = 138, xholes = 0);

y = 97;
	z = 70;

	r = z * 0.3;
	d = r * 2;
	material = 1.2;
	
	color ("red"){
		rotate([0, -90, 0]) {
			translate([y * 0.5, z * 0.5 +r/2, -material]) 
				cylinder(h = material, d = d);
		}
		// translate([0, y/2 - d/2, z -r])
		// 	cube(size = [material, d, r]);
	}