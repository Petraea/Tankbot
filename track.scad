//translate([-24,-9,0]) #import("tread.stl");
difference() {
union () {
difference() {
union() {
//Main foot
translate([0,0,1.5]) cube([48,12,3],center=true);
//lips
translate([22.75,0,4]) cube([2.5,12,2],center=true);
translate([-22.75,0,4]) cube([2.5,12,2],center=true);
}
translate([0,0,-0.5])linear_extrude(height=1.5) {
//Track pattern
polygon(points=[[-7.5,-6.25],[0,2.75],[7.5,-6.25],[3.75,-6.25],[0,-1.75],[-3.75,-6.25]]);
polygon(points=[[-16.5,-6.25],[0,13.5],[16.5,-6.25],[12.75,-6.25],[0,9],[-12.75,-6.25]]);
polygon(points=[[-25.5,-6.25],[0,24],[25.5,-6.25],[21.75,-6.25],[0,20],[-21.75,-6.25]]);
}
//Edge cuttings from track
//offset by 0.5 for offset
translate([28,18.8,0]) rotate(79) cube([30,30,20],center=true);
translate([28,-18.3,0]) rotate(-79) cube([30,30,20],center=true);
translate([-28,18.8,0]) rotate(-79) cube([30,30,20],center=true);
translate([-28,-18.3,0]) rotate(79) cube([30,30,20],center=true);
//trackway remove
translate([7,-6,3])rotate([45,0,0]) cube([5,3.5,3.5],center=true);
translate([-7,-6,3])rotate([45,0,0]) cube([5,3.5,3.5],center=true);
translate([11.25,6.25,3])rotate([45,0,0]) cube([5,3.5,3.5],center=true);
translate([-11.25,6.25,3])rotate([45,0,0]) cube([5,3.5,3.5],center=true);
}
//pin grabs
translate([7,7,6]) rotate([0,90,0]) cylinder(r=2.5,h=3.5,center=true);
translate([11.25,-6.5,6]) rotate([0,90,0]) cylinder(r=2.5,h=3.5,center=true);
translate([-7,7,6]) rotate([0,90,0]) cylinder(r=2.5,h=3.5,center=true);
translate([-11.25,-6.5,6]) rotate([0,90,0]) cylinder(r=2.5,h=3.5,center=true);
//rails
translate([0,0,3]) linear_extrude(height=5.5)
polygon(points=[[13,-6.5],[13,-0.25],[8.75,2.25],[8.75,7],[5.25,7],[5.25,0.75],[9.5,-1.75],[9.5,-6.5]]);
translate([0,0,3]) linear_extrude(height=5.5)
polygon(points=[[-13,-6.5],[-13,-0.25],[-8.75,2.25],[-8.75,7],[-5.25,7],[-5.25,0.75],[-9.5,-1.75],[-9.5,-6.5]]);
//Join sections
translate([9.5,-5.75,1.75]) rotate([0,90,0]) linear_extrude(height=3.5)
polygon(points=[[0,0],[-2.75,-2.75],[-2.75,0]]);
translate([5.25,6.25,1.75]) rotate([0,90,0]) linear_extrude(height=3.5)
polygon(points=[[0.5,-0.5],[-2.75,2.75],[-2.75,-0.5]]);
translate([-13,-5.75,1.75]) rotate([0,90,0]) linear_extrude(height=3.5)
polygon(points=[[0,0],[-2.75,-2.75],[-2.75,0]]);
translate([-8.75,6.25,1.75]) rotate([0,90,0]) linear_extrude(height=3.5)
polygon(points=[[0.5,-0.5],[-2.75,2.75],[-2.75,-0.5]]);
}
//pins
translate([0,7,6]) rotate([0,90,0]) cylinder(r=0.8,h=50,center=true);
translate([0,-6.5,6]) rotate([0,90,0]) cylinder(r=0.8,h=50,center=true);
}


$fn=50;
