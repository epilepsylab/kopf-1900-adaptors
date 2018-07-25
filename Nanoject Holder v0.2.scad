// Nanoject holder for Cartesian stereotaxic frame
// Pedersen Lab, January 2018

resolution = 100;
wedge_h = 40; // should be 45
wedge_base_w = 18;
wedge_depth = 6.5;
wedge_neck_w = 11;
wedge_base_to_center = 23;
holder_width = 40; // 31.5 makes symmetrical
nanoject_neck = 19.2;
fastener_gap = 0.3;
//fastener_lug_size = 10;
fastener_screw_hole_size = 6;
fastener_head_size = 9.25;
fastener_nut_width = 9.5;
fastener_head_depth = 5;

difference () {
    union () {
        translate ([0,0,-wedge_h/2])
        linear_extrude (height=wedge_h, center=true, convexity=10, twist=0)
        polygon (  [[wedge_base_w/2, 0], [-wedge_base_w/2, 0],
                    [wedge_neck_w/2, wedge_depth], [-wedge_neck_w/2, wedge_depth],
                    [holder_width/2, wedge_depth], [-holder_width/2, wedge_depth],
                    [holder_width/2, wedge_depth+holder_width], [-holder_width/2, wedge_depth+holder_width]
                   ], [[0,1,3,5,7,6,4,2,0]]
        );
 //       translate ([holder_width/2+fastener_lug_size/2, wedge_base_to_center, -wedge_h/2]) 
 //       minkowski () {
 //           cube (fastener_lug_size, center=true);
 //           sphere (0.2);
 //       }
    }   
    union () { // subtracted shapes
       translate ([0,wedge_base_to_center,-wedge_h/2]) cylinder (d=nanoject_neck, h=wedge_h+1, center=true, $fn=resolution);
//       translate ([holder_width/2,wedge_base_to_center,-wedge_h/2]) cube ([holder_width, fastener_gap, wedge_h+1], center=true); // for fastener gap to the side
       translate ([0,(holder_width+wedge_depth),-wedge_h/2]) cube ([fastener_gap, holder_width, wedge_h+1], center=true); // for fastener in front
       translate ([0,40,-wedge_h/2]) rotate ([0,90,0]) cylinder (d=fastener_screw_hole_size, h=holder_width+1, center=true, $fn=resolution); 
       translate ([holder_width/2,40,-wedge_h/2]) rotate ([0,90,0]) cylinder (d=fastener_head_size, h=fastener_head_depth*2, center=true, $fn=resolution); 
       translate ([-holder_width/2,40,-wedge_h/2]) rotate ([0,90,0]) cylinder (d=fastener_nut_width, h=fastener_head_depth*2, center=true, $fn=6);        
    }
}

// any final added positives