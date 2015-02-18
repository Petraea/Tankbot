module servohorn_boundaries() {
minkowski() {
union() {
hull() {
translate([19-2.2,0,0]) cylinder(r=2.3,h=1.5,center=true);
cylinder(r=6.9/2,h=1.5,center=true);
translate([-16+2.2,0,0]) cylinder(r=2,h=1.5,center=true);
}
hull() {
translate([0,16.4/2-1,0]) cylinder(r=2,h=1.5,center=true);
translate([0,-16.4/2+1,0]) cylinder(r=2,h=1.5,center=true);
}
cylinder(r=4.8/2,h=10,center=true);
}
cube([0.5,0.5,0.5]);
}
}

servohorn_boundaries();
$fn=25;
