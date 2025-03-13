module touchGap(width, height, material = 1.2) {
	translate([0, 0, -height]) {
		cube (size = [material, width, height]);
	
	translate([0, width /2, 0])
		rotate([0, 90, 0]) 
			cylinder(h = material, d = width);
	}
}

module hashedSquare(x, y, z = 1.2, space = 5) {
    angle = 30;
	steps = space + z;

	count = round((x + y) / steps) + 1;
	echo ("count:", count);
	echo ("steps:", steps);

    difference() {
        cube([x, y, z]);

		for (i = [0: 1: count]) {
			translate([i * steps, -z, 0])
				rotate([0, 0, angle])
					cube([z, y / cos(angle) + z *2, z]);
			translate([x - i * steps, -z, 0])
				rotate([0, 0, -angle])
					cube([z, y / cos(angle) + z *2, z]);
		}
    }
}

module cardBox_63x88(x = 100, touchGaps = [false, true, false, true]) {
	y = 70;
	z = 97;

	radius = y * 0.3;
	diameter = y * 0.6;

	material = 1.2;

	difference() {
		cube(size = [x, y, z]);
		
		translate([material, material, material])
			cube(size = [x - (material * 2), y - (material * 2), z - material]);
		
		translate([0, (y - diameter) /2, z])
			#touchGap(width = diameter, height = diameter * 0.75);

		translate([x -1.6, (y - diameter) /2, z])
			#touchGap(width = diameter, height = diameter * 0.75, material = 2);

	}
}

cardBox_63x88(x = 65);