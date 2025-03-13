include <../prepared/touchGap.scad>;
include <../prepared/hashedSquare.scad>;
include <../prepared/cardBox_63x88.scad>;

cardBox_63x88(y = 65, touchGaps = [true, false, true, false], eco = true);