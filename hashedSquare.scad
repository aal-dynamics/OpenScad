module hashedSquare(x, y, z = 1.2, space = 5) {
    angle = 30;
	steps = space + z;

	xCubes = round(x / steps) + 1;
	yCubes = round(y / steps) + 1;
	
	echo ("xCubes:", xCubes);
	echo ("yCubes:", yCubes);
	echo ("steps:", steps);

    difference() {
        cube([x, y, z]);

		for (i = [0: 1: xCubes]) {
			translate([i * steps, -z, 0])
				rotate([0, 0, angle])
					cube([z, y / cos(angle) + z *2, z]);
		}
		for (i = [0: 1: xCubes /2]) {
			translate([xCubes * steps, -z + (i * steps *2 -( i* z)), 0])
				rotate([0, 0, angle])
					cube([z, y / cos(angle) + z *2, z]);
		}
		for (i = [0: 1: yCubes]) {
			translate([i * steps, -z, 0])
				rotate([0, 0, -angle])
					cube([z, y / cos(angle) + z *2, z]);
		}
		for (i = [0: 1: yCubes /2]) {
			translate([0, -z + (i * steps *2 -( i* z)), 0])
				rotate([0, 0, -angle])
					#cube([z, y / cos(angle) + z *2, z]);
		}
    }
}
hashedSquare(x = 87, y = 90, space = 10);