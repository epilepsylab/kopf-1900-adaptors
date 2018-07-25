// drill adapter for small drill bits and Cartesian (Kopf) stereotaxic drill
// printed with Asiga PICO2 39 µm 385 nm (UV)

drill_diam = 1.5875; // 1/16 inch, common sizes are 1/8, 3/32 and 1/16

difference () {
    cylinder (h=9.7,d1=7.64,d2=4.79,center=true,$fn=360);
    union () {
        cylinder (h=10,d=drill_diam,center=true,$fn=360);
        translate ([-0.01,-5,-5]) cube (10);
    }
}
