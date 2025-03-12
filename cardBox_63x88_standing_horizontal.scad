module touchgapGap(width, height, material = 1.2) {
	translate([0, 0, -height]) {
		cube (size = [material, width, height]);
	
	translate([0, width /2, 0])
		rotate([0, 90, 0]) 
			cylinder(h = material, d = width);
	}
}

module cardBox_63x88(x = 100, xholes = 2, yholes = 1) {
	y = 70;
	z = 97;

	radius = y * 0.3;
	diameter = y * 0.6;

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
		
		translate([0, (y - diameter) /2, z])
			#touchgapGap(width = diameter, height = diameter * 0.75);

		translate([x -1.6, (y - diameter) /2, z])
			#touchgapGap(width = diameter, height = diameter * 0.75, material = 2);

	}
}

cardBox_63x88(x = 65, xholes = 0);

// y = 70;
// 	z = 97;

// 	radius = y * 0.3;
// 	diameter = y * 0.6;

// 	material = 1.2;
// color("red"){
// 			translate([0, (y - diameter) /2, z])
// 				touchgapGap(width = diameter, height = diameter * 0.75);
// 		}