

module fuselage() {
	// horizontal stabaliser
	translate([0,90,25]) cube([250,90,3], center = true);
	// vertical stabaliser
	rotate(90, [0,1,0]) translate([-25, 0, 0]) cube([200,90,3], center = true);
	// boom
    translate([0, 400, 0]) rotate(90, [1,0,0]) cylinder(r = 5, h = 800, center = true);
	// fuselage
    translate([0, 630, 0]) rotate(90, [1,0,0]) cylinder(r = 20, h = 330, center = true);
 }

module wing() {
	//cube([180, 1000, 110]); // this cube is the are filled by the wing
	translate([90, 500, 0]) 
	rotate(90, [0,0,1]) {
		rotate(-12, [0,1,0]) cube([500,180,10]);
		rotate(12, [0,1,0]) translate([-500, 0, 0]) cube([500,180,10]);
	}
}
module dlgBox() {
	// main frame
	translate([0, 500, -30]) {
		translate([150-9, 0, 180-9]) cube([18, 1200, 18], center = true);
		translate([150-9, 0, -180+9]) cube([18, 1200, 18], center = true);
		translate([-150+9, 0, 180-9]) cube([18, 1200, 18], center = true);
		translate([-150+9, 0, -180+9]) cube([18, 1200, 18], center = true);
		// lid
		translate([-150+9, 0, -180-9]) cube([18, 1200, 18], center = true);
		translate([150-9, 0, -180-9]) cube([18, 1200, 18], center = true);
		//#cube([300, 1200, 360], center = true);
	}
}
// wing gap of 30 mm seem too small?
translate([0, 0, -30]) wing();
wing();
translate([0, 0, 30]) wing();
translate([0, 0, -60]) wing();

module stackedFuselages() {
	translate([-15, 0, -90]) fuselage();
	translate([15, 0, -130]) fuselage();
}

stackedFuselages();
translate([0, 1000, 0]) rotate(180, [0,0,1]) stackedFuselages();

dlgBox();