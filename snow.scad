sh = 10; // height of snowflake in mm (10mm)
wa = 2;  // wall thickness in mm (2mm)
swa = 1 ; // thickness of front face in mm (1mm)
*color("white") cylinder(r=56,h=1,$fn=6);

middlebit = 23; // centre hexagon size (23mm)

difference() {
    union() {
        cylinder(r=middlebit,h=sh,$fn=6);
        
        difference() { 
            arm();
            // hole for string to hang it
            translate([50,10,4]) rotate([90,0,0]) cylinder(r=2.5,h=20,$fn=100);
        }
        for (i=[60:60:300]) {
            rotate([0,0,i]) arm();
        }
    }
    cylinder(r=middlebit-wa,h=sh-swa,$fn=6);
    for (i=[0:60:300]) {    
        rotate([0,0,i]) translate([0,wa-5,0]) cube([50,10-wa*2,sh-swa]);
    }
}

module arm() {
    armwidth = 10;
    translate([0,-armwidth/2,0]) {
        difference() {
            union() { 
                translate([50,armwidth/2,0]) cylinder(r=armwidth/2*1.154701,h=sh,$fn=6);
                cube([50,armwidth,sh]);            
                translate([30,5,0]) rotate([0,0,60]) tarm();
                translate([30,5,0]) rotate([0,0,-60]) tarm();            
            }
            union() {
                translate([50,armwidth/2,0]) cylinder(r=5.5-wa,h=sh-swa,$fn=6);
                translate([0,wa,0]) cube([50,armwidth-wa*2,sh-swa]);
                translate([30,armwidth/2,0]) scale([1,.5,1]) cylinder(r=2,h=100,$fn=10);
                translate([48,armwidth/2,0]) scale([1,.5,1]) cylinder(r=2,h=100,$fn=10);
            }
        }
    }
}

module tarm() {
    tarmwidth = 8;
    translate([10,0,0]) {
        difference() { 
            union() {
                translate([0,0,sh/2]) cube([23,tarmwidth,sh],center=true);
                translate([10,0,0]) cylinder(r=(tarmwidth/2)*1.154701,h=sh,$fn=6);
            }
            union() {
                translate([0,0,sh/2-wa/2]) cube([23,tarmwidth-wa*2,sh-swa],center=true);
                translate([10.8,0,0]) cylinder(r=(tarmwidth/2-wa)*1.154701,h=sh-swa,$fn=6);        
            }
        }
    }
}
