//translate([-10.25,-16,0]) #import("block.stl");
module spacer(length=32) {
translate([0,0,8]) {
difference() {
cube([20.5,length,16],center=true);
difference() {
cube([14.5,length-6,17],center=true);
translate([-10.25,-length/2,-8])rotate(45) cube([16,16,4],center=true);
translate([10.25,-length/2,-8])rotate(45) cube([16,16,4],center=true);
translate([-10.25,length/2,-8])rotate(45) cube([16,16,4],center=true);
translate([10.25,length/2,-8])rotate(45) cube([16,16,4],center=true);
}
translate([-10,length/2-14.25,0]) rotate([0,90,0]) cylinder(r=1.5,h=10,center=true);
translate([10,18-length/2,0.125]) {
rotate([0,90,0]) cylinder(r=2,h=10,center=true);
translate([0,-6,0]) rotate([0,90,0]) cylinder(r=2,h=10,center=true);
}
}
}
}

spacer(58);
$fn=50;