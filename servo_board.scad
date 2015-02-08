use <pin_headers.scad>;
use <l298_board.scad>;
include <boxes.scad>

module servoboard_boundaries() {
translate([0,0,6])roundedBox([25.5+0.25,62.3+0.25,13],3.5,1);
}


module servoboard() {
color ("darkblue") difference() {
translate([0,0,2/2])roundedBox([25.5,62.3,2],3.5,1);
translate([9.6,28,0]) cylinder(r=2.5/2,h=10,center=true);
translate([-9.6,28,0]) cylinder(r=2.5/2,h=10,center=true);
translate([9.6,-28,0]) cylinder(r=2.5/2,h=10,center=true);
translate([-9.6,-28,0]) cylinder(r=2.5/2,h=10,center=true);

translate([0,-62.3/2+2.5/2+0.5,2.1]) pin_header(rows = 6, cols = 1);
}

translate([9,0,2])rotate(-90)screwterminal(color="darkblue",length=2);
translate([-8.5,7.5,2]) pin_header(rows = 3, cols = 4);
translate([-8.5,20.3,2]) pin_header(rows = 3, cols = 4);
translate([-8.5,-7.5,2]) pin_header(rows = 3, cols = 4);
translate([-8.5,-20.3,2]) pin_header(rows = 3, cols = 4);
translate([0,62.3/2-2.5/2-0.5,2]) pin_header(rows = 6, cols = 1);
color("black") translate([0,0,2+1.5/2])cube([9.7,4.7,1.5],center=true);
}

servoboard();
#servoboard_boundaries();

$fn=50;