module camera() {
union() {
color("green") difference() {
translate([0,0,0.1])cube([53.5,19.5,4],center=true);

translate([35,17,0]) rotate([0,0,60]) cube([30,30,30],center=true);
translate([-35,17,0]) rotate([0,0,-60]) cube([30,30,30],center=true);
translate([35,-17,0]) rotate([0,0,-60]) cube([30,30,30],center=true);
translate([-35,-17-2.5,0]) rotate([0,0,60]) cube([30,30,30],center=true);
translate([53.5/2-17.5-3/2,-19.5/2,0]) cube([3,1.5,10],center=true);
translate([53.5/2-17.5-3/2,19.5/2,0]) cube([3,1.5,10],center=true);
translate([-53.5/2+10-3/2,-19.5/2,0]) cube([3.1,8,10],center=true);
translate([-53.5/2,-19.5/2+2-1.5,0]) cube([18,3,10],center=true);
translate([-53.5/2+10-3/2,-19.5/2+4,0]) cylinder(r=1.55,h=10,center=true,$fn=50);

translate([-53.5/2+2,-19.5/2+5,0]) cylinder(r=0.9,h=8,center=true,$fn=50);
translate([53.5/2-4,19.5/2-5,0]) cylinder(r=0.9,h=8,center=true,$fn=50);

}
color("white") translate([-53.5/2+7,19.5/2-2-7.5/2,-1.2/2-3/2]) cube([14,7.5,3],center=true);
color("silver") translate([-53.5/2+9,19.5/2-5-4/2,1.2/2+2.5/2]) cube([10,4,2.5],center=true);

color("silver") translate([53.5/2-29,0,1.2/2+5.5/2]) cylinder(r=6/2,h=5.5,center=true);
color("black") translate([53.5/2-29,0,1.2/2+1]) cylinder(r=6.5/2,h=2,center=true);

color("black") translate([53.5/2-12.5,0,1.2/2+2.5/2]) cube([14.5,14.5,2.5],center=true);
color("black") translate([53.5/2-12.5,0,1.2/2+7.5/2]) cylinder(r=6,h=7.5,center=true);
}

}

module camera_boundaries() {
union() {
minkowski() {
camera();
cube([1,1,1],center=true);
}
translate([-53.5/2+2,-19.5/2+5,-2-2.5]) cylinder(r=0.9,h=4,center=true,$fn=50);
translate([53.5/2-4,19.5/2-5,-2-2.5]) cylinder(r=0.9,h=4,center=true,$fn=50);
}
}

camera();
//%camera_boundaries();