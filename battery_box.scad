include <boxes.scad>
module batterybox() {
difference() {
roundedBox([88.5,44.5,23],6,1);
//USB Out
translate([-45,-44.5/2+13.6/2+7,23/2-6.2/2-6]) cube([3,13.6,6.2],center=true);
//USB In
translate([-45,44.5/2-8.3/2-7.5,-23/2+3.3/2+7]) cube([3,8.3,3.3],center=true);
}
}

module batterybox_boundaries() {
minkowski () {
union() {
roundedBox([88.5,44.5,23],6,1);
translate([-64,-44.5/2+13.6/2+7,23/2-6.2/2-6]) cube([45,13.6,6.2],center=true);
translate([-49,44.5/2-8.3/2-7.5,-23/2+3.3/2+7]) cube([30,10,8],center=true);
}
cube([0.5,0.5,0.5]);
}
}
batterybox_boundaries();