use <pin_headers.scad>;
include <boxes.scad>

module l298board_boundaries() {
translate([0,0,15/2])roundedBox([60,55.5,15],6,1);
translate([0,0,29/2+1])cube([36,31.5,27],center=true);
translate([25.125,23,0]) cylinder(r=1.5,h=10,center=true);
translate([-25.125,23,0]) cylinder(r=1.5,h=10,center=true);
translate([25.125,-23,0]) cylinder(r=1.5,h=10,center=true);
translate([-25.125,-23,0]) cylinder(r=1.5,h=10,center=true);

}

module led() {
	translate([0,0,0.7/2]) cube([1.0,1.6,0.7],center=true);
}
module l298() {
color("black") 
translate([0,0,25.5/2]) cube([15.3,23,25.5],center=true);
}

module screwterminal(color="green", length=2) {
color(color) translate([0,0,9.9/2])
difference() {
cube([4.9*length,7.6,9.9],center=true);
translate([0,6.1,6])rotate([30,0,0])cube([4.9*length+1,10,10],center=true);
for (i=[1:length]) {
translate([(-4.9*length)/2+2.45+(i-1)*4.9,-1,3]) cylinder(r=1.6,h=4);
translate([(-4.9*length)/2+2.45+(i-1)*4.9,-4,0]) cube([3.2,3.2,5],center=true);
}
}
}

module l298board() {
color ("darkred") difference() {
translate([0,0,2/2])roundedBox([60,55.5,2],6,1);
translate([25.125,23,0]) cylinder(r=1.75,h=10,center=true);
translate([-25.125,23,0]) cylinder(r=1.75,h=10,center=true);
translate([25.125,-23,0]) cylinder(r=1.75,h=10,center=true);
translate([-25.125,-23,0]) cylinder(r=1.75,h=10,center=true);
}

color("red") translate([30-16.2,1.25,2]) rotate(90) led();
color("red") translate([30-16.2,-1.25,2]) rotate(90) led();
color("red") translate([30-16.2,-1.25-2.5,2]) rotate(90) led();
color("red") translate([30-16.2,-1.25-5,2]) rotate(90) led();
color("red") translate([30-16.2,1.25+7.5,2]) rotate(90) led();

translate([0,0,2]) l298();
translate([30-2.5/2-3.5,0,2]) pin_header(rows = 1, cols = 6);
translate([30-15/2-11,55/2-5/2-3.5,2]) pin_header(rows = 6, cols = 2);
translate([-30+7.6/2+5,0,2])rotate(-90) screwterminal(color = "darkblue",length = 3);
translate([-30+7.6/2+5,13,2])rotate(-90) screwterminal(color = "darkgreen",length = 2);
translate([-30+7.6/2+5,-13,2])rotate(-90) screwterminal(color = "darkgreen",length = 2);
}

l298board();
%l298board_boundaries();
$fn=50;