include <hashedSquare.scad>;
include <box.scad>;

module lidBox(x = 0.0, y = 0.0, z = 0.0, material = 1.2, eco = [false, false, false, false, true, true], hashSpace = 7) {
	// eco[0] = front
	// eco[1] = left
	// eco[2] = back
	// eco[3] = right
	// eco[4] = bottom

	// eco[5] = lid

	zWithoutLid = z - material;

	box(x = x, y = y, z = zWithoutLid, material = material, eco = [eco[0], eco[1], eco[2], eco[3], eco[4]], hashSpace = hashSpace);
	translate([0, material, zWithoutLid - material *2])
		cube([x, material, material]);
	translate([0, y -material *2, zWithoutLid - material *2])
		cube([x, material, material]);
		
	translate([material, 0, zWithoutLid - material *2])
		cube([material, y, material]);
	translate([x - material *2, 0, zWithoutLid - material *2])
		cube([material, y, material]);

	translate([x + 20 + material, material, 0]){
		// difference() {
		// 	box(x = x, y = y, z = material, eco = [eco[0], eco[1], eco[2], eco[3], eco[5]], hashSpace = hashSpace);
		// 	translate([-material, -material, -material]) 
		// 		cube([material *2, y/3 + material, material*3]);
		// }
		lidX = x - material * 2;
		lidY = y - material * 2;
		box(x = lidX, y = lidY, z = material, eco = [eco[0], eco[1], eco[2], eco[3], eco[5]], hashSpace = hashSpace);
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