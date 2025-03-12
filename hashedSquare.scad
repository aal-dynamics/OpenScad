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
		for (i = [0: 1: xCubes]) {
			translate([i * steps, -z, 0])
				rotate([0, 0, -angle])
					cube([z, y / cos(angle) + z *2, z]);
		}

		// cube([x, y, z]);
		// 	for (i = [0: 1: xCubes / 2]) {
		// 	translate([x, i * steps * 2, 0])
		// 		rotate([0, 0, angle])
		// 			#cube([z, y / cos(angle) + z *2, z]);
		// }

		// cube([x, y, z]);
		// 	for (i = [0: 1: xCubes]) {
		// 	translate([i * steps, -z, 0])
		// 		rotate([0, 0, -angle])
		// 			cube([z, y / cos(angle) + z *2, z]);
		// }

        // for (i = [0: space + z: x]) {
        //     translate([i, -z, 0])
        //         rotate([0, 0, angle])
        //             cube([z, y / cos(angle), z]);
        // }

		// for (i = [(space + z) *2: (space + z) *2: y]) {
        //     translate([x, i -z -z, 0])
        //         rotate([0, 0, angle])
        //             #cube([z, y / cos(angle), z]);
        // }

		// for (i = [0: space + z: x]) {
        //     translate([-z + i, 0, 0])
        //         rotate([0, 0, -angle])
        //             cube([z, y / cos(angle), z]);
        // }

		// for (i = [0: (space + z) *2 - z: y]) {
        //     translate([-z, i, 0])
        //         rotate([0, 0, -angle])
        //             cube([z, y / cos(angle), z]);
        // }
    }
}
hashedSquare(x = 87, y = 90);