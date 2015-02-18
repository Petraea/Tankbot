use <rpi.scad>;
use <servo_board.scad>;
use <battery_box.scad>;
use <l298_board.scad>;
use <wheel.scad>;
use <servohorn.scad>;

rpi_pos=[0,45,5];
servoboard_pos=[-35,-32,6];
l298board_pos=[31,-8,7.5];
batterybox1_pos=[0,22,0];
batterybox2_pos=[0,-22,0.5];

//%import("chassis.stl");
module motor_mount() {
 translate([0,0,-8.75])rotate([0,90,0])
hull() {translate([0,-4,0])cylinder(r=1.5,h=20,center=true);
  translate([0,4,0])cylinder(r=1.5,h=20,center=true);
}

 translate([0,0,8.75])rotate([0,90,0])
hull() {translate([0,-4,0])cylinder(r=1.5,h=20,center=true);
  translate([0,4,0])cylinder(r=1.5,h=20,center=true);
}
 translate([0,-33.25,0])rotate([0,90,0])
hull() {translate([0,-4,0])cylinder(r=1.5,h=20,center=true);
  translate([0,4,0])cylinder(r=1.5,h=20,center=true);
}

 translate([2,21.5,0]) cube([8,30,16.5],center=true);
}
module block_mount() {
hull() {
   rotate([0,90,0])cylinder(r=2,h=10,center=true);
   translate([0,22,0])rotate([0,90,0])cylinder(r=2,h=10,center=true);
  }
}
module chassiswall_neg() {
translate([0,33.75,13])motor_mount();
translate([0,104.25,13])rotate([180,0,0]) motor_mount();
//MODIFIED from original 87 -> 113
//translate([0,113,13]) block_mount();
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

module cpusection() { color("silver") translate([0,0,4]) {
 difference() {
//  translate([-1,0,7.5]) cube([150,104,40],center=true); 
    translate([-1,0,2.5]) union() { difference() {
    cube([155,104,30],center=true); 
    translate([1,0,4.5]) cube([147,96,22],center=true); 
  }
    translate([155/2-4,48,7.5]) cylinder(r=4,h=15,center=true); 
    translate([-155/2+4,48,7.5]) cylinder(r=4,h=15,center=true); 
    translate([155/2-4,-48,7.5]) cylinder(r=4,h=15,center=true); 
    translate([-155/2+4,-48,7.5]) cylinder(r=4,h=15,center=true); 
    }
  translate([-1,43,5])cube([84,10,27],center=true); 
  translate([-1,-43,5])cube([84,10,27],center=true); 

  translate([68,-52,-9.25]) rotate(90)chassiswall_neg();
  translate([68,49,-9.25]) rotate(90)chassiswall_neg();

  translate([-1,0,2.5]) {
    translate([155/2-4,48,5]) cylinder(r=1.5,h=25,center=true); 
    translate([-155/2+4,48,5]) cylinder(r=1.5,h=25,center=true); 
    translate([155/2-4,-48,5]) cylinder(r=1.5,h=25,center=true); 
    translate([-155/2+4,-48,5]) cylinder(r=1.5,h=25,center=true); 

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

module camerasection() { color("white") difference() {
translate([0,0,24]) difference(){ 
    translate([-1,0,2.5]) union() { difference() {
    cube([155,104,10],center=true); 
    translate([1,0,-11]) cube([147,96,22],center=true); 

    translate([-60,0,5.5]) cube([157,120,12],center=true); 
    translate([-60,0,-5]) cube([163,120,10],center=true); //Only the front section
  }
    translate([155/2-4,48,0]) cylinder(r=4,h=10,center=true); 
    translate([155/2-4,-48,0]) cylinder(r=4,h=10,center=true); 
//    translate([-155/2+4,48,7.5]) cylinder(r=4,h=15,center=true); 
//    translate([-155/2+4,-48,7.5]) cylinder(r=4,h=15,center=true); 
    }

    translate([155/2-5,48,5]) cylinder(r=1.5,h=25,center=true); 
    translate([-155/2+5,48,5]) cylinder(r=1.5,h=25,center=true); 
    translate([155/2-5,-48,5]) cylinder(r=1.5,h=25,center=true); 
    translate([-155/2+5,-48,5]) cylinder(r=1.5,h=25,center=true); 
    translate([155/2-5,48,6]) cylinder(r=2.5,h=5,center=true); 
    translate([-155/2+5,48,6]) cylinder(r=2.5,h=5,center=true); 
    translate([155/2-5,-48,6]) cylinder(r=2.5,h=5,center=true); 
    translate([-155/2+5,-48,6]) cylinder(r=2.5,h=5,center=true); 
    translate([65,0,7]) rotate(90) servohorn_boundaries();
    translate([35,0,7]) cube([2,20,10],center=true);//Rpi ribbon cable
    translate([35,-8,7]) cylinder(r=4.2,h=10,center=true);//Servo cables
}
translate([10,0,-7.75]) module_remove();
}
}

module module_remove() {
//translate([-15,52,-2]) rotate(90) chassiswall();
//translate([-15,-52,-2]) rotate(90) chassiswall();

translate(rpi_pos) rotate(180) color("green") rpi_boundaries();
translate(servoboard_pos) rotate(90) color("blue") servoboard_boundaries();
translate([0,0,-13]) color("yellow") {
	translate(batterybox1_pos) batterybox_boundaries();
	translate(batterybox2_pos) rotate([180,0,0]) batterybox_boundaries();
}
translate(l298board_pos) color("red") l298board_boundaries();
}

module module_inplace() {
//translate([-15,52,-2]) rotate(90) chassiswall();
//translate([-15,-52,-2]) rotate(90) chassiswall();

translate(rpi_pos) rotate(180) rpi();
translate(servoboard_pos) rotate(90) servoboard();
translate([0,0,-13]) {
	translate(batterybox1_pos) batterybox();
	translate(batterybox2_pos) rotate([180,0,0]) batterybox();
}
translate(l298board_pos) l298board();
}


$fn=50;

camerasection();
//cpusection();
//batterysection();
//translate([10,0,-7.5]) module_inplace();

//translate([50,70,10]) rotate([90,90,0]) tooth_wheel(n=24,type="drive");
//translate([50,-70,10]) rotate([90,-90,0]) tooth_wheel(n=24,type="drive");
//translate([-60,70,10]) rotate([90,135,0]) tooth_wheel(n=24,type="idler");
//translate([-60,-70,10]) rotate([90,45,0]) tooth_wheel(n=24,type="idler");