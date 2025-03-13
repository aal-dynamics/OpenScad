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

module cardBox_63x88(y = 100, touchGaps = [false, false, false, false]) {
	x = 70;	
	z = 95;

	xDiameter = x * 0.6;
	yDiameter = y * 0.6;
	material = 1.2;

	difference() {
		cube(size = [x, y, z]);
		
		translate([material, material, material])
			cube(size = [x - (material * 2), y - (material * 2), z - material]);
		
		if (touchGaps[0]) //front
			translate([xDiameter + (x - xDiameter) /2, 0, z])
				rotate([0,0,90])
					touchGap(width = xDiameter, height = xDiameter * 0.75);

		if (touchGaps[1]) //left
			translate([0, (y - yDiameter) /2, z])
				touchGap(width = yDiameter, height = yDiameter * 0.75);

		if (touchGaps[2]) //back
			translate([xDiameter + (x - xDiameter) /2, y - material * 1.6, z])
				rotate([0,0,90])
					touchGap(width = xDiameter, height = xDiameter * 0.75, material = 2);

		if (touchGaps[3]) //right
			translate([x -1.6, (y - yDiameter) /2, z])
				touchGap(width = yDiameter, height = yDiameter * 0.75, material = 2);

	}
}

cardBox_63x88(y = 65, touchGaps = [true, false, true, false]);