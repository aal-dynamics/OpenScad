//include <hashedSquare.scad>;
include <box.scad>;

module lid_add(x = 1.6, y = 1.2, z = 5, side = true, material = 1.2) {
	cube([x, y, z]);

	if (side) {
		translate([0, 0, z - material])// -x / 2]) 
			rotate([90,90,90])
				cylinder(h = x, d = material, $fn = 10);
		translate([0, y, z - material]) 
			rotate([90,90,90])
				cylinder(h = x, d = material, $fn = 10);
	}
	if (!side) {
		translate([0, 0, z - material])
			rotate([0, 90, 90])
				cylinder(h = y, d = material, $fn = 10);
		translate([x, 0, z - material])
			rotate([0, 90, 90])
				cylinder(h = y, d = material, $fn = 10);
	}
}

module boxWithFrame(x = 0.0, y = 0.0, z = 0.0, material = 1.2, eco = [false, false, false, false, true, true], hashSpace = 7) {
	// eco[0] = front	// eco[1] = left	// eco[2] = back	// eco[3] = right	// eco[4] = bottom	// eco[5] = lid

	//box(x = x, y = y, z = zWithoutLid, material = material, eco = eco, hashSpace = hashSpace);
	box(x = x, y = y, z = z, material = material, eco = eco, hashSpace = hashSpace);
	translate([0, 0, z - material *2]){
		cube([x, material *2, material]);
		translate([0, 0, -material])
			rotate([-36, 0, 0])
				cube([x, material, material *2]);
	}
	
	translate([0, y -material *2, z - material *2]){
		cube([x, material *2, material]);
		translate ([0, material + 0.2, -material - 0.7])
			rotate([36, 0, 0])
				cube([x, material , material*2]);
	}
		
	translate([0, 0, z - material * 2]){
		cube([material *2, y, material]);
		translate([0, 0, - material])
		 	rotate([0,36,0])
				cube([material, y, material * 2]);
	}
	
	translate([x - material * 2, 0, z - material * 2]){
		cube([material *2, y, material]);
		translate([material + 0.2, 0, -material * 1.6])
		  	rotate([0, -36, 0])
		 		cube([material, y, material * 2]);
	}
}

module lid(x = 0.0, y = 0.0, z = 0.0, material = 1.2, eco = [false, false, false, false, true, true], hashSpace = 7, forDiff = false) {
	//translate([x + 20 + material, material, 0]){
	lidX = x - material * 2;
	lidY = y - material * 2;
	
	lidXPart = round(lidX/ 3) -1;
	lidYPart = round(lidY/ 3) -1;
	
	box(x = x, y = y, z = material, eco = [eco[0], eco[1], eco[2], eco[3], eco[5]], hashSpace = hashSpace);
	
	if (!forDiff) {
		translate([-material, (y - lidYPart) /2, 0])
			lid_add(x = material * 2, y = lidYPart, z = 5);
		
		translate([lidX + material, (y - lidYPart) /2, 0])
			lid_add(x = material * 2, y = lidYPart, z = 5);
		
		translate([(x - lidXPart) / 2, -material, 0])
			lid_add(x = lidXPart, y = material * 2, z = 5, side = false);

		translate([(x - lidXPart) / 2, lidY + material, 0])
			lid_add(x = lidXPart, y = material * 2, z = 5, side = false);
	}

	if (forDiff) {
		translate([-material * 2, (y - lidYPart) /2, 0])
			lid_add(x = material * 4, y = lidYPart, z = 5);
		
		translate([lidX, (y - lidYPart) /2, 0])
			lid_add(x = material * 4, y = lidYPart, z = 5);
		
		translate([(x - lidXPart) / 2, -material *2, 0])
			lid_add(x = lidXPart, y = material * 4, z = 5, side = false);

		translate([(x - lidXPart) / 2, lidY, 0])
			lid_add(x = lidXPart, y = material * 4, z = 5, side = false);
	}
}

module lidBox(x = 0.0, y = 0.0, z = 0.0, material = 1.2, eco = [false, false, false, false, true, true], hashSpace = 7) {
	// eco[0] = front	// eco[1] = left	// eco[2] = back	// eco[3] = right	// eco[4] = bottom	// eco[5] = lid

	zWithoutLid = z - material;
	lidX = x - material * 2;
	lidY = y - material * 2;

	difference() {
		boxWithFrame(x = x, y = y, z = zWithoutLid, material = material, eco = eco, hashSpace = hashSpace);
		
		translate([x - material, material, zWithoutLid])
			rotate([0, 180, 0])
				lid(x = lidX, y = lidY, z = material, eco = eco, hashSpace = hashSpace, forDiff = true);
	}

	translate([x + 20 + material, material, 0]){
		lid(x = lidX, y = lidY, z = material, eco = eco, hashSpace = hashSpace);
	}
}

// x = 100;
// y = 100;
// z = 100;

// x = 73;
// y = 65;
// z = 95;

x = 67;
y = 95;
z = 32;

lidBox(x = x, y = y, z = z, hashSpace = 10);