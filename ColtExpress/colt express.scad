include <../prepared/touchGap.scad>;
include <../prepared/hashedSquare.scad>;
include <../prepared/cardBoxes.scad>;

boxX = 143;
boxY = 180;
boxZ = 65;
material = 1.2;

//x = 73, y = 65, z= 95
cardBox_63x88(y = 65, touchGaps = [true, false, true, false], eco = [true, true, true, true, true]);

translate([80, 0, 0]){
	box(x = boxX, y = boxY, z = boxZ, touchGaps = [false, false, false, false], eco = [true, true, true, true, true]);
	translate([0, 125 + material, 0]) {
		difference() {
			cube([boxX, material, boxZ]);
			translate([10, material *2,10])
				rotate([90, 0, 0])
					hashedSquare(x = boxX - 20, y = boxZ - 20, z = material);
		}
		translate([0, -10, 0])
		cube([boxX, 20+ material, material]);
	}
}