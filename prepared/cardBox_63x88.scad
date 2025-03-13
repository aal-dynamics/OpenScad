include <../prepared/touchGap.scad>;
include <../prepared/hashedSquare.scad>;

module cardBox_63x88(y, material = 1.2, touchGaps = [false, false, false, false], eco) {
	x = 70 + (material *2);
	z = 92 + material;

	echo("######### Outer size X = ", x, ", Y = ", y, ", Z = ", z, " #########");

	xDiameter = x * 0.6;
	yDiameter = y * 0.6;
	
	difference() {
		cube(size = [x, y, z]);
		
		translate([material, material, material])
			cube(size = [x - (material * 2), y - (material * 2), z - material]);
		
		if (touchGaps[0]) //front
			translate([xDiameter + (x - xDiameter) /2, -material, z  + 0.1])
				rotate([0,0,90])
					touchGap(width = xDiameter, height = xDiameter * 0.75, material = material);

		if (touchGaps[1]) //left
			translate([0, (y - yDiameter) /2, z])
				touchGap(width = yDiameter, height = yDiameter * 0.75, material = material);

		if (touchGaps[2]) //back
			translate([xDiameter + (x - xDiameter) /2, y - material *2, z + 0.1])
				rotate([0,0,90])
					touchGap(width = xDiameter, height = xDiameter * 0.75, material = material);

		if (touchGaps[3]) //right
			translate([x - material * 2, (y - yDiameter) /2, z])
				touchGap(width = yDiameter, height = yDiameter * 0.75, material = material);
		
		if (eco) {
			distance = 10;
			frontWidth = y - distance * 2;
			frontHeight = z - distance * 2;

			translate([distance, distance, -0.1])
				hashedSquare(x = x - distance * 2, y = y - distance * 2, z = material);
			
			translate([0, distance, distance])
				rotate([90, 0, 90])
					hashedSquare(x = frontWidth, y = frontHeight, z = material);

			translate([x - material *2, distance, distance])
				rotate([90, 0, 90])
					hashedSquare(x = frontWidth, y = frontHeight, z = material);
		}
	}
}

//cardBox_63x88(y = 65, touchGaps = [true, false, true, false], eco = true);