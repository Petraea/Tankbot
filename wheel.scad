//translate([0,0,-5]) #import("motor_wheel.stl");
module bare_wheel(radius=25,type="drive") {
difference () {
union () {
cylinder(r=radius+2,h=6,center=true);
translate([0,0,4]) cylinder(r1=radius+2,r2=radius,h=2,center=true);
translate([0,0,-4]) cylinder(r1=radius,r2=radius+2,h=2,center=true);
}
if (type=="drive") cube([3.8,6,12],center=true);
if (type=="idler") cylinder(r=1.5,h=12,center=true);
}
}

module tooth_remove() {
cylinder(r=2,h=15,center=true);
translate([0,-pow(pow(10/2,2)*2,0.5)+pow(10-2,0.5),0])
rotate(45) 
intersection () {cube([10,10,15],center=true);
  rotate(45) cube([2*pow(pow(10-2,2)/2,0.5),2*pow(pow(10-2,2)/2,0.5),16],center=true);
}
}

module tooth_wheel(n=12,type="drive") {
rad = 25*n/12;
render() { //otherwise it crashes CGAL...
difference() {
echo ("radius is", rad);
bare_wheel(radius=rad,type=type);
for (i=[0:n-1]) {
rotate(180/n+i*360/n)
translate([0,-rad-2,0])
tooth_remove();
}
if (rad > 25) {
  for (i=[0:3]) {
    rotate(i*90)
    translate([0,rad/2,0])
    cylinder(r=rad/4,h=12,center=true);
    }
  }
}
}
}

tooth_wheel(n=24,type="drive");
$fn=50;