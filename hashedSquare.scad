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
hashedSquare(x = 57, y = 213, space = 10);