//All units are in cm

module usb_port ()
{
	difference() {
		cube([0.65, 1.4, .5], center=true);
		cube([0.45, 1.2, .6], center=true);
	}
}

module female_header ()
{
	difference() {
		cube([0.3, 0.3, 0.9], center=true);
		cube([0.1, 0.1, 1], center=true);
	}
}

module console_body()
{
	difference() {
		union() {
			difference() {
				difference() {
					// The main body, hollow
					cube([12, 12, 8], center=true);
					cube([11.5, 11.5, 7.5], center=true);
				}

				// Slot cutout
				translate([0, 3, 3.1]) {
					cube([10, 2, 2.1], center=true);
				}
			}
			
			difference() {
				// The physical Slot (the part that collects dust and soda)
				translate([0, 3, 3.1]) {
					difference() {
						translate([0, 0, -.1]) {
							cube([10.75, 2.75, 2], center=true);
						}
						cube([10, 2, 2], center=true);
					}
				}

				// Cutouts for Slot USB in physical slot
				for(i=[-1, 1]) {
					translate([3.8*i, 3, 2]){
						cube([0.75, 1.5, 0.7], center=true);
					}
				}
			}
		}
		
		// Front USB cutouts
		for(i=[-1, 1]) {
			translate([3.8*i, -6, 0]){
				rotate([90, 90, 0]) {
					cube([0.75, 1.5, 0.7], center=true);
				}
			}
		}
	}
}

module console()
{
	// Console Shell
	console_body();

	// USB ports on front
	translate([0, -5.75, 0]) {
		rotate([90, 0, 0]) {
			for(i=[-1, 1]) {
				translate([3.8*i, 0, 0]) {
					rotate([0, 0, 90]) {
						usb_port();
					}
				}
			}
		}
	}

	cube([8, 8, 10], center=true);

	// USB ports in Slot
	for(i=[-1, 1]) {
		translate([3.8*i, 3, 3-.6]) {
			usb_port();
		}
	}

	// GPIO
	translate([-((13*0.254)/2), 3, 2]){
		for(i = [0:13]) {
			for(j=[-1, 1]) {
				translate([i*0.254, (0.254/2)*j, 0]) {
					female_header();
				}
			}
		}
	}

	// The following are not specified because the specification doesn't care.
	// TODO: HDMI Jack
	// TODO: Power Jack
	// TODO: Ethernet Jack
	// TODO: RCA Video Jack
	// TODO: 3.5mm Phono Jack

}

console();

