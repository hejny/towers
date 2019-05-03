
/*
translate([-20,0,0]) {
    
intersection() {
    cube(15, center=true);
    
    translate([-2,0,0]) {
        sphere(10);
    }
}


}
*/


/*/

 difference(){
    
    cube(100, true);


    translate([-50,0,0]) {
        cube([10,80,100],true);
    }
}


 translate([0,0,50]) {
            cube([10,80,100],true);
        }
/**/

module door(size=[60,10,100]) {
    translate([0,0,size[2]/2]) {
        difference() {
            cube(size,true);
            difference() {
                translate([0,0,size[2]/2-size[0]/4]) {
                    cube([size[0],size[1],size[0]/2],true);
                }
                translate([0,0,size[2]/2-size[0]/2]) {
                    rotate([90,90,0]) {
                        cylinder(h=size[1], r1=size[0]/2, r2=size[0]/2, center=true);
                    }
                }  
            }
        }  
    }
}



module cube_portal(size=[60,60,100], portal=[0.7,.1,0.9]) {
    
    difference() {
                
        translate([0,0,size[2]/2]) { 
            cube(size,true);
        }
            
        union(){
            
            translate([0,(size[1]/2-size[1]*portal[1]/2),0]) { 
                door([
                    size[0]*portal[0],
                    size[1]*portal[1],
                    size[2]*portal[2],
                ]);
            }
            
            translate([0,-(size[1]/2-size[1]*portal[1]/2),0]) { 
                door([
                    size[0]*portal[0],
                    size[1]*portal[1],
                    size[2]*portal[2],
                ]);
            }
            
            rotate([0,0,90]) {
                translate([0,(size[1]/2-size[1]*portal[1]/2),0]) { 
                    door([
                        size[0]*portal[0],
                        size[1]*portal[1],
                        size[2]*portal[2],
                    ]);
                }
                
                translate([0,-(size[1]/2-size[1]*portal[1]/2),0]) { 
                    door([
                        size[0]*portal[0],
                        size[1]*portal[1],
                        size[2]*portal[2],
                    ]);
                }
            }
        
        }
    
    }
}


cube_portal([40,40,40]);




