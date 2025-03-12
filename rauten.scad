x = 50;
y = 50;
z = 1.2;
space = 5;
angle = 60;

difference() {
	cube([x, y, z]);
	for(i = [0: space + z: x + y]) {
		//translate([-x + i, 0, 0])
		translate([i, 0, 0])
			rotate([0, 0, angle])
				#cube([z, y + angle, z]);
	}
	for(j = [0: space + z: x + y]) {
		translate([0, -y + j, 0])
			rotate([0, 0, angle])
				cube([x + angle, z, z]);
	}
}