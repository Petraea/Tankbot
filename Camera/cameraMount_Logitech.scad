use <Logitech.scad>;
//translate([17,-2,3.25])import ("cameraMount_Logitech.stl");
difference() {
union() {
difference() {
union() {
rotate([180,0,0]) translate([17,-2,3.25])import ("cameraMount_RPi_R_r03.stl");
translate([0.75,0,0]) cube([10,40,27],center=true);
}
translate([-4.5/2,0,0]) cube([6,42,58],center=true);
}
translate([2,0,13]) cube([3,24,53],center=true);
}
translate([0,0,13]) rotate([0,-90,0]) camera_boundaries();
}