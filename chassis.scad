use <rpi.scad>;
use <servo_board.scad>;
use <battery_box.scad>;
use <l298_board.scad>;
use <wheel.scad>;

//%import("chassis.stl");
module chassiswall_neg() {
 translate([0,36,4.5])rotate([0,90,0])cylinder(r=1.5,h=10,center=true);
 translate([0,36,22])rotate([0,90,0])cylinder(r=1.5,h=10,center=true);
 translate([0,2.75,13.25])rotate([0,90,0])cylinder(r=1.5,h=10,center=true);
 translate([-2,43.5,5]) cube([8,28,14]);
//MODIFIED from original 87 -> 113
   translate([0,113,13])  hull() {
   rotate([0,90,0])cylinder(r=2,h=10,center=true);
   translate([0,22,0])rotate([0,90,0])cylinder(r=2,h=10,center=true);
  }
}

module chassiswall() {
translate([-4/2,-115/2,-24.5/2]) {
 translate([0,0,-16])%cube([4,115,16]);//16mm ground clearance
 translate([0,0,24.5])%cube([4,115,17]);//17mm track clearance
 difference() {
  cube([4,115,24.5]); 
  chassiswall_neg();
 translate([-2,43.5,12]) cube([8,28,14]);
  translate([-2,-2,16.3]) cube([8,8,20]);
  translate([-2,5.98,16.3]) rotate([25,0,0]) cube([8,28,25]);
 }
}
}

module uppersection() { color("ivory") translate([0,0,4]) {
 difference() {
//  translate([-1,0,7.5]) cube([150,104,40],center=true); 
    translate([-1,0,2.5]) union() { difference() {
    cube([155,104,30],center=true); 
    translate([1,0,4.5]) cube([147,96,22],center=true); 
  }
    translate([155/2-4,48,0]) cylinder(r=4,h=30,center=true); 
    translate([-155/2+4,48,]) cylinder(r=4,h=30,center=true); 
    translate([155/2-4,-48,0]) cylinder(r=4,h=30,center=true); 
    translate([-155/2+4,-48,0]) cylinder(r=4,h=30,center=true); 
    }
  translate([20,43,5])cube([50,10,25],center=true); 
  translate([20,-43,5])cube([50,10,25],center=true); 

  translate([68,-52,-9.25]) rotate(90)chassiswall_neg();
  translate([68,49,-9.25]) rotate(90)chassiswall_neg();

  translate([-1,0,2.5]) {
    translate([155/2-4,48,0]) cylinder(r=1.5,h=35,center=true); 
    translate([-155/2+4,48,]) cylinder(r=1.5,h=35,center=true); 
    translate([155/2-4,-48,0]) cylinder(r=1.5,h=35,center=true); 
    translate([-155/2+4,-48,0]) cylinder(r=1.5,h=35,center=true); 

    translate([0,0,-15]) {
      translate([155/2-4,48,0]) cylinder(r=2.5,h=10,center=true); 
      translate([-155/2+4,48,]) cylinder(r=2.5,h=10,center=true); 
      translate([155/2-4,-48,0]) cylinder(r=2.5,h=10,center=true); 
      translate([-155/2+4,-48,0]) cylinder(r=2.5,h=10,center=true); 
      }
    }

  translate([10,0,-10]) {
    translate([95/2,95/2,0]) cylinder(r=1.5,h=10,center=true); 
    translate([-95/2,95/2,0]) cylinder(r=1.5,h=10,center=true); 
    translate([95/2,-95/2,0]) cylinder(r=1.5,h=10,center=true); 
    translate([-95/2,-95/2,0]) cylinder(r=1.5,h=10,center=true);   
    }
  translate([10,0,-11.75]) module_remove();

  translate([-155/2,-25,3]) rotate([0,90,0])cylinder(r=7,h=15,center=true);   

 }
}}

module batterysection() {
  translate([10,0,-20.5]) color("green") {
  difference() {
    union () {
      cube([95,95,23.75],center=true); 
      translate([95/2,95/2,0]) cylinder(r=4,h=23.75,center=true); 
      translate([-95/2,95/2,0]) cylinder(r=4,h=23.75,center=true); 
      translate([95/2,-95/2,0]) cylinder(r=4,h=23.75,center=true); 
      translate([-95/2,-95/2,0]) cylinder(r=4,h=23.75,center=true); 
      }
    translate([95/2,95/2,0]) cylinder(r=1.5,h=25,center=true); 
    translate([95/2,95/2,-10]) cylinder(r=2.5,h=5,center=true);   
    translate([-95/2,95/2,0]) cylinder(r=1.5,h=25,center=true); 
    translate([-95/2,95/2,-10]) cylinder(r=2.5,h=5,center=true);   
    translate([95/2,-95/2,0]) cylinder(r=1.5,h=25,center=true); 
    translate([95/2,-95/2,-10]) cylinder(r=2.5,h=5,center=true);   
    translate([-95/2,-95/2,0]) cylinder(r=1.5,h=25,center=true);   
    translate([-95/2,-95/2,-10]) cylinder(r=2.5,h=5,center=true);   

    translate([0,0,13.5]) module_remove();
    }
  }
}

module module_remove() {
//translate([-15,52,-2]) rotate(90) chassiswall();
//translate([-15,-52,-2]) rotate(90) chassiswall();

translate([0,45,5]) rotate(180) color("green") rpi_boundaries();
translate([-35,-32,1]) rotate(90) color("blue") servoboard_boundaries();
translate([0,0,-13]) color("yellow") {
	translate([0,22,0]) batterybox_boundaries();
	translate([0,-22,0.5]) rotate([180,0,0]) batterybox_boundaries();
}
translate([31,0,7.5]) color("red") l298board_boundaries();
}

$fn=50;

uppersection();
batterysection();
translate([10,0,-7.5]) module_remove();

translate([50,70,10]) rotate([90,90,0]) tooth_wheel(n=24,type="drive");
translate([50,-70,10]) rotate([90,-90,0]) tooth_wheel(n=24,type="drive");
translate([-60,70,10]) rotate([90,135,0]) tooth_wheel(n=24,type="idler");
translate([-60,-70,10]) rotate([90,45,0]) tooth_wheel(n=24,type="idler");