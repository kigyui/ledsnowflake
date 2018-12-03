sh = 10;
wa = 2;
swa =1 ;
*color("white") cylinder(r=56,h=1,$fn=6);


difference() {
    union() {
cylinder(r=23,h=sh,$fn=6);

difference() { arm();
    translate([50,10,4])
    rotate([90,0,0]) cylinder(r=2.5,h=20,$fn=100);
}

rotate([0,0,60]) arm();
rotate([0,0,120]) arm();
rotate([0,0,180]) arm();
rotate([0,0,240]) arm();
rotate([0,0,300]) arm();
}
cylinder(r=23-wa,h=sh-swa,$fn=6);
rotate([0,0,60]) translate([0,wa-5,0]) cube([50,10-wa*2,sh-swa]);
rotate([0,0,120]) translate([0,wa-5,0]) cube([50,10-wa*2,sh-swa]);
rotate([0,0,180]) translate([0,wa-5,0]) cube([50,10-wa*2,sh-swa]);
rotate([0,0,240]) translate([0,wa-5,0]) cube([50,10-wa*2,sh-swa]);
rotate([0,0,300]) translate([0,wa-5,0]) cube([50,10-wa*2,sh-swa]);
rotate([0,0,0]) translate([0,wa-5,0]) cube([50,10-wa*2,sh-swa]);

}



module arm() {
translate([0,-5,0]) {

    difference() {
        union() { translate([50,5,0]) cylinder(r=5.8,h=sh,$fn=6);
        cube([50,10,sh]);            
translate([30,5,0]) rotate([0,0,60]) tarm();
translate([30,5,0]) rotate([0,0,-60]) tarm();            
        }
        union() {
        translate([50,5,0]) cylinder(r=5.5-wa,h=sh-swa,$fn=6);
        translate([0,wa,0]) cube([50,10-wa*2,sh-swa]);
        translate([30,5,0]) scale([1,.5,1]) cylinder(r=2,h=100,$fn=10);
        translate([48,5,0]) scale([1,.5,1]) cylinder(r=2,h=100,$fn=10);

    }
}
}
}

module tarm() {
translate([10,0,0]){
    difference() { 
        union() {
translate([0,0,sh/2]) cube([23,8,sh],center=true);
translate([10,0,0]) cylinder(r=4.6,h=sh,$fn=6);
        }
    union() {
translate([0,0,sh/2-wa/2]) cube([23,8-wa*2,sh-swa],center=true);
translate([10,0,0]) cylinder(r=4.6-wa,h=sh-swa,$fn=6);        
    }
}
}
}