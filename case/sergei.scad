/*
 * Sergei Case
 * Copyright (c) 2023 Lone Dynamics Corporation. All rights reserved.
 *
 * required hardware:
 *  - 6 x M3 x 25mm countersunk bolts
 *  - 6 x M3 nuts
 * 
 */

$fn = 100;

board_width = 50;
board_thickness = 1.404;
board_length = 110;
board_height = 1.55;
board_spacing = 2;

wall = 1.5;

translate([10,2,-1.6]) ld5_board();

translate([0,0,0])
	ld5_case_top();

translate([0,0,-6.5])
	ld5_case_bottom();

rotate([90,0,0]) translate([-48,-18.25,-20])
	ld5_case_stand();


module ld5_case_stand() {
	difference() {
		roundedcube(100,50,25,1);
		translate([-10,25-((26.5+0.25)/2),-1]) cube([120,26.5+0.25,20]);
	}
}
	
module ld5_board() {
	
	difference() {
		union() {
			color([0,0.5,0])
				roundedcube(board_width,board_length,board_thickness, 5);
			color([0.2,0.2,0.2])
				translate([35.725-(7.5/2),-5,0])
					cube([7.5,10,7.5]);
		}
		translate([5, 5, -1]) cylinder(d=3.2, h=100);
		translate([5, 105, -1]) cylinder(d=3.2, h=100);
		translate([45, 5, -1]) cylinder(d=3.2, h=100);
		translate([45, 105, -1]) cylinder(d=3.2, h=100);
	}	
		
}

module ld5_case_top() {

		// addl supports
		translate([58,21.5,0]) cube([4,3.25,20]);
		translate([58,41.25,0]) cube([4,7,20]);
		translate([58,63.75,0]) cube([4,7.25,20]);
		translate([58,86,0]) cube([4,6.25,20]);
		translate([28.95,110,0]) cube([5.05,3,20]);
			
		translate([10,2,0]) {
			difference() {
				union() {
					translate([47.5,5,0]) cylinder(d=8, h=18);
					translate([45,2.5,0]) cylinder(d=8, h=18);
					translate([45,5,0]) cylinder(d=8, h=18);
					
					translate([47.5,105,0]) cylinder(d=8, h=18);
					translate([45,107.5,0]) cylinder(d=8, h=18);
					translate([45,105,0]) cylinder(d=8, h=18);
					
					translate([5,5,0]) cylinder(d=8, h=18);
					translate([5,2.5,0]) cylinder(d=8, h=18);
					
					translate([5,107.5,0]) cylinder(d=8, h=18);
					translate([5,105,0]) cylinder(d=8, h=18);
					
					translate([-62.5,2.5,0]) cylinder(d=8, h=18);
					translate([-60,2.5,0]) cylinder(d=8, h=18);
					translate([-60,5,0]) cylinder(d=8, h=18);
					
					translate([-62.5,105,0]) cylinder(d=8, h=18);
					translate([-60,107.5,0]) cylinder(d=8, h=18);
					translate([-60,105,0]) cylinder(d=8, h=18);
				}
				translate([45,5,-5]) cylinder(d=3.2, h=60);
				translate([45,105,-5]) cylinder(d=3.2, h=60);
				translate([5,5,-5]) cylinder(d=3.2, h=60);
				translate([5,105,-5]) cylinder(d=3.2, h=60);
				translate([-60,5,-5]) cylinder(d=3.2, h=60);
				translate([-60,105,-5]) cylinder(d=3.2, h=60);
			}
		}
		
		difference () {
			
			// body			
			union() {
				translate([-58,0,0]) roundedcube(120,114,20,5);
			}
			
			translate([10,2,-0.1]) {
				
				translate([-66,0,0])
					roundedcube(board_width+66,board_length,20-2,5);

				// optical audio
				translate([45,14.5-(10/2),0])
					cube([20,10,10.5]);
		
				// ethernet
				translate([45,31-(16.5/2),0])
					cube([10,16.5,15]);

				// hdmi
				translate([45,54-(15.5/2),0])
					cube([10,15.5,7]);
			
				// usb host
				translate([45,76.5-(15/2),0])
					cube([10,15,16.5]);

				// usb-c
				translate([45,95-(9.5/2),0])
					cube([10,9.5,3.5]);

				// pmod
				translate([29.35-(16/2),-5,0])
					cube([16,10,2.6]);


				// boot button
				translate([15.2-(7.5/2),105,0])
					cube([7.5,10,7.6]);

				// sd card
				translate([31.5-(15/2),105,0])
					cube([15,10,3]);

				// expansion
				translate([21-(18/2),95,0])
					cube([18,10,6]);

				// bolt holes
				translate([45,5,0]) cylinder(d=3.2, h=50);
				translate([45,105,0]) cylinder(d=3.2, h=50);
				translate([5,5,0]) cylinder(d=3.2, h=50);
				translate([5,105,0]) cylinder(d=3.2, h=50);
				translate([-60,5,0]) cylinder(d=3.2, h=50);
				translate([-60,105,0]) cylinder(d=3.2, h=50);
		
				translate([45,5,18.5]) cylinder(d=6, h=3);
				translate([45,105,18.5]) cylinder(d=6, h=3);
				translate([5,5,18.5]) cylinder(d=6, h=3);
				translate([5,105,18.5]) cylinder(d=6, h=3);
				translate([-60,5,18.5]) cylinder(d=6, h=3);
				translate([-60,105,18.5]) cylinder(d=6, h=3);
				
				// vents				
				translate([-20,80,10]) cube([2,200,20]);
				translate([-30,80,10]) cube([2,200,20]);
				translate([-40,80,10]) cube([2,200,20]);
				
				// logo
				translate([0,25,19])
					rotate([0,0,90])
						translate([20,30+2,0.5]) rotate([0,0,180])
							linear_extrude(1)
								text("S E R G E I", size=6, halign="center",
									font="Lato:style=Bold");
		
		
			}

		}
	
				
		
}

module ld5_case_bottom() {
			
		difference () {
			
			union() {
				translate([-58,0,0]) roundedcube(120,114,6.5,5);
			}
			
			translate([10,2,0]) {				
				
				translate([8.5,-0.1,2]) roundedcube(board_width-8.5-9,board_length+0.2,5,5);
				translate([-65,9,2]) roundedcube(board_width+65,board_length-18,5,5);
			
				translate([-0.125,-0.125,6.5-1.6]) roundedcube(board_width+0.25,board_length+0.25,10, 5);
				
				// bolt holes
				translate([5,5,0]) cylinder(d=3.2, h=50);
				translate([5,105,0]) cylinder(d=3.2, h=50);
				translate([45,5,0]) cylinder(d=3.2, h=50);
				translate([45,105,0]) cylinder(d=3.2, h=50);
				translate([-60,5,0]) cylinder(d=3.2, h=50);
				translate([-60,105,0]) cylinder(d=3.2, h=50);

				// nut holes
				translate([5,5,-1.75]) cylinder(d=7, h=4.5, $fn=6);
				translate([5,105,-1.75]) cylinder(d=7, h=4.5, $fn=6);
				translate([45,5,-1.75]) cylinder(d=7, h=4.5, $fn=6);
				translate([45,105,-1.75]) cylinder(d=7, h=4.5, $fn=6);
				translate([-60,5,-1.75]) cylinder(d=7, h=4.5, $fn=6);
				translate([-60,105,-1.75]) cylinder(d=7, h=4.5, $fn=6);


			}

		}
		
}

// https://gist.github.com/tinkerology/ae257c5340a33ee2f149ff3ae97d9826
module roundedcube(xx, yy, height, radius)
{
    translate([0,0,height/2])
    hull()
    {
        translate([radius,radius,0])
        cylinder(height,radius,radius,true);

        translate([xx-radius,radius,0])
        cylinder(height,radius,radius,true);

        translate([xx-radius,yy-radius,0])
        cylinder(height,radius,radius,true);

        translate([radius,yy-radius,0])
        cylinder(height,radius,radius,true);
    }
}
